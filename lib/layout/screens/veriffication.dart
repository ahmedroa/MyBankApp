import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/layout/screens/bottom_navbar.dart';
import 'package:my_bank/layout/screens/home.dart';
import 'package:my_bank/layout/widgets/MainButton.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Veriffication extends StatelessWidget {
  const Veriffication({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
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

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_back_ios_new,
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
                  ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 12,
            ),
            _buildPinCodeFields(context),
            Text(
              'اعادة ارسال',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: MyColors.purple),
            ),
            const Spacer(),
            MainButton(
              text: 'تَحَقّق',
              onTap: () {
                navigateTo(context, const BottomNavbar());
                // if (_formKey.currentState!.validate()) {
                // }
              },
            )
          ],
        ),
      )),
    );
  }
}
