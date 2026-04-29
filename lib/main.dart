import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    playMusic();
  }

  Future<void> playMusic() async {
    await player.setReleaseMode(ReleaseMode.loop); // 🔁 loop
    await player.play(AssetSource('music.mp3'));
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            'assets/image.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}