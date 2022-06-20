import 'dart:convert';

class Spaces {
  late int id;
  late int rating;
  late int price;
  late String name;
  late String imageUrl;
  late String city;
  late String country;
  late String address;
  late String phone;
  late String mapUrl;
  late List photos;
  late int numberOfKitchen;
  late int numberOfBedroom;
  late int numberOfCupboards;

  Spaces({
    required this.id,
    required this.rating,
    required this.price,
    required this.name,
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.numberOfKitchen,
    required this.numberOfBedroom,
    required this.numberOfCupboards,
  });

  Spaces.fromJson(json) {
    id = json['id'];
    rating = json['rating'];
    price = json['price'];
    name = json['name'];
    imageUrl = json['image_url'];
    city = json['city'];
    country = json['country'];
    address = json['address'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    photos = json['photos'];
    numberOfKitchen = json['number_of_kitchen'];
    numberOfBedroom = json['number_of_bedroom'];
    numberOfCupboards = json['number_of_cupboard'];
  }
}
