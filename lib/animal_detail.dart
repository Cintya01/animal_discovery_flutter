import 'package:flutter/material.dart';

class AnimalInfo extends StatelessWidget {
  final Map<String, String> animal;
  const AnimalInfo({super.key, required this.animal});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF285555),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 30,
              right: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.white, size: 24),
                ),
                const Icon(Icons.search_rounded, color: Colors.white, size: 24),
              ],
            )),
        const SizedBox(height: 40),
        centerSection(size, animal),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(animal["description"] ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.white)),
        ),
      ]),
    );
  }
}

Widget centerSection(Size size, Map<String, String> animal) {
  return SizedBox(
      width: double.infinity,
      height: size.height * 0.55,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 100,
            child: Container(
              width: size.width,
              height: size.height * 0.55,
              decoration: const BoxDecoration(
                color: Color(0xFF1f4949),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: 0,
            right: 0,
            child: Image.asset("assets/img/green_leafs.png"),
          ),
          Positioned(
            top: 0,
            left: 30,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(animal["name"] ?? '',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 110,
            right: 20,
            child: Image.asset(animal["detailImage"] ?? ''),
          ),
        ],
      ));
}
