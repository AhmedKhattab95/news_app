import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'i_connectivity_manager.dart';

class ConnectivityManager implements IConnectivityManager {
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
