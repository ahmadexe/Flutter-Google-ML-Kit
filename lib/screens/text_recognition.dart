import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ml_kit/blocs/text_recognition/text_recognition_bloc.dart';
import 'package:ml_kit/providers/app_providers.dart';
import 'package:provider/provider.dart';

class TextRecognitionScreen extends StatelessWidget {
  const TextRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final textRecognitionBloc = BlocProvider.of<TextRecognitionBloc>(context);

    return WillPopScope(
      onWillPop: () async {
        appProvider.clearImage();
        textRecognitionBloc.add(const ClearDataEvent());
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
        body: appProvider.image != null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.file(File(appProvider.image!.path)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        textRecognitionBloc.add(
                          RecognizeTextEvent(
                            inputImage: appProvider.inputImage!,
                          ),
                        );
                      },
                      child: const Text('Recognize Text'),
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<TextRecognitionBloc, TextRecognitionState>(
                      builder: (context, state) {
                        if (state is TextRecognitionSuccess) {
                          return Text(
                            state.text!,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          );
                        } else if (state is TextRecognitionFailure) {
                          return Text(
                            state.error!,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          );
                        } else if (state is TextRecognitionLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  ],
                ),
              )
            : const Center(
                child: Text('No image selected'),
              ),
      ),
    );
  }
}
