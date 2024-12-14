import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioAnimals extends StatefulWidget {
  final Map<String, String> animal;
  const AudioAnimals({super.key, required this.animal});

  @override
  State<AudioAnimals> createState() => _AudioAnimalsState();
}

class _AudioAnimalsState extends State<AudioAnimals> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAsset(widget.animal["sound"]!);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: "boton_${widget.animal["name"]}",
      onPressed: () {
        if (player.playing) {
          player.pause();
        } else {
          player.play();
        }
      },
      backgroundColor: Colors.yellow[800],
      mini: true,
      child: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.white,
        size: 18,
      ),
    );
  }
}
