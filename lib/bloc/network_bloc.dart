import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_bilclick/network_helper.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkFailure()) {
    on<NetworkObserve>(_observe);

    on<NetworkNotify>(_notifyStatus);
  }

  static final NetworkBloc _singleton = NetworkBloc._();

  factory NetworkBloc() {
    return _singleton;
  }

  void _observe(event, emit) {
    NetworkHelper.listenConnectivity();
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected ? emit(NetworkSuccess()) : emit(NetworkFailure());
  }
}
