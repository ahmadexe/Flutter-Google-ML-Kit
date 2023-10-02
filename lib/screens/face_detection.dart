import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ml_kit/blocs/face_recognition/face_recognition_bloc.dart';
import 'package:ml_kit/painters/rectangle.dart';
import 'package:ml_kit/providers/app_providers.dart';
import 'package:provider/provider.dart';

class FaceRecognitionScreen extends StatelessWidget {
  const FaceRecognitionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    final faceDetectionBloc = BlocProvider.of<FaceRecognitionBloc>(context);

    return WillPopScope(
      onWillPop: () async {
        appProvider.clearImage();
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
                    Stack(
                      children: [
                        Image.file(File(appProvider.image!.path)),
                        const SizedBox(height: 20),
                        BlocBuilder<FaceRecognitionBloc, FaceRecognitionState>(
                          builder: (context, state) {
                            if (state is FaceRecognitionInitial) {
                              return const Text('No face detected');
                            } else if (state is FaceRecognitionSuccess) {
                              final data = state.faces!;
                              return CustomPaint(
                                painter:
                                    RectanglePainter(rect: data[0].boundingBox),
                              );
                            } else if (state is FaceRecognitionFailure) {
                              return const Text('Error recognizing face');
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        faceDetectionBloc.add(
                          RecognizeFaceEvent(
                            appProvider.inputImage!,
                          ),
                        );
                      },
                      child: const Text('Recognize Face'),
                    ),
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
