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
  final ValueNotifier<bool> _isFullScreen = ValueNotifier(false);

  final YoutubePlayerController _youtubePlayerController = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=0VzWgHkUYw4")!,
    flags: const YoutubePlayerFlags(isLive: true),
  );

  @override
  void initState() {
    super.initState();
    _youtubePlayerController.addListener(() {
      _isFullScreen.value = _youtubePlayerController.value.isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(child: YoutubePlayer(controller: _youtubePlayerController, bottomActions: [ProgressBar(isExpanded: true)])),
          ValueListenableBuilder<bool>(
            valueListenable: _isFullScreen,
            builder: (context, isFullScreen, child) => isFullScreen
                ? const SizedBox()
                : Padding(
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
          ),
        ],
      ),
    );
  }
}
