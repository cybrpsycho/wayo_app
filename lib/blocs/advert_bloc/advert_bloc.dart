import "dart:developer";

import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:wayo/config/dev_functions.dart";
import "package:wayo/config/enums.dart";
import "package:wayo/models/advert.dart";
import "package:wayo/repositories/advert_repository.dart";

part "advert_event.dart";
part "advert_state.dart";

class AdvertBloc extends Bloc<AdvertEvent, AdvertState> {
  AdvertBloc() : super(const AdvertInitial()) {
    on<GetAdvert>(_onGetAdvert);
  }

  final _advertRepo = AdvertRepository();

  void _onGetAdvert(
    GetAdvert event,
    Emitter<AdvertState> emit,
  ) async {
    emit(const AdvertLoading());
    try {
      final advert = await _advertRepo.getAdvert(event.type.name, index: event.index);
      await simulateLatency();
      emit(AdvertFetched(advert: advert));
    } catch (e) {
      log(e.toString());
      emit(AdvertError(errorMessage: e.toString()));
    }
  }
}
