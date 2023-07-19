import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
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
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 60.0,
            horizontal: 32.0,
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image.asset('image/login.png'),
                  Text('تسجيل الدخول',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 80.0),
                  TextFormField(
                    controller: _emailController,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocusNode),
                    textInputAction: TextInputAction.next,
                    validator: (val) => val!.isEmpty ? 'Please enter your email!' : null,
                    decoration: const InputDecoration(
                      labelText: 'البريد الالكتروني',
                      hintText: 'Enter your email!',
                      enabledBorder: OutlineInputBorder(
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
                    decoration: const InputDecoration(
                      labelText: 'كلمة المرور',
                      hintText: 'Enter your pasword!',
                      enabledBorder: OutlineInputBorder(
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
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  MainButton(
                    text: 'تسجيل الدخول',
                    onTap: () {
                      // if (_formKey.currentState!.validate()) {
                      navigateTo(context, const BottomNavbar());
                      // }
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        // navigateTo(context,  )
                      },
                      child: Text(
                        'الدخول عن طريق رقم الجوال',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                      )),
                  const SizedBox(height: 16.0),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      child: Text(
                        "تسجيل حساب جديد",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      onTap: () {
                        navigateTo(context, const Register());
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.09),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
