import 'package:flutter/material.dart';

class CustomLiene extends StatelessWidget {
  const CustomLiene({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 2.0, top: 2),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfff7931e),
            ),
            height: 2,
            width: 60,
          ),
        ),
      ],
    );
  }
}
