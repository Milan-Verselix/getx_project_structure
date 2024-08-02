import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    Connectivity().checkConnectivity().then((value) {
      if(value!=ConnectivityResult.none){
        Timer(const Duration(seconds: 2),(){
            Get.offNamed(Routes.HOME);
        });
      }else{
        Get.toNamed(Routes.NO_INTERNET);
      }
    });
    
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
