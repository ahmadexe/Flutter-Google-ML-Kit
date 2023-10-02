import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:ml_kit/blocs/text_recognition/ml_layer.dart';

part 'text_recognition_event.dart';
part 'text_recognition_state.dart';

class TextRecognitionBloc
    extends Bloc<TextRecognitionEvent, TextRecognitionState> {
  TextRecognitionBloc() : super(const TextRecognitionInitial()) {
    on<RecognizeTextEvent>(_recognizeText);
    on<ClearDataEvent>(_clearData);
  }

  void _recognizeText(
      RecognizeTextEvent event, Emitter<TextRecognitionState> emit) async {
    emit(
      const TextRecognitionLoading(),
    );
    try {
      final text = await TextRecognitionModel.recognizeText(event.inputImage);
      emit(
        TextRecognitionSuccess(text: text),
      );
    } catch (e) {
      emit(
        TextRecognitionFailure(
          error: e.toString(),
        ),
      );
    }
  }

  void _clearData(ClearDataEvent event, Emitter<TextRecognitionState> emit) {
    emit(
      const TextRecognitionInitial(),
    );
  }
}
