import 'package:flutter/material.dart';
import 'package:better_player_plus/better_player_plus.dart';
import 'package:flutter/services.dart';

class AiCertsVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const AiCertsVideoPlayer({super.key, required this.videoUrl});

  @override
  State<AiCertsVideoPlayer> createState() => _AiCertsVideoPlayerState();
}

class _AiCertsVideoPlayerState extends State<AiCertsVideoPlayer> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() {
    BetterPlayerConfiguration
    betterPlayerConfiguration = BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: false,
      allowedScreenSleep: false,
      // Force same orientations across all platforms
      deviceOrientationsAfterFullScreen: const [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      // Ensure consistent fullscreen behavior with proper aspect ratio handling
      autoDetectFullscreenDeviceOrientation: false,
      autoDetectFullscreenAspectRatio: true, // Enable to maintain aspect ratio
      // Set fit to ensure video fits width without stretching
      fit:
          BoxFit.contain, // This prevents stretching and maintains aspect ratio
      controlsConfiguration: const BetterPlayerControlsConfiguration(
        enablePlayPause: false,
        enableFullscreen: true,
        enablePlaybackSpeed: true,
        enableSkips: true,
        enableMute: true,
        enableProgressText: true,
        enableProgressBar: true,
        showControlsOnInitialize: true,
        enableOverflowMenu: true,
        enableAudioTracks: false,
        enableSubtitles: false,
        // Enable quality selection
        enableQualities: true,
        // Force Material Design controls on all platforms for consistency
        playerTheme: BetterPlayerTheme.material,
        // Ensure consistent icon colors and sizes
        iconsColor: Colors.white,
        progressBarBackgroundColor: Colors.white30,
        progressBarBufferedColor: Colors.white60,
        progressBarPlayedColor: Colors.blue,
        progressBarHandleColor: Colors.blue,
        // Control bar styling
        controlBarColor: Colors.black54,
        controlBarHeight: 40,
        // Hide specific platform controls to maintain consistency
        enableRetry: true,
        enablePip: false, // Disable picture-in-picture for consistency
        // Consistent loading indicator
        loadingColor: Colors.white,
        // Consistent overlay behavior
        overflowMenuCustomItems: [],
      ),
      eventListener: _onPlayerEvent,
      // Platform-independent placeholder
      placeholder: Container(
        color: Colors.black,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      ),
    );

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      widget.videoUrl,
      videoFormat: BetterPlayerVideoFormat.hls,
    );

    _controller = BetterPlayerController(betterPlayerConfiguration);
    _controller.setupDataSource(dataSource);
  }

  void _onPlayerEvent(BetterPlayerEvent event) {
    switch (event.betterPlayerEventType) {
      case BetterPlayerEventType.exception:
        debugPrint("Player error: ${event.parameters}");
        // Handle error consistently across platforms
        _showErrorDialog();
        break;
      case BetterPlayerEventType.initialized:
        debugPrint("Player initialized successfully");
        break;
      case BetterPlayerEventType.play:
        debugPrint("Player started playing");
        break;
      case BetterPlayerEventType.pause:
        debugPrint("Player paused");
        break;
      default:
        break;
    }
  }

  void _showErrorDialog() {
    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Video Error'),
          content: const Text('Unable to load video. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _initializeVideo(); // Retry initialization
              },
              child: const Text('Retry'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(controller: _controller),
        ),
      ),
    );
  }
}
