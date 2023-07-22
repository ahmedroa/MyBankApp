// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, unnecessary_this, body_might_complete_normally_catch_error
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/layout/screens/bottom_navbar.dart';
import 'package:my_bank/layout/widgets/massage.dart';
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
      phoneNumber: '+2  $phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

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

  signin({required String email, required String passpprd}) async {
    try {
      emit(Loading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: passpprd);
      emit(LoginSuccessful());
      message(message: 'تم تسجيبل الدخول بنجاح ', color: Colors.grey.shade800);
    } on FirebaseAuthException catch (exception) {
      emit(LogoutFailed());
      if (exception.code == 'user-not-found') {
        message(message: 'لم يتم العثور على مستخدم لهذا البريد الإلكتروني', color: Colors.red);
      } else if (exception.code == 'wrong-password') {
        message(message: 'البريد الاكتروني وكلمة المرور غير متطابقان', color: Colors.red);
      }
    }
  }

  signUp({required String email, required String passpprd, required String name, required String phone}) async {
    emit(Loading());
    try {
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: phone).then((userData) {
        UserModel model =
            UserModel(uId: userData.user!.uid, email: email, password: passpprd, name: name, phone: phone);
        FirebaseFirestore.instance.collection('user').doc(userData.user!.uid).set(model.toJson());
        submitPhoneNumber(phone);

        emit(LoginSuccessful());
      });
    } catch (e) {}
  }
}
