import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/data/local/app_pref.dart';
import 'app/data/network/base_api_service.dart';
import 'app/routes/app_pages.dart';
import 'app/services/connectivity_utils.dart';
import 'assets.dart';

void main() async{

  
  WidgetsFlutterBinding.ensureInitialized();

  await AppPref.init();
  await BaseApiService.initApi();

  ConnectivityUtils.instance.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.mainBlueColor,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light));

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
