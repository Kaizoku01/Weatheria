import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityProvider with ChangeNotifier {
  ///[_connectivity] instance of Connectivity class
  late Connectivity _connectivity;

  ///[_connectivitySubscription] stream instance for listening to the connectivity status
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  ///[_status] current status parameter
  ConnectivityStatus _status = ConnectivityStatus.connected;

  //Constructor initializing all the necessary variables and streams.
  ConnectivityProvider() {
    _connectivity = Connectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateStatus);

    _updateStatus();
  }

  ///[_updateStatus] This method updates the connection status and notify listener widgets
  Future<void> _updateStatus([ConnectivityResult? result]) async {
    ConnectivityResult connectivityResult = await _connectivity.checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      _status = ConnectivityStatus.disconnected;
    } else {
      _status = ConnectivityStatus.connected;
    }
    notifyListeners();
  }

  ///[status] getter for status of the connection
  ConnectivityStatus get status => _status;


  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
