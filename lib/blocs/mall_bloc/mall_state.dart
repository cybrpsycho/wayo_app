part of "mall_bloc.dart";

class MallState extends Equatable {
  final BlocStatus status;
  final String? message;
  const MallState({this.status = BlocStatus.initial, this.message});

  @override
  List<Object?> get props => [status, message];
}

class MallsFetched extends MallState {
  final List<Mall> malls;

  const MallsFetched({super.status = BlocStatus.success, required this.malls});

  @override
  List<Object> get props => [malls];
}

class MallFetched extends MallState {
  final Mall mall;

  const MallFetched({super.status = BlocStatus.success, required this.mall});

  @override
  List<Object> get props => [mall];
}
