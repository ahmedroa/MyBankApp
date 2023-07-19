import 'package:flutter/material.dart';
import 'package:my_bank/constants/my_colors.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
  }) : super(key: key);

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
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
              // height: 60,
              // width: 60,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // color: transaction.color,
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black, fontSize: 18),
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

buildItime({
  required String label,
  required IconData icon,
}) =>
    Expanded(
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
              Text(label)
            ],
          )
        ],
      ),
    );
