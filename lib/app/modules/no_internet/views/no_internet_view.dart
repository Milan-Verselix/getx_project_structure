import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../assets.dart';
import '../controllers/no_internet_controller.dart';

class NoInternetView extends GetView<NoInternetController> {
  const NoInternetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future(() => false);
      },
      child: Scaffold(
        body: MediaQuery(
          data: Get.mediaQuery.copyWith(textScaleFactor: 1.0),
          child: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage(Images.bg), fit: BoxFit.fill),
            ),
            child: SizedBox(
              height: Get.height,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 35,),
                    const Text("No Internet",style: TextStyle(color: AppColors.mainBlueColor,fontFamily: Fonts.zendots,fontSize: 32),),
                    const SizedBox(height: 24,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
