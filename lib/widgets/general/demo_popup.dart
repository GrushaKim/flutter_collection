import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:get_it/get_it.dart';

class DemoPopup extends StatefulWidget {
  DemoPopup({
    required this.item,
  });

  final Widget item;

  @override
  State<DemoPopup> createState() => _DemoPopupState();
}

class _DemoPopupState extends State<DemoPopup> with 
  SingleTickerProviderStateMixin {
  final router = GetIt.I<NavigationService>();

  late AnimationController controller;
  late Animation<double> animation;
  
  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  _initAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addListener(() => setState(() {}));

    animation = Tween<double>(begin: 0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.bottomLeft,
      child: Dialog(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: EdgeInsets.zero,
        child: Container(
          height: Helper.height * .7,
          width: Helper.width * .9,
          child: Column(
            children: [
              close(),
              component(),
            ]
          ),
        ),
      ),
    );
  }

   close() => InkWell(
    hoverColor: MyColors.hintGr,
    onTap: () => router.pop(),
    child: Container(
      height: 24,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 10,),
      child: Icon(Icons.highlight_off, color: MyColors.hintGr.withOpacity(.38)),
    ),
  );

  component() => SingleChildScrollView(
    child: widget.item,
  );

}

// class DemoPopup extends StatelessWidget {
//   DemoPopup({Key? key}) : super(key: key);

//   final router = GetIt.I<NavigationService>();

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: animation,
//       child: Dialog(
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           children: [
//             close(),
//             widget(),
//           ]
//         ),
//       ),
//     );
//   }

//   close() => InkWell(
//     hoverColor: MyColors.hintGr,
//     onTap: () => router.pop(),
//     child: Container(
//       height: 24,
//       alignment: Alignment.centerRight,
//       margin: const EdgeInsets.only(left: 5, top: 10, right: 10, bottom: 10,),
//       child: Icon(Icons.highlight_off, color: MyColors.hintGr.withOpacity(.38)),
//     ),
//   );

//   widget() => SingleChildScrollView(
//     child: SizedBox(),
//   );
// }