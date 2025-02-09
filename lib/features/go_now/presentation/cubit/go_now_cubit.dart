import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/domain.dart';
import 'cubit.dart';

class GoNowCubit extends Cubit<GoNowState> {
  final FetchAllSuitesUsecase fetchAllSuites;

  GoNowCubit(
    this.fetchAllSuites,
  ) : super(const GoNowState());

  Future<void> fetchAll() async {
    emit(state.copyWith(status: GoNowStatus.loading));

    try {
      final data = await fetchAllSuites();
      emit(state.copyWith(
        status: GoNowStatus.loaded,
        motels: data.motels,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: GoNowStatus.error,
        errorMessage: e.toString(),
      ));
    }
  }
}
