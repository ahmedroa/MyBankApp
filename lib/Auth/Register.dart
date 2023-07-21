import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank/Auth/veriffication.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/cubit/cubit.dart';

import 'package:flutter/material.dart';
import 'package:my_bank/model/userModel.dart';

import '../layout/screens/bottom_navbar.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool isChecked = false;
  bool isVisible = true;
  bool isClicked = false;

  String generateCountryFlag() {
    String countryCode = 'SA';

    String flag = countryCode.toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
        );

    return flag;
  }

  Widget _buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.purple),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: TextFormField(
              // autofocus: true,
              controller: _phoneController,
              style: const TextStyle(
                fontSize: 18,
                letterSpacing: 2.0,
              ),
              decoration: const InputDecoration(border: InputBorder.none),
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter yout phone number!';
                } else if (value.length < 11) {
                  return 'Too short for a phone number!';
                }
                return null;
              },
              onSaved: (value) {
                // phoneNumber = value!;
              },
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: MyColors.purple),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: Text(
              // ignore: prefer_interpolation_to_compose_strings
              generateCountryFlag() + ' +966',
              // ignore: prefer_const_constructors
              style: TextStyle(fontSize: 16, letterSpacing: 1.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberSubmitedBloc() {
    return BlocListener<AppBankCubit, AppBankState>(
      listenWhen: (previous, current) {
        return previous != current; // == Loding
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }

        if (state is PhoneNumberSubmited) {
          Navigator.pop(context);
          // navigateAndFinish(context, MapScreen(phoneNumber: phoneNumber));
        }

        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMsg),
              backgroundColor: Colors.black,
              duration: Duration(seconds: 3),
            ),
          );
        }
      },
      child: Container(),
    );
  }

  void showProgressIndicator(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cubit = AppBankCubit.get(context).isDark;

    return Scaffold(
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40.0,
            horizontal: 25.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      )),
                  const SizedBox(height: 90.0),
                  Text('حساب جديد',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: cubit ? MyColors.containerlight : MyColors.containerDark,
                          fontSize: 26,
                          fontWeight: FontWeight.bold)),
                  TextFormField(
                    controller: _nameController,
                    focusNode: _nameFocusNode,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    validator: (val) => val!.isEmpty ? 'Please enter your name!' : null,
                    decoration: InputDecoration(
                      labelText: 'اسم المستخدم',
                      labelStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                      hintText: 'ادخل اسم مستخدم جديد',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.purple,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    focusNode: _emailFocusNode,
                    validator: (val) => val!.isEmpty ? 'Please enter your email!' : null,
                    decoration: InputDecoration(
                      labelText: 'البريد الالكتروني',
                      labelStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                      hintText: ' ادخل البريد الالكتروني!',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.purple,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    validator: (val) => val!.isEmpty ? 'Please enter your password!' : null,
                    decoration: InputDecoration(
                      labelText: 'كلمة المرور',
                      labelStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                      hintText: 'ادخل كلمة المرور!',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: MyColors.purple,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  _buildPhoneFormField(),

                  const SizedBox(height: 16.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: MyColors.purple,
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        'أوافق على الشروط والأحكام وسياسة الخصوصية',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey[600], fontSize: 14),
                      ),
                    ],
                  ),
                  Container(
                    height: 42.0,
                    width: double.infinity,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      // color: kTextColor,
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    child: MaterialButton(
                      color: MyColors.purple,
                      height: 42.0,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isClicked = true;
                          });
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text, password: _passwordController.text)
                              .then((userData) {
                            UserModel model = UserModel(
                              uId: userData.user!.uid,
                              email: _emailController.text,
                              password: _passwordController.text,
                              name: _nameController.text,
                              phone: _phoneController.text,
                            );
                            FirebaseFirestore.instance
                                .collection('admin')
                                .doc(userData.user!.uid)
                                .set(model.toJson())
                                .then((value) {
                              BlocProvider.of<AppBankCubit>(context).submitPhoneNumber(_phoneController.text);

                              setState(() {
                                isClicked = false;
                              });
                              navigateTo(context, const Veriffication());
                            }).catchError((error) {});
                          });
                        }
                      },
                      child: isClicked
                          ? const CupertinoActivityIndicator(color: Colors.white)
                          : const Text(
                              'تسجيل',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                    ),
                  ),
                  _buildPhoneNumberSubmitedBloc(),
                  const SizedBox(height: 16.0),
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: InkWell(
                  //     child: Text(
                  //       'alteady have on account ? Sign up',
                  //       style: Theme.of(context).textTheme.labelLarge?.copyWith(color: MyColors.purple),
                  //     ),
                  //     onTap: () {
                  //       _formKey.currentState!.reset();
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
