import 'package:flutter/material.dart';
import 'package:kosan_apps/themes.dart';

class SpaceCard extends StatelessWidget {
  const SpaceCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.asset('assets/images/img_space_1.png'),
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
                            '4/5',
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
                'Kuretakeso Hott',
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: '\$52',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: '/month',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Bandung, Jawa Barat',
                style: greyTextStyle.copyWith(fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
