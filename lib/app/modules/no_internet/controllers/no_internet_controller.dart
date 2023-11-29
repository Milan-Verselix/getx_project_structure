
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class NoInternetController extends GetxController {
  //TODO: Implement NoInternetController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void reload(){
    Connectivity().checkConnectivity().then((value) {
      if(value!=ConnectivityResult.none)
      if(Get.currentRoute==Routes.NO_INTERNET){
        Get.offNamed(Get.previousRoute);
      }
    });
  }
}
