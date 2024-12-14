import 'package:first_test_flutter/audio_player.dart';
import 'package:first_test_flutter/menu_lateral.dart';
import 'package:flutter/material.dart';
import 'animal_detail.dart';
import 'animal_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF285555),
      body: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(
                top: 30,
                left: 30,
                right: 30,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu_rounded, color: Colors.white, size: 24),
                      Icon(Icons.search_rounded, color: Colors.white, size: 24),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Discover",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold)),
                        Text("Our Majestic world together",
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Stack(children: [
              SizedBox(
                width: size.width,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.65,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1f4949),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(20)),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 30,
                child: _carruselImg(context, size),
              ),
              MenuLateral(),
            ]),
          ),
        ],
      ),
    );
  }
}

Widget _carruselImg(BuildContext context, Size size) {
  return SizedBox(
    height: size.height * 0.75,
    width: 200,
    child: ListView.builder(
      itemCount: animals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(
            right: 30.0,
            bottom: 20,
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AnimalInfo(animal: animals[index])));
                },
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          animals[index]["image"]!,
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: AudioAnimals(animal: animals[index]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
