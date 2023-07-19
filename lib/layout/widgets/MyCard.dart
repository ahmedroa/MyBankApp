import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'بطاقاتي',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.grey[800]),
          ),
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 116, 79, 152),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                                  // style: TextStyle(color: kThirdColor),
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
                                  // style: TextStyle(color: kThirdColor),
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
                    ]),
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
          ),
        ],
      ),
    );
  }
}