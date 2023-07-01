import 'package:flutter/material.dart';
import 'package:gerocaryapp/constance.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good morning !",
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(fontSize: 18),
                ),
                Text(
                  "Caesar Rincon",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(fontSize: 20, color: Colors.black),
                )
              ],
            ),
            const CircleAvatar(
              radius: 23,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/images/profile.png'),
            )
          ]),
    );
  }
}
