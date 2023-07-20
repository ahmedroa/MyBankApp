import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/cubit/app_bank_cubit.dart';
import 'package:my_bank/layout/screens/Register.dart';
import 'package:my_bank/layout/screens/bottom_navbar.dart';
import 'package:my_bank/layout/widgets/MainButton.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = AppBankCubit.get(context).isDark;

    return BlocProvider(
      create: (BuildContext context) => AppBankCubit(),
      child: Scaffold(
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
                          decoration: InputDecoration(
                            labelStyle: TextStyle(color: cubit ? MyColors.containerlight : MyColors.containerDark),
                            labelText: 'البريد الالكتروني',
                            hintText: 'Enter your email!',
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
                        // if (_authType == AuthFormType.login)
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
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(height: 24.0),

                        MainButton(
                          text: 'تسجيل الدخول',
                          onTap: () {
                            // if (_formKey.currentState!.validate()) {
                            navigateTo(context, BottomNavbar());
                            // }
                          },
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
      ),
    );
  }
}
