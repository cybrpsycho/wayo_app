import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wayo/configs/constants.dart';

part 'server_event.dart';
part 'server_state.dart';

class ServerBloc extends Bloc<ServerEvent, ServerState> {
  ServerBloc() : super(const ServerState()) {
    on<StartServer>(_onStartServer);
    on<StopServer>(_onStopServer);
  }

  void _onStartServer(
    StartServer event,
    Emitter<ServerState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      final server =
          InAppLocalhostServer(documentRoot: 'assets/web', port: 8080);
      await server.start();
      emit(state.copyWith(status: LoadingStatus.success, server: server));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }

  void _onStopServer(
    StopServer event,
    Emitter<ServerState> emit,
  ) async {
    emit(state.copyWith(status: LoadingStatus.loading));
    try {
      await state.server?.close();
      emit(state.copyWith(status: LoadingStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LoadingStatus.failure));
    }
  }
}
