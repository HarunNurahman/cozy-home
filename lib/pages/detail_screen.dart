import 'package:flutter/material.dart';
import 'package:kosan_apps/models/spaces.dart';
import 'package:kosan_apps/pages/error_screen.dart';
import 'package:kosan_apps/themes.dart';
import 'package:kosan_apps/widgets/facility_item.dart';
import 'package:kosan_apps/widgets/list_photo.dart';
import 'package:kosan_apps/widgets/rating_item.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class DetailScreen extends StatefulWidget {
  // final Uri _url = Uri.parse('https://goo.gl/maps/y1UeZFGt4wY4Enpu6');

  // void _launchUrl() async {
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

  final Spaces spaces;

  DetailScreen(this.spaces);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              widget.spaces.imageUrl,
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 330),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
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
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 50,
                                    ),
                                    height: 290,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Hubungi Pemilik Kost',
                                          style: regularTextStyle.copyWith(
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          'Apakah anda yakin ingin menghubungi pemilik kost?',
                                          style: greyTextStyle.copyWith(
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 30),
                                        Container(
                                          width: 225,
                                          height: 55,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: purpleColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                              ),
                                            ),
                                            onPressed: () {
                                              _launchUrl(
                                                'tel:${widget.spaces.phone}',
                                              );
                                            },
                                            child: Text(
                                              'Lanjutkan',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: whiteColor,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25),
                                  ),
                                ),
                              );
                            },
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
          InkWell(
            onTap: () {
              setState(() {
                isClicked = !isClicked;
              });
            },
            child: Image.asset(
              isClicked
                  ? 'assets/images/btn_wishlist_on.png'
                  : 'assets/images/btn_wishlist.png',
              width: 40,
            ),
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
            '${widget.spaces.address}\n${widget.spaces.city}',
            style: greyTextStyle.copyWith(fontSize: 14),
          ),
          InkWell(
            onTap: () {
              _launchUrl(widget.spaces.mapUrl);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF6F7F8),
                shape: BoxShape.circle,
              ),
              child: const Icon(
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

  SingleChildScrollView detailPic() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: widget.spaces.photos.map((item) {
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
                widget.spaces.name,
                style: blackTextStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: '\$${widget.spaces.price}',
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
          // RATING
          Row(
            children: [1, 2, 3, 4, 5].map((index) {
              return Container(
                margin: const EdgeInsets.only(left: 2),
                child: RatingItem(index: index, rating: widget.spaces.rating),
              );
            }).toList(),
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
              total: widget.spaces.numberOfKitchens.toString(),
            ),
            const SizedBox(width: 30),
            FacilityItem(
              name: 'Bedrooms',
              imageUrl: 'assets/icons/ic_bedroom.png',
              total: widget.spaces.numberOfBedrooms.toString(),
            ),
            const SizedBox(width: 30),
            FacilityItem(
              name: 'Wardrobes',
              imageUrl: 'assets/icons/ic_wardrobe.png',
              total: widget.spaces.numberOfCupboards.toString(),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}
