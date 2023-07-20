import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:my_bank/Themes/app_theme.dart';
import 'package:my_bank/cubit/app_bank_cubit.dart';
import 'package:my_bank/layout/screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = AppBankCubit.get(context);
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
            supportedLocales: const [Locale("ar", "AE")],
            locale: const Locale("ar", "AE"),
            debugShowCheckedModeBanner: false,
            darkTheme: darkTheme,
            theme: lightTheme,
            themeMode: AppBankCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: const Login(),
          );
        },
      ),
    );
  }
}
