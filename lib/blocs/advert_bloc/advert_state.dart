part of "advert_bloc.dart";

abstract class AdvertState extends Equatable {
  final BlocStatus status;
  const AdvertState({required this.status});

  @override
  List<Object> get props => [status];
}

class AdvertInitial extends AdvertState {
  const AdvertInitial({super.status = BlocStatus.initial});
}

class AdvertLoading extends AdvertState {
  const AdvertLoading({super.status = BlocStatus.loading});
}

class AdvertFetched extends AdvertState {
  final Advert advert;

  const AdvertFetched({
    super.status = BlocStatus.success,
    required this.advert,
  });

  @override
  List<Object> get props => [advert];
}

class AdvertsFetched extends AdvertState {
  final List<Advert> adverts;

  const AdvertsFetched({
    super.status = BlocStatus.success,
    required this.adverts,
  });

  @override
  List<Object> get props => [adverts];
}

class AdvertError extends AdvertState {
  final String errorMessage;

  const AdvertError({
    super.status = BlocStatus.failure,
    required this.errorMessage,
  });

  @override
  List<Object> get props => [errorMessage];
}
