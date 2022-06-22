import 'package:flutter/material.dart';
import 'package:kosan_apps/themes.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({
    Key? key,
    required this.index,
    required this.rating,
  }) : super(key: key);

  final int index;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Icon(
      index <= rating ? Icons.star : Icons.star_border,
      size: 20,
      color: orangeColor,
    );
  }
}
