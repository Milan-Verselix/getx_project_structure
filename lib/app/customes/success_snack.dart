
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController SuccessSnack(String title,String body){
  return Get.snackbar(title,body,backgroundColor: Colors.white,colorText: Colors.black,icon: const Icon(Icons.check_circle_rounded,color: Colors.green),);
}