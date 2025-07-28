# AiCerts Video Player

AiCerts Video Player is a Flutter package that provides a robust video player widget powered by Better Player Plus. It's specifically designed for HLS video streams with consistent cross-platform behavior and comprehensive error handling.

## Features

- **HLS Video Support**: Optimized for HTTP Live Streaming (HLS) video format
- **Cross-Platform Consistency**: Uniform behavior across iOS and Android
- **Auto-Play**: Videos start playing automatically upon initialization
- **Fullscreen Support**: Built-in fullscreen mode with proper orientation handling
- **Quality Selection**: Automatic quality selection based on network conditions
- **Progress Controls**: Seek bar, progress text, and playback speed controls
- **Error Handling**: Comprehensive error handling with retry functionality
- **Material Design**: Consistent Material Design controls across platforms
- **Aspect Ratio Handling**: Maintains 16:9 aspect ratio without stretching
- **Performance Optimized**: Prevents screen sleep during video playback

## Installation

Add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  aicerts_video_player: ^0.0.1
```

Then, run `flutter pub get` to fetch the package.

## Usage

Import the package:

```dart
import 'package:aicerts_video_player/aicerts_video_player.dart';
```

Use the `AiCertsVideoPlayer` widget in your application:

```dart
AiCertsVideoPlayer(
  videoUrl: 'https://example.com/playlist.m3u8', // HLS URL
);
```

## Example

```dart
import 'package:flutter/material.dart';
import 'package:aicerts_video_player/aicerts_video_player.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AiCerts Video Player')),
        body: AiCertsVideoPlayer(
          videoUrl: 'https://example.com/video/playlist.m3u8',
        ),
      ),
    );
  }
}
```

## Configuration

The video player comes pre-configured with optimal settings:

- **Aspect Ratio**: Fixed 16:9 ratio
- **Auto-Play**: Enabled by default
- **Looping**: Disabled
- **Screen Sleep**: Prevented during playback
- **Fullscreen**: Landscape orientation support
- **Controls**: Material Design with blue accent color
- **Error Recovery**: Automatic retry mechanism

## Widget Properties

The `AiCertsVideoPlayer` widget accepts the following parameter:

- `videoUrl` (String, required): The URL of the HLS video stream to play

## Dependencies

This package depends on:
- `better_player_plus: ^1.0.8` - Enhanced video player for Flutter
- `flutter/material.dart` - Material Design components
- `flutter/services.dart` - Platform services for orientation control

## Error Handling

The video player includes robust error handling:
- Automatic error detection and logging
- User-friendly error dialog with retry option
- Graceful fallback for network issues
- Debug logging for development

## Platform Support

- ✅ iOS
- ✅ Android
- ✅ Cross-platform consistent UI

## Technical Details

- **Video Format**: Optimized for HLS (HTTP Live Streaming)
- **Aspect Ratio**: Fixed 16:9 with `BoxFit.contain`
- **Background**: Black background for cinematic experience
- **Controls**: Material Design with customized colors
- **Orientation**: Portrait lock after fullscreen exit

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contributions

Contributions are welcome! Feel free to open issues or submit pull requests to improve the package.

## Support

For any questions or support, please contact [aicertsapps@gmail.com](mailto:aicertsapps@gmail.com).
