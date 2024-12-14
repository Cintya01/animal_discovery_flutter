

import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  MenuLateral({super.key});

  final animalsMenu = [
    "Fishes",
    "Animals",
    "Birds",
    "Reptiles",
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 30,
          bottom: 30,
          child: RotatedBox(
            quarterTurns: 3,
            child: Row(
              children: animalsMenu.map((animal) {
                return ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xFF285555)),
                      shadowColor:
                          WidgetStateProperty.all(const Color(0xFF285555)),
                      elevation: WidgetStateProperty.all(0),
                    ),
                    child: Text(animal,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )));
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
