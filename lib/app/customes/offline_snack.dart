
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController OfflineSnack(){
   return Get.snackbar("Connection","No Internet",backgroundColor: Colors.white,colorText: Colors.black,icon: const Icon(Icons.signal_wifi_connected_no_internet_4_rounded,color: Colors.red),);
}