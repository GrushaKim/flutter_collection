import 'package:flutter/cupertino.dart';
import 'package:flutter_collection/widgets/custom_scaffold.dart';
import 'package:flutter_collection/widgets/helper.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Flutter Collection\nby Grusha💚',
            style: Helper.theme.bodyLarge,
          ),
          Container(
            height: 200,
            child: Lottie.asset('assets/splash.json',),
          ),
        ],
      ),
    );
  }
}