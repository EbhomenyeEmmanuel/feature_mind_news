import 'package:feature_mind_news/common/utils/colors.dart';
import 'package:feature_mind_news/common/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:smart_snackbars/enums/animate_from.dart';
import 'package:smart_snackbars/smart_snackbars.dart';
import 'dart:developer' as dev;

class Utils {
  static void log({required dynamic message, String tag = ''}) {
    dev.log(message.toString(), name: tag);
  }

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
