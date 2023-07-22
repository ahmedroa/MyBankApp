// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/cubit/cubit.dart';

class TransactionCard extends StatefulWidget {
  const TransactionCard({Key? key}) : super(key: key);

  @override
  State<TransactionCard> createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => bulidCard(context),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: 20);
    // return
  }
}

bulidCard(context) => Container(
      decoration: BoxDecoration(
        color: AppBankCubit.get(context).isDark ? MyColors.containerDark : MyColors.containerlight,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15)),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.shopping_cart_sharp),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'سحب ',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Text(
                  '22 july | 10:40',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '- \$ 55.500',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: MyColors.green, fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
