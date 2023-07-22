// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, no_leading_underscores_for_local_identifiers, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/cubit/cubit.dart';
import 'package:my_bank/layout/screens/bottom_navbar.dart';
import 'package:my_bank/layout/widgets/massage.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Veriffication extends StatefulWidget {
  const Veriffication({super.key});

  @override
  State<Veriffication> createState() => _VerifficationState();
}

class _VerifficationState extends State<Veriffication> {
  @override
  Widget _buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      autoFocus: true,
      cursorColor: MyColors.purple,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        borderWidth: 1,
        activeColor: MyColors.blue,
        inactiveColor: MyColors.blue,
        inactiveFillColor: Colors.white,
        activeFillColor: MyColors.lightGrey,
        selectedColor: MyColors.purple,
        selectedFillColor: Colors.white,
      ),
      animationDuration: const Duration(milliseconds: 300),
      // backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submitedCode) {
        // otpCode = submitedCode;
      },
      onChanged: (value) {},
    );
  }

  late String otpCode;
  void _login(BuildContext context) {
    BlocProvider.of<AppBankCubit>(context).submitOTP(otpCode);
  }

  Widget _buildPhoneVerificationBloc() {
    return BlocListener<AppBankCubit, AppBankState>(
      listenWhen: (previous, current) {
        return previous != current;
      },
      listener: (context, state) {
        if (state is Loading) {
          showProgressIndicator(context);
        }

        if (state is PhoneOTPVerified) {
          Navigator.pop(context);
          navigateTo(context, BottomNavbar());
        }

        if (state is ErrorOccurred) {
          Navigator.pop(context);
          String errorMsg = (state).errorMsg;
          message(message: errorMsg, color: Colors.red);
        }
      },
      // child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
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
            const SizedBox(
              height: 80,
            ),
            Text(
              'كود التحقق',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              'ادخل الكود المؤلف من 6 ارقام',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey[700], fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            _buildPinCodeFields(context),
            const SizedBox(
              height: 12,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                  width: 150,
                  height: 50,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: MyColors.purple,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        showProgressIndicator(context);

                        _login(context);
                      },
                      child: Text(
                        'تَحَقّق',
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
            ),
            Spacer(),
            Column(
              children: [
                Text(
                  'لم يصلني الكود',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'إعادة إرسال',
                      style:
                          Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      '|',
                      style:
                          Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'تغير الرقم',
                      style:
                          Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            _buildPhoneVerificationBloc()
          ],
        ),
      )),
    );
  }
}
