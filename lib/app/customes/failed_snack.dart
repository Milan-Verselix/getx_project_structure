
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController FailedSnack(String title,String body){
  return Get.snackbar(title,body,backgroundColor: Colors.white,colorText: Colors.black,icon: const Icon(Icons.error_rounded,color: Colors.red),);
}