import 'package:flutter/material.dart';
import 'package:kosan_apps/themes.dart';

class CityCard extends StatelessWidget {
  const CityCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: Color(0xFFF6F7F8),
        child: Column(
          children: [
            Image.asset(
              'assets/images/img_city_1.png',
              width: 120,
              height: 102,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 11),
            Text(
              'Jakarta',
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
