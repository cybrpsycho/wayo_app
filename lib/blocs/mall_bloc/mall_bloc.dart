import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/config/dev_functions.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/mall.dart";
import "package:wayo/repositories/mall_repository.dart";

part "mall_event.dart";
part "mall_state.dart";

class MallBloc extends Bloc<MallEvent, MallState> {
  MallBloc() : super(const MallState()) {
    on<GetMalls>(_onGetMalls);
    on<GetMall>(_onGetMall);
  }

  final _mallRepo = MallRepository();

  void _onGetMalls(
    GetMalls event,
    Emitter<MallState> emit,
  ) async {
    emit(const MallState(status: BlocStatus.loading));
    try {
      final malls = await _mallRepo.getMalls(storeId: event.storeId);
      await simulateLatency(longLoadTime: true);
      emit(MallsFetched(malls: malls));
    } catch (e) {
      emit(const MallState(message: "Unable to fetch malls"));
    }
  }

  void _onGetMall(
    GetMall event,
    Emitter<MallState> emit,
  ) async {
    emit(const MallState(status: BlocStatus.loading));
    try {
      final mall = await _mallRepo.getMall(event.mallId);
      await simulateLatency();
      emit(MallFetched(mall: mall));
    } catch (e) {
      emit(const MallState(message: "Unable to fetch mall data"));
    }
  }
}
