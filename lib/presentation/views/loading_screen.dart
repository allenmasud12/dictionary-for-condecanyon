import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dictionary/extension/extension.dart';
import 'package:dictionary/presentation/views/home.dart';
import 'package:dictionary/resources/colour_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../app/routes/app_routes.dart';
import '../../resources/assets_manager.dart';
import '../../resources/value_manager.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<LoadingScreen> {
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    get();
  }
  Future<void> get() async {
    await Future.delayed(const Duration(milliseconds: DurationConstant.d3000), () {
      Get.offAllNamed(AppRoutes.home);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /********** LOGO *******/
                      Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.50),
                          child: Image.asset(
                            ImageAssets.appLogo,
                            fit: BoxFit.contain,
                          )
                      ),
                      30.height,
                      /********** Loading *******/
                       SpinKitFadingFour(
                        color: ColorManager.primary,
                        size: AppSize.s30,
                      ),
                      if (isFirst)
                        DefaultTextStyle(
                          style:  TextStyle(
                            color: ColorManager.primary,
                            fontSize: AppSize.s20,
                            fontWeight: FontWeight.bold,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TypewriterAnimatedText(
                                  'Initializing...'),
                            ],
                            repeatForever: true,
                          ),
                        ),
                      40.height
                    ],
                  ),
                ),
              ),
              /******** POWERED BY ***********/
              Padding(
                padding: const EdgeInsets.only(bottom: AppSize.s40, top: AppSize.s5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      ImageAssets.footerImage,
                      height: AppSize.s40,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
