// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/layout/screens/bottom_navbar.dart';
import 'package:my_bank/model/userModel.dart';

part 'app_bank_state.dart';

class AppBankCubit extends Cubit<AppBankState> {
  AppBankCubit() : super(AppBankInitial());
  static AppBankCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  changeAppMode() {
    isDark = !isDark;
    emit(AppBankCheanModeState());
  }

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(Loading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+2$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

// 01287729832
  void verificationCompleted(PhoneAuthCredential credential) async {
    print('verificationCompleted');
    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
    print('verificationFailed : ${error.toString()}');
    emit(ErrorOccurred(errorMsg: error.toString()));
    print(error);
  }

  late String verificationId;

  void codeSent(String verificationId, int? resendToken) {
    print('codeSent');
    this.verificationId = verificationId;
    emit(PhoneNumberSubmited());
  }

  void codeAutoRetrievalTimeout(String verificationId) {
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: this.verificationId, smsCode: otpCode);

    await signIn(credential);
    emit(PhoneNumberSubmited());
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      emit(PhoneOTPVerified());
    } catch (error) {
      print('=========================');
      print('=========================');
      print('=========================');
      print(error);
      print('=========================');

      emit(ErrorOccurred(errorMsg: error.toString()));
    }
  }

  Future<void> logOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();
      navigateTo(context, const BottomNavbar());
      Fluttertoast.showToast(
        msg: 'Logout successful',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        // timeInSecForIosWeb: 1,
        backgroundColor: MyColors.blue,

        textColor: MyColors.lightGrey,
        fontSize: 16.0,
      );
      emit(LogoutSuccessful());
    } catch (e) {
      print(e);
    }
  }

  User getLoggedInUser() {
    User firebaseUser = FirebaseAuth.instance.currentUser!;
    return firebaseUser;
  }

  String? uid;
  UserModel? userModel;
  var uIDd;
  getDataAdmn() async {
    uIDd = FirebaseAuth.instance.currentUser!.uid;
    emit(GetDataUserLodingState());
    FirebaseFirestore.instance
        .collection('admin')
        .doc('uqCyXIbO3mORabSpoEn7uFfeirc2')
        .get()
        .then((value) => {
              emit(GetDataUserSussesState()),

              // user = UserDataModel.fromJson(value.data()!);
              userModel = UserModel.fromJson(value.data()!),
              debugPrint(userModel!.email),
            })
        .catchError((e) {
      debugPrint(e.toString());
      debugPrint('======================================');

      emit(GetDataUserErrorgState());
    });
  }

  // getDataUser() async {
  //   uid = FirebaseAuth.instance.currentUser!.uid;
  //   emit(GetDataUserLodingState());
  //   FirebaseFirestore.instance
  //       .collection('admin')
  //       .doc('uqCyXIbO3mORabSpoEn7uFfeirc2')
  //       .get()
  //       .then((value) => {
  //             emit(GetDataUserSussesState()),
  //             print(userModel),
  //             userModel = UserModel.fromJson(value.data()!),
  //           })
  //       .catchError((e) {
  //     emit(GetDataUserErrorgState());
  //   });
  // }
}
