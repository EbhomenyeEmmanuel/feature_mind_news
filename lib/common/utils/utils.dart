import 'package:feature_mind_news/common/utils/colors.dart';
import 'package:feature_mind_news/common/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';
import 'dart:developer' as dev;

class Utils {
  //Utility method for logging to the console
  static void log({required dynamic message, String tag = ''}) {
    dev.log(message.toString(), name: tag);
  }

  //Utility method for displaying a snackbar
  static void showSnackBar(BuildContext context,
      {String? title, required String message}) async {
    SmartSnackBars.showTemplatedSnackbar(
      context: context,
      contentPadding: const EdgeInsets.all(12),
      backgroundColor: AppColors.primary,
      animateFrom: AnimateFrom.fromTop,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      duration: const Duration(seconds: 4),
      titleWidget: title != null
          ? Text(title,
              textAlign: TextAlign.start,
              style: context.textTheme.bodyLarge?.copyWith(color: Colors.white))
          : const SizedBox.shrink(),
      subTitleWidget: SizedBox(
        width: context.width * 0.85,
        child: Text(message,
            textAlign: TextAlign.start,
            maxLines: 5,
            style: context.textTheme.bodyLarge?.copyWith(color: Colors.white)),
      ),
    );
  }
}

//Used page route builder to create a transition animation
class FadePageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  FadePageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}

//Used page route builder to create a slide animation
class LeftToRightPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  LeftToRightPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Start off-screen to the right
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
        );
}
