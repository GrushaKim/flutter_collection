import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/utils/my_colors.dart';
import 'package:get_it/get_it.dart';

class ConfirmPopup extends StatelessWidget {
  ConfirmPopup({
    this.title,
    this.content,
    this.leftText,
    this.rightText,
    this.onTapLeft,
    this.onTapRight,
    this.center = false,
  });

  final String? title;
  final String? content;
  final String? leftText;
  final String? rightText;
  final VoidCallback? onTapLeft;
  final VoidCallback? onTapRight;
  final bool center;

  final appRouter = GetIt.I<NavigationService>();

  Future<bool> onWillPop() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext ctx) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 28),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                title != null
                    ? Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          title!,
                          style: Theme.of(ctx).textTheme.bodyText1?.copyWith(
                                fontSize: 16,
                              ),
                        ),
                      )
                    : Container(),
                Text(
                  content ?? '',
                  style: Theme.of(ctx).textTheme.bodyText1,
                )
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                button(right: false, ctx: ctx),
                //verticalDivider(),
                button(right: true, ctx: ctx),
              ],
            ),
          ),
        ],
      );

  button({required bool right, required BuildContext ctx}) => Expanded(
        child: InkWell(
          onTap: right
              ? (onTapRight ?? () => appRouter.popUpPop(value: right))
              : (onTapLeft ?? () => appRouter.popUpPop(value: right)),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 19),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: right ? const Radius.circular(8) : Radius.zero,
                bottomLeft: right ? Radius.zero : const Radius.circular(8),
              ),
              color: right ? MyColors.mainScarlet : Colors.white,
            ),
            child: Text(
              right ? rightText ?? 'Confirm' : leftText ?? 'Cancel',
              style: Theme.of(ctx).textTheme.bodyText1?.copyWith(
                    fontSize: 14,
                    color: right ? Colors.white : MyColors.txtBk,
                  ),
            ),
          ),
        ),
      );

  verticalDivider() => Container(
        width: 1,
        color: MyColors.hintGr ,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(color: Colors.white),
      );
}
