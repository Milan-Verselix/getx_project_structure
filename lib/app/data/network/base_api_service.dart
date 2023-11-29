
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../assets.dart';
import '../../customes/failed_snack.dart';
import '../../customes/offline_snack.dart';
import '../../services/connectivity_utils.dart';

class BaseApiService{

  static late Dio dio;
  static Dio get dioClient=>dio;
  static int _noOfApiCalls = 0;
  static bool isLoaderShow = false;
  Logger logger=Logger();

  static Future<void> initApi() async {
    var options = BaseOptions(
      baseUrl: ApiPaths.baseUrl,
      connectTimeout: Duration(milliseconds: 30000),
      receiveTimeout: Duration(milliseconds: 60000),
      sendTimeout: Duration(milliseconds: 60000),
      headers: {
        "Content-Type": "application/json",
        "Accept": 'application/json'
      },
      validateStatus: (status)=>[200,422].contains(status),
    );

    dio = Dio(options);
    /*dio.interceptors.addAll([`
      ApiInterceptor(doEncryption: doEncryption, doWriteLog: doWriteLog),
      CacheInterceptor(),
    ]);*/
    /*_instance = BaseApiService._private(dio, baseUrl: AppPref.userBaseUrl);*/
  }


  Future<T?> callApi<T>(Future<T> request, {bool doShowLoader = true}) async {

    try {
      if (_noOfApiCalls == 0 &&
          !ConnectivityUtils.instance.hasInternet &&
          doShowLoader) {
        Timer.run(() => OfflineSnack());
        OfflineSnack();
      }
      if (doShowLoader && ConnectivityUtils.instance.hasInternet) {
        showLoader();
      }
      var response = await request;
      if (doShowLoader && ConnectivityUtils.instance.hasInternet) {
        dismissLoader();
      }
      return response;
    } on DioError catch (error) {
      if (doShowLoader) dismissLoader();
      logger.e("${error.requestOptions.uri}\n${error.requestOptions.data}\n$error");
      /*AppLogger.log(
          "callApi => DioError :: request -> ${error.requestOptions.uri}");
      AppLogger.log(
          "callApi => DioError :: ${error.type} -> ${error.message} \n  ${error.response}");*/
      switch (error.type) {
        case DioErrorType.receiveTimeout:
          OfflineSnack();
          break;
        case DioErrorType.cancel:
          break;
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.badCertificate:
        // TODO: Handle this case.
          break;
        case DioExceptionType.badResponse:

          break;
        case DioExceptionType.connectionError:
        // TODO: Handle this case.
          break;
        case DioExceptionType.unknown:
          OfflineSnack();
          break;
        case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
          break;
      }
    } on SocketException catch (socketException) {
      logger.w(socketException);
      FailedSnack("Something went to wrong.",socketException.message);
      /*if (doShowLoader) _hideLoader(context);
      AppLogger.log("callApi => SocketException :: $socketException");*/
    } catch (error) {
      logger.e(error);
      /*if (doShowLoader) _hideLoader(context);
      AppLogger.log("callApi :: $error");*/
    }
    return null;
  }

  void showLoader() {
    if (!isLoaderShow) {
      isLoaderShow = true;
      Get.dialog(
        WillPopScope(
            onWillPop: () => Future.value(false),
            child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.mainBlueColor,
                ))),
        barrierDismissible: false,
      );
    }
  }

  Future<void> dismissLoader() async {
    if (Get.isSnackbarOpen) {
      await Future.delayed(Duration(seconds: 1));
      dismissLoader();
      return;
    }
    if (isLoaderShow) {
      isLoaderShow = false;
      Get.back();
    }
  }
}