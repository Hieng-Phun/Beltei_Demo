import 'package:flutter/material.dart';

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.facebook, color: Colors.blue, size: 35),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.telegram, color: Colors.blue, size: 35),
        ),
      ],
    );
  }
}
