import 'package:app_intro/widgets/list_card_feed.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.grey,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar Demo'),
        backgroundColor: Colors.purple,
      ),
      body: ListCardFeed(),
    );
  }
}
