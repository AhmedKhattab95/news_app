import 'dart:async';

abstract class IConnectivityManager {
  /// check if device connected to interent or not
  Future<bool> get isConnected;

  /// check if connection changed
  Stream<ConnectionStatus> get ConnectionStream;
}

enum ConnectionStatus { connected, notConnected }
