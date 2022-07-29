import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/custom_button.dart';
import 'package:flutter_collection/widgets/general/custom_scaffold.dart';
import 'package:flutter_collection/widgets/general/header.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:particles_flutter/particles_flutter.dart';

class AnimatedSplashScreen extends StatefulWidget {
  AnimatedSplashScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> with TickerProviderStateMixin {
  final router = GetIt.I<NavigationService>();
  final data = [
    SplashData(title: 'Discover Amazing Flutter World'),
    SplashData(title: 'Are you ready to fall in love with Flutter?'),
    SplashData(title: 'Now step out with ME to explore Flutter!'),
  ];
  bool _showClickBtn = false;

  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      vsync: this,
      initialIndex: 0,
      length: 3
    );

    _controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      bgColor: Colors.black,
      child: Column(
        children: [
          Header(
            canBack: true,
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: List.generate(3, (int idx) => splashView(idx)),
            ),
          ),
        ],
      ),
    );
  }


  splashView(int idx) => Container(
    width: Helper.width,
    height: Helper.height,
    decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.0, 1.0),
            end: Alignment(0.0, -0.27),
            colors: [
              Color(0xff004b81),
              Color(0xff004376),
              Color(0xff00325d),
              Color(0xff00254b),
              Color(0xff001e40),
              Color(0xff001c3d)
            ],
            stops: [0.0, 0.071, 0.284, 0.505, 0.738, 1.0],
          ),
        ),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 100, left: 25, right: 25),
              child: Text(
                data[idx].title, 
                style: Helper.theme.headline1?.copyWith(
                  color: Colors.white, 
                  fontSize: 36,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        idx == 0 ? particles() : const SizedBox(),
        idx != 2 
          ? swipeBtn() 
          : Builder(
          builder: (ctx) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              setState(() {
                _showClickBtn = true;
              });
            });

            if(_showClickBtn) {
              return clickBtn();
            } else {
              return const SizedBox();
            }
          },
        ),
        indicators(idx),
      ],
    ),
  );

  particles() => CircularParticle(
      key: UniqueKey(),
      awayRadius: 50,
      numberOfParticles: 120,
      speedOfParticles: 1,
      height: Helper.height,
      width: Helper.width,
      onTapAnimation: true,
      particleColor: MyColors.mainBlue.withOpacity(.38),
      awayAnimationDuration: const Duration(microseconds: 1000),
      maxParticleSize: 4,
      isRandSize: true,
      isRandomColor: false,
      awayAnimationCurve: Curves.easeInOutBack,
      enableHover: true,
      connectDots: true,
  );

  swipeBtn() => Positioned(
    bottom: 40,
    child: Container(
      width: Helper.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Swipe', 
            style: Helper.theme.headline1?.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Lottie.asset('assets/default/swipe.json', height: 36,),
        ],
      ),
    ),
  );

  clickBtn() => Positioned(
    bottom: 40,
    child: TweenAnimationBuilder(
      duration: const Duration(seconds: 2),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.linear,
      builder: (BuildContext ctx, double value, Widget? child) => Opacity(
        opacity: value,
        child: CustomButton(
          width: Helper.width - 50,
          onTap: () => router.pop(),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          bgColor: MyColors.mainBlue,
          vp: 15,
          height: 70,
          text: Text(
              'Click Here!', 
              style: Helper.theme.headline1?.copyWith(
                color: Colors.white,
              ),
            ),
        ),
      ),
    ),
  );

  indicators(int idx) => Positioned(
    bottom: 20,
    child: Container(
      width: Helper.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(3, (int i) => indicator(i, idx)),
      ),
    ),
  );

  indicator(int idx, int carouselIdx) => Container(
    width: 8,
    height: 8,
    margin: EdgeInsets.only(right: idx == 2 ? 0 : 8),
    decoration: BoxDecoration(
      border: Border.all(width: 0.8, color: Colors.white),
      borderRadius: BorderRadius.circular(100),
      color: idx == carouselIdx ? MyColors.mainBlue : Colors.white,
    ),
  );

}

class SplashData {
  final String title;
  final String? subTitle;

  SplashData({
    required this.title,
    this.subTitle,
  });
}