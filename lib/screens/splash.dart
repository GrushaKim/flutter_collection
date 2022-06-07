import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/routes/routes.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/custom_scaffold.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final router = GetIt.I<NavigationService>();

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 3), () => router.navigate(RouteNames.Main)
    );
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Container(
        padding: EdgeInsets.only(top: Helper.height * .2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            colorizedText('FLUTTER'),
            colorizedText('COLLECTION'),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'by Grusha K.',
                style: Helper.theme.headline1?.copyWith(fontSize: 18)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Lottie.asset('assets/splash.json',),
            ),
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'Updated on June 07, 2022',
                style: Helper.theme.bodyText1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  colorizedText(String text) => AnimatedTextKit(
        animatedTexts: [
          ColorizeAnimatedText(
            text,
            speed: const Duration(milliseconds: 1000),
            textStyle: Helper.theme.headline1!.copyWith(
              fontSize: 36,
            ),
            colors: [
              MyColors.mainScarlet,
              Colors.orange,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.blue.shade900,
              MyColors.mainPurple
            ],
          ), 
        ],
        isRepeatingAnimation: true,
      );
}