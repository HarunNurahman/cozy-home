import 'package:flutter/material.dart';
import 'package:kosan_apps/models/spaces.dart';
import 'package:kosan_apps/pages/error_screen.dart';
import 'package:kosan_apps/themes.dart';
import 'package:kosan_apps/widgets/facility_item.dart';
import 'package:kosan_apps/widgets/list_photo.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatelessWidget {
  // final Uri _url = Uri.parse('https://goo.gl/maps/y1UeZFGt4wY4Enpu6');

  // void _launchUrl() async {
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

  final Spaces spaces;

  DetailScreen(this.spaces);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              spaces.imageUrl,
              height: 350,
              width: MediaQuery.of(context).size.width,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 330),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      color: whiteColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 30),
                        placeHeader(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Main Facilities',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 12),
                        mainFacility(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Photos',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 12),
                        detailPic(),
                        const SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: edge),
                          child: Text(
                            'Location',
                            style: regularTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 6),
                        location(context),
                        const SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: edge),
                          height: 50,
                          width: MediaQuery.of(context).size.width - (2 * edge),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: purpleColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: whiteTextStyle.copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            topButton(context),
          ],
        ),
      ),
    );
  }

  Padding topButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (() => Navigator.pop(context)),
            child: Image.asset(
              'assets/images/btn_back.png',
              width: 40,
            ),
          ),
          Image.asset(
            'assets/images/btn_wishlist.png',
            width: 40,
          ),
        ],
      ),
    );
  }

  Padding location(BuildContext context) {
    _launchUrl(String url) async {
      // if (!await launchUrlString(url)) throw 'Could not launch $url';
      if (await canLaunchUrlString(url)) {
        launchUrlString(url);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EmptyState();
            },
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${spaces.address}\n${spaces.city}',
            style: greyTextStyle.copyWith(fontSize: 14),
          ),
          InkWell(
            onTap: () {
              _launchUrl(spaces.mapUrl);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF6F7F8),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.location_on,
                size: 22,
                color: Color(0xFF989BA1),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding detailPic() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: spaces.photos.map((item) {
            return Container(
              margin: EdgeInsets.only(left: edge),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  item,
                  width: 110,
                  height: 88,
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          // ListPhoto(
          //   imageUrl: 'assets/images/img_detailpic_1.png',
          // ),
          // const SizedBox(width: 18),
          // ListPhoto(
          //   imageUrl: 'assets/images/img_detailpic_2.png',
          // ),
          // const SizedBox(width: 18),
          // ListPhoto(
          //   imageUrl: 'assets/images/img_detailpic_3.png',
          // ),
          // const SizedBox(width: 18),
        ),
      ),
    );
  }

  Padding placeHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spaces.name,
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: '\$${spaces.price}',
                  style: purpleTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: '/month',
                      style: greyTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              Icon(
                Icons.star,
                color: orangeColor,
                size: 20,
              ),
              const SizedBox(width: 2),
              const Icon(
                Icons.star,
                color: Color(0xFF989BA1),
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding mainFacility() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            FacilityItem(
              name: 'Kitchens',
              imageUrl: 'assets/icons/ic_kitchenbar.png',
              total: spaces.numberOfKitchens.toString(),
            ),
            const SizedBox(width: 30),
            FacilityItem(
              name: 'Bedrooms',
              imageUrl: 'assets/icons/ic_bedroom.png',
              total: spaces.numberOfBedrooms.toString(),
            ),
            const SizedBox(width: 30),
            FacilityItem(
              name: 'Wardrobes',
              imageUrl: 'assets/icons/ic_wardrobe.png',
              total: spaces.numberOfCupboards.toString(),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
