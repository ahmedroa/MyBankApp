// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';
import 'package:my_bank/cubit/cubit.dart';
import 'package:my_bank/Auth/loginScreen.dart';
import 'package:my_bank/layout/widgets/MainButton.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SafeArea(
            child: Column(
          children: [
            Text(
              'الملف الشخصي ',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppBankCubit.get(context).isDark ? MyColors.containerlight : MyColors.containerDark),
            ),
            const Spacer(),
            const CircleAvatar(
              minRadius: 60,
              maxRadius: 60,
              backgroundImage: NetworkImage(
                "https://pbs.twimg.com/profile_images/1669852053731000320/esNr87L8_400x400.jpg",
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text('ahmed',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppBankCubit.get(context).isDark ? MyColors.containerlight : MyColors.containerDark)),
            const SizedBox(
              height: 30,
            ),
            const BuildEditProfile(text: 'الملف الشخصي', texttow: 'تعديل الملف الشخصي'),
            const SizedBox(height: 12),
            const BuildEditProfile(text: 'الاشعارات', texttow: 'ضبط الاشعارات'),
            const SizedBox(height: 12),
            const BuildEditProfile(text: 'الخصوصيه', texttow: 'معلومات الخصوصية'),
            const SizedBox(height: 12),
            const BuildEditProfile(text: 'المساعدة & الدعم الفني ', texttow: 'هل تحتاج إلى مساعدة ؟'),
            const SizedBox(height: 12),
            MainButton(
              text: 'تسجيل الخروج',
              onTap: () {
                navigateTo(context, const Login());
              },
            ),
            const SizedBox(height: 25),
          ],
        )),
      ),
    );
  }
}

class BuildEditProfile extends StatelessWidget {
  final String text;
  final String texttow;
  const BuildEditProfile({super.key, required this.text, required this.texttow});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      color: AppBankCubit.get(context).isDark ? MyColors.containerDark : MyColors.containerlight,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.headline1,
                ),
                Text(
                  texttow,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
    );
  }
}
