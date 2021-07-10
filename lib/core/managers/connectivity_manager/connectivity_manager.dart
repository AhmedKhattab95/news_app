import 'dart:async';
import 'package:connectivity/connectivity.dart';

import '../managers_lib.dart';

class ConnectivityManager implements IConnectivityManager {
  Future<bool> get isConnected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return true;
    }
    return false;
  }

  final StreamController<ConnectionStatus> _conenctionController =
      StreamController.broadcast();

  @override
  Stream<ConnectionStatus> get ConnectionStream => _conenctionController.stream;

  bool _intialized = false;

  init() {
    if (_intialized) return;
    Connectivity().onConnectivityChanged.listen((event) {
      _conenctionController.add(event == ConnectivityResult.none
          ? ConnectionStatus.notConnected
          : ConnectionStatus.connected);
    });
    _intialized = true;
  }
}
