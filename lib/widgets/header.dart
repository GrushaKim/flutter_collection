import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:flutter_collection/widgets/helper.dart';
import 'package:get_it/get_it.dart';

class Header extends StatelessWidget {
  Header({
    this.title,
    this.canBack = false,
    this.onTap,
  });

  final String? title;
  final bool canBack;
  final VoidCallback?  onTap;

  final appRouter = GetIt.I<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Helper.height * .07,
      color: MyColors.mainScarlet,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          canBack 
          ? GestureDetector(
            onTap: onTap ?? () => appRouter.pop(),
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              child: const Icon(
                Icons.arrow_back, 
                size: 24,
                color: Colors.white,
              ),
            ),
          )
          : Container(),
          title != '' && title != null 
          ? Expanded(
            child: Container(
              padding: canBack ? const EdgeInsets.only(right: 50) : EdgeInsets.zero,
              alignment: Alignment.center,
              child: Text(
                title!,
                style: Helper.theme.bodyText1?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          )
          : Container(),
          Container(),
        ],
      ),
    );
  }
}