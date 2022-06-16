import 'package:flutter/material.dart';
import 'package:kosan_apps/models/tips.dart';
import 'package:kosan_apps/themes.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;

  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(
              'Updated ${tips.update}',
              style: greyTextStyle.copyWith(fontSize: 12),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
          color: greyColor,
        )
      ],
    );
  }
}
