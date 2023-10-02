import 'package:flutter/material.dart';
import 'package:ml_kit/screens/face_detection.dart';
import 'package:ml_kit/screens/text_recognition.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ML Kit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const TextRecognitionScreen(),
                  ),
                );
              },
              child: const Text('Text Recognition'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FaceRecognitionScreen(),
                  ),
                );
              },
              child: const Text('Face Detection'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Barcode Scanning'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Image Labeling'),
            ),
          ],
        ),
      ),
    );
  }
}
