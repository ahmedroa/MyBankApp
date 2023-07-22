// ignore_for_file: depend_on_referenced_packages, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_bank/Auth/loginScreen.dart';
import 'package:my_bank/Auth/veriffication.dart';
import 'package:my_bank/Themes/app_theme.dart';
import 'package:my_bank/cubit/cubit.dart';
import 'package:my_bank/layout/screens/bottom_navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    late bool islogin;
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      islogin = false;
    } else {
      islogin = true;
    }
    return BlocProvider(
      create: (BuildContext context) => AppBankCubit(),
      child: BlocConsumer<AppBankCubit, AppBankState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              localizationsDelegates: const [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale("ar", "AE")
              ],
              locale: const Locale("ar", "AE"),
              debugShowCheckedModeBanner: false,
              darkTheme: darkTheme,
              theme: lightTheme,
              themeMode: AppBankCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              // home: islogin == false ? const Login() : const BottomNavbar());
              home: const Login());
        },
      ),
    );
  }
}
