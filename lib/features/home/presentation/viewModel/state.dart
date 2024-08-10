part of 'controller.dart';

enum Status { initial, start, success, failed }

class StateTest<T> extends Equatable {
  final Status status;
  final String? error;
  final dynamic? data;
  final List<DataLocalModel>? dataLocalModels;

  const StateTest(
      {required this.status, this.error, this.data, this.dataLocalModels});

  StateTest<T> copyWith({
    Status? status,
    String? error,
    dynamic data,
    List<DataLocalModel>? dataLocalModels,
  }) {
    return StateTest<T>(
      status: status ?? this.status,
      error: error ?? this.error,
      data: data ?? this.data,
      dataLocalModels: dataLocalModels ?? this.dataLocalModels,
    );
  }

  @override
  List<Object?> get props => [status, error, data];
}
