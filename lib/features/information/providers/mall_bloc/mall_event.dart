part of 'mall_bloc.dart';

abstract class MallEvent extends Equatable {
  const MallEvent();

  @override
  List<Object> get props => [];
}

class GetMalls extends MallEvent {}

class SetSelectedMall extends MallEvent {
  final Mall mall;

  const SetSelectedMall({required this.mall});
}
