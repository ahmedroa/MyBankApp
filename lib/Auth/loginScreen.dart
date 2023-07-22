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
import 'package:my_bank/layout/widgets/MainButton.dart';
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

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    var cubit = AppBankCubit.get(context);

    return Scaffold(
      body: BlocConsumer<AppBankCubit, AppBankState>(
        listener: (context, state) {
          if (state is Loading) {
            showProgressIndicator(context);
          }
          if (state is LoginSuccessful) {
            Navigator.of(context).pop();

            navigateAndFinish(context, const BottomNavbar());
          }
          if (state is LogoutFailed) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            cubit.changeAppMode();
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
                                  .copyWith(color: cubit.isDark ? MyColors.green : MyColors.containerDark)),
                          const SizedBox(height: 80.0),
                          TextFormField(
                            controller: _emailController,
                            textInputAction: TextInputAction.next,
                            validator: (val) => val!.isEmpty ? 'Please enter your email!' : null,

                            style: TextStyle(
                                color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark), // color text
                            cursorColor: MyColors.purple,
                            // showCursor: true,
                            decoration: InputDecoration(
                              labelStyle:
                                  TextStyle(color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark),
                              labelText: 'البريد الالكتروني',
                              hintText: 'Enter your email!',
                              helperStyle:
                                  TextStyle(color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark),
                              hintStyle:
                                  TextStyle(color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark),
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
                              labelStyle:
                                  TextStyle(color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark),
                              hintText: 'Enter your pasword!',
                              hintStyle:
                                  TextStyle(color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark),
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
                                    .copyWith(color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark),
                              ),
                              onTap: () {
                                navigateTo(context, const ForgotYourPassword());
                              },
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          MainButton(
                              text: 'تسجيل الدخول',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.signin(email: _emailController.text, passpprd: _passwordController.text);
                                }
                              }),
                          const SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Text(
                                "تسجيل حساب جديد",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: cubit.isDark ? MyColors.containerlight : MyColors.containerDark),
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
          );
        },
      ),
    );
  }
}
