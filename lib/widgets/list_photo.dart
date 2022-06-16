import 'package:flutter/material.dart';

class ListPhoto extends StatelessWidget {
  const ListPhoto({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imageUrl,
        width: 110,
        height: 88,
      ),
    );
  }
}
