import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/layout/widgets/MyCard.dart';

import '../../cubit/app_bank_cubit.dart';

class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'بطاقاتي',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppBankCubit.get(context).isDark ? MyColors.containerlight : MyColors.containerDark),
              ),
              const MyCard(
                color: Color.fromARGB(255, 116, 79, 152),
              ),
              const SizedBox(
                height: 10,
              ),
              const MyCard(
                color: Color.fromARGB(255, 64, 48, 137),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
