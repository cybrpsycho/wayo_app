part of "mall_bloc.dart";

abstract class MallEvent extends Equatable {
  const MallEvent();

  @override
  List<Object> get props => [];
}

class GetMalls extends MallEvent {
  final String? storeId;

  const GetMalls({this.storeId});
}

class GetMall extends MallEvent {
  final String mallId;

  const GetMall({required this.mallId});
}
