import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class ConnectivityUtils {
  bool hasInternet = true;
  StreamSubscription? _subscription;
  final StreamController<bool> _onConnectivityChanged = StreamController.broadcast();

  static final instance = ConnectivityUtils._();

  ConnectivityUtils._();

  Stream<bool> get onConnectivityChanged => _onConnectivityChanged.stream;

  void init() {
    Connectivity().checkConnectivity().then(_onConnectivityChange);
    _subscription = Connectivity().onConnectivityChanged.listen(_onConnectivityChange);
  }

  void _onConnectivityChange(ConnectivityResult result) {
    hasInternet = result != ConnectivityResult.none;
    _onConnectivityChanged.add(hasInternet);
    if(result==ConnectivityResult.none){
      Get.offNamed(Routes.NO_INTERNET);
    }else{
      if(Get.currentRoute==Routes.NO_INTERNET){
        Get.offNamed(Get.previousRoute);
      }
    }
  }

  void dispose() {
    _subscription?.cancel();
    _onConnectivityChanged.close();
  }
}
