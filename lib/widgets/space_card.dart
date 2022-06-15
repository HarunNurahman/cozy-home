import 'package:flutter/material.dart';
import 'package:kosan_apps/models/spaces.dart';
import 'package:kosan_apps/themes.dart';

class SpaceCard extends StatelessWidget {
  final Spaces spaces;

  SpaceCard(this.spaces);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 130,
            height: 110,
            child: Stack(
              children: [
                Image.asset(spaces.imageUrl),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Color(0xFFFF9376),
                          size: 22,
                        ),
                        Text(
                          '${spaces.rating}/5',
                          style: whiteTextStyle.copyWith(
                            fontSize: 13,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              spaces.name,
              style: blackTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(height: 2),
            RichText(
              text: TextSpan(
                text: '\$${spaces.price}',
                style: purpleTextStyle.copyWith(fontSize: 14),
                children: [
                  TextSpan(
                    text: '/month',
                    style: greyTextStyle.copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${spaces.city}, ${spaces.country}',
              style: greyTextStyle.copyWith(fontSize: 14),
            )
          ],
        )
      ],
    );
  }
}
