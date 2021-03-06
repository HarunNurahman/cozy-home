import 'package:flutter/material.dart';
import 'package:kosan_apps/models/city.dart';
import 'package:kosan_apps/models/spaces.dart';
import 'package:kosan_apps/models/tips.dart';
import 'package:kosan_apps/providers/spaces_provider.dart';
import 'package:kosan_apps/themes.dart';
import 'package:kosan_apps/widgets/bottom_navbar_item.dart';
import 'package:kosan_apps/widgets/city_card.dart';
import 'package:kosan_apps/widgets/space_card.dart';
import 'package:kosan_apps/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpacesProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
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
            popularCities(),
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
              child: FutureBuilder<dynamic>(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Spaces> data = snapshot.data ?? [];
                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;

                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
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
            tips(),
            SizedBox(height: 70 + edge),
          ],
        ),
      ),
      floatingActionButton: bottomNavBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Container bottomNavBar(BuildContext context) {
    return Container(
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
    );
  }

  Padding tips() {
    return Padding(
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
              name: 'Civil Registration',
              update: '21/01/2022',
              imageUrl: 'assets/images/img_tips_2.png',
            ),
          ),
        ],
      ),
    );
  }

  Container popularCities() {
    return Container(
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
              const SizedBox(width: 20),
              CityCard(
                City(
                  id: 4,
                  name: 'Palembang',
                  imageUrl: 'assets/images/img_city_4.png',
                  isFavorited: false,
                ),
              ),
              const SizedBox(width: 20),
              CityCard(
                City(
                  id: 5,
                  name: 'Malang',
                  imageUrl: 'assets/images/img_city_5.png',
                  isFavorited: false,
                ),
              ),
              const SizedBox(width: 20),
              CityCard(
                City(
                  id: 6,
                  name: 'Bali',
                  imageUrl: 'assets/images/img_city_6.png',
                  isFavorited: true,
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
    );
  }
}
