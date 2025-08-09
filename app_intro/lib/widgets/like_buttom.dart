import 'package:flutter/material.dart';

class LikeButtom extends StatefulWidget {
  const LikeButtom({super.key});

  @override
  State<LikeButtom> createState() => _LikeButtomState();
}

class _LikeButtomState extends State<LikeButtom> {
  bool _stateLike = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setState(() {
          _stateLike = !_stateLike;
        });
      },
      child: Text(
        'Like',
        style: TextStyle(
          color: _stateLike ? Colors.blue : Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
