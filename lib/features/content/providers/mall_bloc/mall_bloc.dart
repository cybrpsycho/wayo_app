import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wayo/features/content/models/mall.dart';
import 'package:wayo/features/content/repositories/mall_repository.dart';

part 'mall_event.dart';
part 'mall_state.dart';

class MallBloc extends Bloc<MallEvent, MallState> {
  MallBloc() : super(MallInitial()) {
    on<GetMalls>(_onGetMalls);
    on<GetMall>(_onGetMall);
  }

  final _mallRepo = MallRepository();

  void _onGetMalls(
    GetMalls event,
    Emitter<MallState> emit,
  ) async {
    emit(MallLoading());
    try {
      emit(MallsFetched(malls: await _mallRepo.getMalls()));
    } catch (e) {
      log(e.toString());
      emit(MallError(errorMessage: e.toString()));
    }
  }

  void _onGetMall(
    GetMall event,
    Emitter<MallState> emit,
  ) async {
    emit(MallLoading());
    try {
      final mall = await _mallRepo.getMall(event.mallId);
      if (mall != null) {
        emit(MallFetched(mall: mall));
      }
    } catch (e) {
      emit(MallError(errorMessage: e.toString()));
    }
  }
}
