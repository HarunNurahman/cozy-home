import 'package:flutter/material.dart';
import 'package:kosan_apps/models/city.dart';
import 'package:kosan_apps/themes.dart';

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

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
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isFavorited
                    ? Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 50,
                          height: 30,
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            ),
                          ),
                          child: Center(
                            child: const Icon(
                              Icons.star,
                              color: Color(0xFFFF9376),
                              size: 22,
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
            const SizedBox(height: 11),
            Text(
              city.name,
              style: blackTextStyle.copyWith(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
