import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:my_bank/cubit/cubit.dart';
import 'package:my_bank/layout/widgets/TransactionCard.dart';

import '../../constants/my_colors.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'العمليات',
                  // ignore: deprecated_member_use
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            // Text('Day'),
            CustomSlidingSegmentedControl<int>(
              initialValue: 2,
              children: {
                1: Text('اليوم', style: Theme.of(context).textTheme.titleMedium),
                2: Text('اخر 7 ايام ', style: Theme.of(context).textTheme.titleMedium),
                3: Text('عمليات هذا الشهر ', style: Theme.of(context).textTheme.titleMedium),
              },
              decoration: BoxDecoration(
                color: AppBankCubit.get(context).isDark ? MyColors.containerDark : MyColors.containerlight,
                borderRadius: BorderRadius.circular(16),
              ),
              thumbDecoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: const Offset(
                      0.0,
                      2.0,
                    ),
                  ),
                ],
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.linearToEaseOut,
              onValueChanged: (v) {},
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(),
                child: const Padding(
                  padding: EdgeInsets.only(left: 12, right: 12),
                  child: TransactionCard(),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
