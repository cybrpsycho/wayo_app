part of "advert_bloc.dart";

abstract class AdvertEvent extends Equatable {
  const AdvertEvent();

  @override
  List<Object> get props => [];
}

class GetAdvert extends AdvertEvent {
  final AdType type;
  final int? index;

  const GetAdvert({required this.type, this.index});
}
