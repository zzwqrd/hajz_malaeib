import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/helpers/route.dart';
import '../../data/models/model.dart';
import '../../domain/usecases/usecase_name.dart';

part 'state.dart';

class ControllerData extends Cubit<StateTest<DataLocalModel>> {
  ControllerData() : super(const StateTest(status: Status.initial));

  Future<void> getData() async {
    emit(state.copyWith(status: Status.start));

    final res = await ProductUseCaseImp().getData();

    res.fold((l) {
      showErrorDialogue(l.message);
      emit(state.copyWith(status: Status.failed, error: l.message));
    }, (r) {
      emit(state.copyWith(status: Status.success, dataLocalModels: r));
    });
  }
}

showErrorDialogue(String error) {
  showDialog(
    context: navigator.currentContext!,
    builder: (context) => ErrorAlertDialogueWidget(
      title: error,
    ),
  );
}

class ErrorAlertDialogueWidget extends StatelessWidget {
  final String title;
  const ErrorAlertDialogueWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF282F37),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        InkWell(
          child: Text("ok"),
          onTap: () => Navigator.pop(context),
        )
      ],
    );
  }
}
