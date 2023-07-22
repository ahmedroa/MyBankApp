// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';

class MyCard extends StatelessWidget {
  final color;
  const MyCard({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Ahmed khalid",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
              ),
              const Text(
                'حساب توفير',
                style: TextStyle(color: MyColors.lightBlue),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ' **** **** **** 1234',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColors.lightBlue),
              ),
              const SizedBox(
                height: 40,
              ),
              const Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "EXP DATE",
                    ),
                    Text(
                      '12/21',
                      style: TextStyle(color: MyColors.lightBlue),
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CVV NUMBER",
                    ),
                    Text(
                      "**4",
                      style: TextStyle(color: MyColors.lightBlue),
                      // style: ApptextStyle.MY_CARD_SUBTITLE,
                    ),
                  ],
                ),
              ]),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.network(
                      'https://w7.pngwing.com/pngs/23/320/png-transparent-mastercard-credit-card-visa-payment-service-mastercard-company-orange-logo.png'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
