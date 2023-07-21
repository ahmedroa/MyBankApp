import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/layout/widgets/massage.dart';

import '../cubit/cubit.dart';

class ForgotYourPassword extends StatefulWidget {
  const ForgotYourPassword({super.key});

  @override
  State<ForgotYourPassword> createState() => _ForgotYourPasswordState();
}

class _ForgotYourPasswordState extends State<ForgotYourPassword> {
  final _formKey = GlobalKey<FormState>();

  bool isVisible = true;
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    var cubit = AppBankCubit.get(context).isDark;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Form(
          // key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                goBack(context),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 60.0,
                      horizontal: 32.0,
                    ),
                    child: Column(
                      children: [
                        // Text('تسجيل الدخول',
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .titleLarge!
                        //         .copyWith(color: cubit ? MyColors.containerlight : MyColors.containerDark)),
                        // const SizedBox(height: 80.0),
                        TextFormField(
                          // controller: _emailController,
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
                            color: MyColors.purple,
                            height: 42.0,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isClicked = true;
                                });

                                try {} catch (e) {}
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
                      ],
                    ),
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
