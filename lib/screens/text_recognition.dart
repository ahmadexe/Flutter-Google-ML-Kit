import 'package:flutter/material.dart';
import 'package:ml_kit/providers/app_providers.dart';
import 'package:provider/provider.dart';

class TextRecognitionScreen extends StatelessWidget {
  const TextRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Text Recognition'),
          actions: [
            IconButton(
              onPressed: () {
                appProvider.pickImage();
              },
              icon: const Icon(Icons.camera_alt),
            ),
          ],
        ),
        body: const Center(
          child: Text('Text Recognition'),
        ),
      ),
    );
  }
}
