import 'package:equatable/equatable.dart';

import '../../domain/domain.dart';

enum GoNowStatus { initial, loading, loaded, error }

class GoNowState extends Equatable {
  final GoNowStatus status;
  final List<MotelEntity> motels;
  final String? errorMessage;

  const GoNowState({
    this.status = GoNowStatus.initial,
    this.motels = const [],
    this.errorMessage,
  });

  GoNowState copyWith({
    GoNowStatus? status,
    List<MotelEntity>? motels,
    String? errorMessage,
  }) {
    return GoNowState(
      status: status ?? this.status,
      motels: motels ?? this.motels,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, motels, errorMessage];
}
