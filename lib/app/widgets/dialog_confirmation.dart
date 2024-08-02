
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../assets.dart';

class DialogConfirmation {
  static final instance = DialogConfirmation._();

  DialogConfirmation._();
  bool isAdLoaded = false;

  void show(BuildContext context,
      {required Function() callback, required String text}) {
    isAdLoaded=false;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, void Function(void Function()) setState) {


              return AlertDialog(
                backgroundColor: Colors.white,
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 0,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: Get.width,
                          margin: const EdgeInsets.only(
                            top: 45,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.only(
                              top: 60, left: 23, right: 23, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                text,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    height: 1.5,
                                    fontFamily: Fonts.zendots,
                                    fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 25,
                              ),

                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: callback,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.mainBlueColor,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 15),
                                        child: Center(
                                            child: Text(
                                              "yes",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: Fonts.zendots,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: (){
                                        Get.back();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        padding:
                                        EdgeInsets.symmetric(vertical: 15),
                                        child: Center(
                                            child: Text(
                                              "cancel",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: Fonts.zendots,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Image.asset(Images.splash_bg_top),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }


}