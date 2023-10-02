import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

part 'face_recognition_event.dart';
part 'face_recognition_state.dart';
part 'ml_layer.dart';

class FaceRecognitionBloc
    extends Bloc<FaceRecognitionEvent, FaceRecognitionState> {
  FaceRecognitionBloc() : super(const FaceRecognitionInitial()) {
    on<RecognizeFaceEvent>(_recognizeFace);
  }

  void _recognizeFace(
      RecognizeFaceEvent event, Emitter<FaceRecognitionState> emit) async {
    emit(
      const FaceRecognitionLoading(),
    );
    try {
      final faces = await FaceRecognitionModel.recognizeFaces(event.inputImage);
      emit(
        FaceRecognitionSuccess(faces: faces),
      );
    } catch (e) {
      emit(
        FaceRecognitionFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
