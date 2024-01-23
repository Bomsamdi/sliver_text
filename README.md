# SliverText

[![Pub](https://img.shields.io/pub/v/sliver_text.svg)](https://pub.dev/packages/sliver_text)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![pub points](https://img.shields.io/pub/points/sliver_text)](https://pub.dev/packages/sliver_text/score) 
[![popularity](https://img.shields.io/pub/popularity/sliver_text)](https://pub.dev/packages/sliver_text/score)

[SliverText] is a widget that displays a string of text in a sliver without using [SliverToBoxAdapter] and [Text] widgets.

## Installation

Include your package in your `pubspec.yaml` file:

```yaml
dependencies:
  sliver_text: ^0.0.1
```

## Usage

```dart
import 'package:flutter/material.dart';
import 'package:sliver_text/sliver_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sliver Text Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sliver Text Demo'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(widget.title),
          ),
          const SliverText(
            'Short Sliver Text',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SliverText(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl. Donec auctor, nisl eget ultricies aliquam, nisl nisl aliquet nisl, quis aliquam nisl nisl nec nisl.',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

```

Example usage in `/example` folder.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
