import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(ConnectionInitial());

  StreamSubscription? _subscription;

  @override
  Stream<NetworkState> mapEventToState(NetworkEvent event) async* {
    if (event is ListenConnection) {
      _subscription =
          InternetConnectionChecker().onStatusChange.listen((status) {
        add(ConnectionChanged(status == InternetConnectionStatus.disconnected
            ? ConnectionFailure()
            : ConnectionSuccess()));
      });
    }
    if (event is ConnectionChanged) yield event.connection;
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
