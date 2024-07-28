import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final YoutubePlayerController _youtubePlayerController = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=0VzWgHkUYw4")!,
    flags: const YoutubePlayerFlags(isLive: true),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _youtubePlayerController,
              bottomActions: [
                ProgressBar(isExpanded: true),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Playback rates: '),
                  const SizedBox(height: 8),
                  ElevatedButton(onPressed: () => _youtubePlayerController.setPlaybackRate(1), child: const Text('x1')),
                  ElevatedButton(onPressed: () => _youtubePlayerController.setPlaybackRate(1.25), child: const Text('x1.25')),
                  ElevatedButton(onPressed: () => _youtubePlayerController.setPlaybackRate(1.5), child: const Text('x1.5')),
                  ElevatedButton(onPressed: () => _youtubePlayerController.setPlaybackRate(1.75), child: const Text('x1.75')),
                  ElevatedButton(onPressed: () => _youtubePlayerController.setPlaybackRate(2), child: const Text('x2')),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
