import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  const FacilityItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/icons/ic_kitchenbar.png',
              width: 32,
            ),
          ],
        )
      ],
    );
  }
}
