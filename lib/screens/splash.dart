import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/custom_scaffold.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Container(
        padding: EdgeInsets.only(top: Helper.height * .2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(
            //   'Flutter Collection',
            //   textAlign: TextAlign.center,
            //   style: Helper.theme.headline2,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       'by grusha ',
            //       style: Helper.theme.headline2,
            //     ),
            //     SvgPicture.asset(
            //       'assets/default/ic_outlined_heart.svg', 
            //       height: 30,
            //       color: MyColors.pastelPink,
            //       ),
            //   ],
            // ),
            typingFirst(),
            typingSecond(),
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Lottie.asset('assets/splash.json',),
            ),
          ],
        ),
      ),
    );
  }

  typingFirst() => Center(
    child: DefaultTextStyle(
      style: Helper.theme.headline2!,
      child: AnimatedTextKit(
          displayFullTextOnTap: true,
        animatedTexts: [
          TypewriterAnimatedText(
            'FLUTTER COLLECTION',
          ),
        ],
      ),
    ),
  );

  // typingSecond() => Center(
  //   child: DefaultTextStyle(
  //     style: Helper.theme.headline2!,
  //     child: AnimatedTextKit(
  //       displayFullTextOnTap: true,
  //       animatedTexts: [
  //         TypewriterAnimatedText(
  //           'BY GRUSHA',
  //         ),
  //       ],
  //     ),
  //   ),
  // );
}