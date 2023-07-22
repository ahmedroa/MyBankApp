// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';

class BuildItime extends StatelessWidget {
  final String label;
  final IconData icon;

  const BuildItime({
    super.key,
    required this.label,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: MyColors.lightBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                  ),
                  child: Icon(icon)),
              Text(
                label,
                style: Theme.of(context).textTheme.headline1,
              )
            ],
          )
        ],
      ),
    );
  }
}
