part of 'server_bloc.dart';

class ServerState extends Equatable {
  final LoadingStatus status;
  final InAppLocalhostServer? server;

  const ServerState({
    this.status = LoadingStatus.initial,
    this.server,
  });

  ServerState copyWith({
    required LoadingStatus status,
    InAppLocalhostServer? server,
  }) {
    return ServerState(
      status: status,
      server: server ?? this.server,
    );
  }

  @override
  List<Object?> get props => [status, server];
}
