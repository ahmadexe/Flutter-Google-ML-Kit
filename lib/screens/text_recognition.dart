import 'package:flutter/material.dart';

class TextRecognitionScreen extends StatelessWidget {
  const TextRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Recognition'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.camera_alt),
          ),
        ],
      ),
      body: const Center(
        child: Text('Text Recognition'),
      ),
    );
  }
}
