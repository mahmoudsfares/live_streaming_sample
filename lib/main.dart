import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PlayVideoFromYoutube(),
    );
  }
}

class PlayVideoFromYoutube extends StatefulWidget {
  const PlayVideoFromYoutube({super.key});

  @override
  State<PlayVideoFromYoutube> createState() => _PlayVideoFromYoutubeState();
}

class _PlayVideoFromYoutubeState extends State<PlayVideoFromYoutube> {
  late final PodPlayerController controller;

  @override
  void initState() {
    controller = PodPlayerController(playVideoFrom: PlayVideoFrom.youtube('https://www.youtube.com/watch?v=0VzWgHkUYw4', live: true))..initialise();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PodVideoPlayer(controller: controller),
    );
  }
}
