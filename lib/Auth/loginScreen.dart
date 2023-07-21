// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank/Auth/ForgotYourPassword.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/cubit/cubit.dart';
import 'package:my_bank/Auth/Register.dart';
import 'package:my_bank/layout/screens/bottom_navbar.dart';
import 'package:my_bank/layout/screens/home.dart';
import 'package:my_bank/layout/widgets/massage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isVisible = true;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var cubit = AppBankCubit.get(context).isDark;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image.asset('image/login.png'),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {
                        AppBankCubit.get(context).changeAppMode();
                      },
                      icon: const Icon(Icons.brightness_4_outlined)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 60.0,
                    horizontal: 32.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('تسجيل الدخول',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: cubit ? MyColors.containerlight : MyColors.containerDark)),
                      const SizedBox(height: 80.0),
                      TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.next,
                        validator: (val) => val!.isEmpty ? 'Please enter your email!' : null,

                        style: const TextStyle(color: MyColors.purple), // color text
                        cursorColor: MyColors.purple,
                        // showCursor: true,
                        decoration: InputDecoration(
                          labelStyle: const TextStyle(color: MyColors.purple),
                          labelText: 'البريد الالكتروني',
                          hintText: 'Enter your email!',
                          helperStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                          hintStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                          // enabled: false,
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
                        validator: (val) => val!.isEmpty ? 'Please enter your password!' : null,
                        decoration: InputDecoration(
                          labelText: 'كلمة المرور',
                          labelStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                          hintText: 'Enter your pasword!',
                          hintStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
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
                      const SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: Text(
                            'هل نسيت كلمة المرور ؟',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                          ),
                          onTap: () {
                            navigateTo(context, const ForgotYourPassword());
                          },
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      Container(
                        width: double.infinity,
                        height: 50,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: MyColors.purple,
                          borderRadius: BorderRadius.circular(
                            15.0,
                          ),
                        ),
                        child: MaterialButton(
                          height: 42.0,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isClicked = true;
                              });

                              try {
                                await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: _emailController.text, password: _passwordController.text);
                                setState(() {
                                  isClicked = false;
                                });
                                message(message: 'تم تسجيبل الدخول بنجاح ', color: Colors.grey.shade800);
                                navigateAndFinish(context, const BottomNavbar());
                              } on FirebaseAuthException catch (exception) {
                                setState(() {
                                  isClicked = false;
                                });
                                if (exception.code == 'user-not-found') {
                                  message(
                                      message: 'لم يتم العثور على مستخدم لهذا البريد الإلكتروني', color: Colors.red);
                                } else if (exception.code == 'wrong-password') {
                                  message(message: 'البريد الاكتروني وكلمة المرور غير متطابقان', color: Colors.red);
                                }
                              }
                            }
                          },
                          child: isClicked
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : const Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          child: Text(
                            "تسجيل حساب جديد",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                          ),
                          onTap: () {
                            navigateTo(context, const Register());
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
