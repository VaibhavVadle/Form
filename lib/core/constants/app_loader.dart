import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form/core/constants/app_sizes.dart';
import 'package:form/core/constants/app_theme.dart';

class AppLoader {
  AppLoader._();

  static CancelFunc? _cancel;

  static Widget activityIndicator() {
    return Center(
      child: CupertinoActivityIndicator(
        radius: Sizes.s14.h,
        color: AppThemeData.lightThemeData.colorScheme.primary,
      ),
    );
  }

  static void showLoader() {
    _cancel = BotToast.showCustomLoading(
      toastBuilder: (cancelFunc) {
        return Container(
          height: Sizes.s70.h,
          width: Sizes.s70.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizes.s8.r),
          ),
          child: activityIndicator(),
        );
      },
    );
  }

  static void dismiss() {
    if (_cancel != null) _cancel!();
  }
}
