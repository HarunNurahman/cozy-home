import 'package:flutter/material.dart';
import 'package:kosan_apps/models/city.dart';
import 'package:kosan_apps/models/spaces.dart';
import 'package:kosan_apps/models/tips.dart';
import 'package:kosan_apps/themes.dart';
import 'package:kosan_apps/widgets/bottom_navbar_item.dart';
import 'package:kosan_apps/widgets/city_card.dart';
import 'package:kosan_apps/widgets/space_card.dart';
import 'package:kosan_apps/widgets/tips_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(height: edge),
            // HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            // POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: edge),
                  child: Row(
                    children: [
                      CityCard(
                        City(
                          id: 1,
                          name: 'Jakarta',
                          imageUrl: 'assets/images/img_city_1.png',
                          isFavorited: false,
                        ),
                      ),
                      const SizedBox(width: 20),
                      CityCard(
                        City(
                          id: 2,
                          name: 'Bandung',
                          imageUrl: 'assets/images/img_city_2.png',
                          isFavorited: true,
                        ),
                      ),
                      const SizedBox(width: 20),
                      CityCard(
                        City(
                          id: 3,
                          name: 'Surabaya',
                          imageUrl: 'assets/images/img_city_3.png',
                          isFavorited: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     const SizedBox(width: 24),
              //     CityCard(),
              //     const SizedBox(width: 20),
              //     CityCard(),
              //     const SizedBox(width: 20),
              //     CityCard(),
              //   ],
              // ),
            ),
            const SizedBox(height: 30),
            // RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  SpaceCard(
                    Spaces(
                      id: 1,
                      rating: 4,
                      price: 80,
                      name: 'Kuretakeso Hott',
                      imageUrl: 'assets/images/img_space_1.png',
                      city: 'Kota Bandung',
                      country: 'Indonesia',
                    ),
                  ),
                  const SizedBox(height: 30),
                  SpaceCard(
                    Spaces(
                      id: 2,
                      rating: 4,
                      price: 50,
                      name: 'Roemah Nenek',
                      imageUrl: 'assets/images/img_space_2.png',
                      city: 'Yogyakarta',
                      country: 'Indonesia',
                    ),
                  ),
                  const SizedBox(height: 30),
                  SpaceCard(
                    Spaces(
                      id: 3,
                      rating: 3,
                      price: 100,
                      name: 'Darrling How',
                      imageUrl: 'assets/images/img_space_3.png',
                      city: 'Jakarta Selatan',
                      country: 'Indonesia',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // TIPS & GUIDANCES
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Text(
                'Tips & Guidance',
                style: blackTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      name: 'City Guidelines',
                      update: '15/06/2022',
                      imageUrl: 'assets/images/img_tips_1.png',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TipsCard(
                    Tips(
                      id: 2,
                      name: 'Resident Registration',
                      update: '21/01/2022',
                      imageUrl: 'assets/images/img_tips_2.png',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 70 + edge),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavBarItem(
              imageUrl: 'assets/icons/ic_home_active.png',
              isSelected: true,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icons/ic_message.png',
              isSelected: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icons/ic_payment.png',
              isSelected: false,
            ),
            BottomNavBarItem(
              imageUrl: 'assets/icons/ic_favorited.png',
              isSelected: false,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
