import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/layout/widgets/MyCard.dart';

import '../../cubit/app_bank_cubit.dart';
import 'profile.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'بطاقاتي',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppBankCubit.get(context).isDark ? MyColors.containerlight : MyColors.containerDark),
              ),
              // SizedBox(height: 40),
              const MyCard(
                color: Color.fromARGB(255, 116, 79, 152),
              ),
              const SizedBox(height: 12),
              const BuildEditProfile(text: 'احصائيات', texttow: 'معاملات البطاقة'),
              const SizedBox(height: 12),
              const BuildEditProfile(text: 'كشف حساب', texttow: 'طلب كشف حساب'),
              const SizedBox(height: 12),
              const BuildEditProfile(text: 'دفع والتحويل', texttow: 'قم بالدع او التحويل'),
              const SizedBox(height: 12),
              const BuildEditProfile(text: 'حذف البطاقة', texttow: 'هل تريد حذ البطاقه؟'),
              const SizedBox(height: 12),
              const BuildEditProfile(text: 'المساعدة & الدعم الفني ', texttow: 'هل تحتاج إلى مساعدة ؟'),
              const SizedBox(height: 12)
            ],
          ),
        ),
      ),
    );
  }
}
