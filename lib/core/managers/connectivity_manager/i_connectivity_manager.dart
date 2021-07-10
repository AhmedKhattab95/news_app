import 'dart:async';

abstract class IConnectivityManager {
  /// check if device connected to interent or not
  Future<bool> isConnected();
}

enum ConnectionStatus { connected, notConnected }
