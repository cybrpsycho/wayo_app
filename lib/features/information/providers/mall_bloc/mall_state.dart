part of 'mall_bloc.dart';

abstract class MallState extends Equatable {
  const MallState();

  @override
  List<Object?> get props => [];
}

class MallInitial extends MallState {}

class MallLoading extends MallState {}

class MallFetched extends MallState {
  final List<Mall> malls;
  final Mall? mall;

  const MallFetched({required this.malls, this.mall});

  @override
  List<Object?> get props => [malls, mall];
}

class MallSelected extends MallState {
  final Mall mall;

  const MallSelected({required this.mall});

  @override
  List<Object?> get props => [mall];
}

class MallError extends MallState {
  final String errorMessage;

  const MallError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
