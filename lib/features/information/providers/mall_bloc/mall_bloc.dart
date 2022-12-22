import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/features/information/models/mall.dart';
import 'package:wayo/features/information/repositories/mall_repository.dart';

part 'mall_event.dart';
part 'mall_state.dart';

class MallBloc extends Bloc<MallEvent, MallState> {
  MallBloc() : super(MallInitial()) {
    on<GetMalls>(_onGetMalls);
    on<SetSelectedMall>(_onSetSelectedMall);
  }

  final _mallRepo = MallRepository();

  void _onGetMalls(
    GetMalls event,
    Emitter<MallState> emit,
  ) async {
    emit(MallLoading());
    try {
      emit(MallFetched(malls: await _mallRepo.getMalls()));
    } catch (e) {
      log(e.toString());
      emit(MallError(errorMessage: e.toString()));
    }
  }

  void _onSetSelectedMall(
    SetSelectedMall event,
    Emitter<MallState> emit,
  ) async {
    emit(MallLoading());
    try {
      emit(MallSelected(mall: event.mall));
    } catch (e) {
      emit(MallError(errorMessage: e.toString()));
    }
  }
}
