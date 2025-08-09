import 'package:app_intro/widgets/bottom_card.dart';
import 'package:app_intro/widgets/description_card.dart';
import 'package:app_intro/widgets/image_card.dart';
import 'package:app_intro/widgets/title_card.dart';
import 'package:flutter/material.dart';

class CardFeed extends StatelessWidget {
  const CardFeed({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      height: 350,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: TitleCard(name: data['name']!),
            ),
            DescriptionCard(description: data['description']!),
            ImageCard(image: data['image']!),
            Container(child: ButtomCard()),
          ],
        ),
      ),
    );
  }
}
