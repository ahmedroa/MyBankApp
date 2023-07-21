// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/cubit/cubit.dart';
import 'package:my_bank/layout/screens/detailsCard.dart';
import 'package:my_bank/layout/screens/history.dart';
import 'package:my_bank/layout/widgets/MyCard.dart';
import 'package:my_bank/layout/widgets/TransactionCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = AppBankCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://pbs.twimg.com/profile_images/1669852053731000320/esNr87L8_400x400.jpg"),
                ),
                const SizedBox(
                  width: 10,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 6),
                //   child: Text(
                //     '${cubit.userModel!.email}',
                //     // ignore: deprecated_member_use .
                //     style: Theme.of(context).textTheme.headline1,
                //   ),
                // ),
                const Spacer(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
                // IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
                IconButton(
                    onPressed: () {
                      AppBankCubit.get(context).getDataAdmn();
                    },
                    icon: const Icon(Icons.brightness_4_outlined)),
              ],
            ),
          ),
          InkWell(
            onTap: () => navigateTo(context, const DetailsCard()),
            child: const MyCard(
              color: Color.fromARGB(255, 116, 79, 152),
            ),
          ),
          // Image.asset('image/card.png'),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Container(
              width: double.infinity,
              height: 90,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: AppBankCubit.get(context).isDark ? MyColors.containerDark : MyColors.containerlight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    buildItime(icon: Icons.add_card, label: 'اضاة بطاقة'),
                    buildItime(icon: Icons.currency_exchange, label: 'تحويل'),
                    buildItime(icon: Icons.add, label: 'سحب بدون بطاقه'),
                    // buildItime(icon: Icons.add, label: 'add'),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Text(
                  "التحويلات الاخيرة",
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    navigateTo(context, const History());
                  },
                  child: Row(
                    children: [
                      Text(
                        "إظهار الكل",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              // color: Colors.white,
              height: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12),
                child: TransactionCard(),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
