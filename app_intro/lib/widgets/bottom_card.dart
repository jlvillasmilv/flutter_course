import 'package:app_intro/widgets/like_buttom.dart';
import 'package:flutter/material.dart';

class ButtomCard extends StatelessWidget {
  const ButtomCard({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LikeButtom(),
        TextButton(
          onPressed: () {},
          child: Text('Comment', style: textStyle),
        ),
        TextButton(
          onPressed: () {},
          child: Text('Share', style: textStyle),
        ),
      ],
    );
  }
}
