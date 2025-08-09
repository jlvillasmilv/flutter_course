import 'package:app_intro/widgets/card_feed.dart';
import 'package:app_intro/data/data.dart';
import 'package:flutter/material.dart';

class ListCardFeed extends StatelessWidget {
  const ListCardFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return CardFeed(data: listData[index]);
      },
    );
  }
}
