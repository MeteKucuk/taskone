import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:task_bilclick/bloc/network_bloc.dart';

class NetworkHelper {
  static void listenConnectivity() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotify());
      } else {
        NetworkBloc().add(NetworkNotify(isConnected: true));
      }
    });
  }
}
