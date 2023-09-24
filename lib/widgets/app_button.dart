import 'package:flutter/material.dart';
import 'package:flutter_utils/flutter_utils.dart';
import 'package:form/core/extensions/build_context_ex.dart';

import '../core/constants/app_sizes.dart';

class AppButton extends StatelessWidget {
  final String label;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final Widget? icon;
  final FontWeight? fontWeight;
  final MainAxisAlignment mainAxisAlignment;

  const AppButton({
    Key? key,
    required this.label,
    this.width,
    this.fontSize,
    this.height,
    this.borderRadius,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.s10),
    required this.onPressed,
    this.fontWeight,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : icon = null,
        super(key: key);

  const AppButton.icon({
    Key? key,
    required this.label,
    required this.icon,
    this.width,
    this.fontSize,
    this.height,
    this.borderRadius,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.s10),
    required this.onPressed,
    this.fontWeight,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      label,
      style: TextStyle(
        fontSize: fontSize ?? Sizes.s18.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );

    var textWithIcon = Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.s16.w),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          text,
          icon ?? const SizedBox.shrink(),
        ],
      ),
    );

    return MaterialButton(
      textColor: Colors.white,
      color: color ?? context.colorScheme.primary,
      padding: padding,
      height: height ?? Sizes.s54.h,
      minWidth: width ?? double.infinity,
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      disabledColor: const Color(0xff9BA4D0),
      splashColor: Colors.white.withOpacity(0.1),
      highlightColor: Colors.white.withOpacity(0.1),
      shape: const StadiumBorder(),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              onPressed?.call();
            }
          : null,
      child: icon != null ? textWithIcon : text,
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String label;
  final Color? color;
  final Widget child;
  final double? fontSize;
  final VoidCallback onPressed;
  final FontWeight? fontWeight;
  final bool? underLine;

  AppTextButton({
    Key? key,
    required this.label,
    this.underLine = false,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.color,
  })  : child = Text(label),
        super(key: key);

  AppTextButton.icon({
    Key? key,
    required this.label,
    this.underLine = false,
    required this.onPressed,
    this.fontSize,
    this.fontWeight,
    this.color,
    required Widget icon,
    TextDirection? textDirection,
  })  : child = Row(
          textDirection: textDirection,
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            ScreenUtil().setHorizontalSpacing(5),
            Text(label),
          ],
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: color,
        textStyle: TextStyle(
          fontSize: fontSize ?? Sizes.s16.sp,
          fontWeight: fontWeight ?? FontWeight.w700,
          fontFamily: 'Poppins',
          decoration: underLine == true
              ? TextDecoration.underline
              : TextDecoration.none,
        ),
        padding: EdgeInsets.symmetric(horizontal: Sizes.s4.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.s6.h),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class AppOutlineButton extends StatelessWidget {
  final String label;
  final double? fontSize;
  final double? height;
  final double? width;
  final Color? color;
  final double? borderRadius;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final Widget? icon;
  final FontWeight? fontWeight;

  const AppOutlineButton({
    Key? key,
    required this.label,
    this.width,
    this.fontSize,
    this.height,
    this.borderRadius,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.s10),
    required this.onPressed,
    this.fontWeight,
  })  : icon = null,
        super(key: key);

  const AppOutlineButton.icon({
    Key? key,
    required this.label,
    required this.icon,
    this.width,
    this.fontSize,
    this.height,
    this.borderRadius,
    this.color,
    this.padding = const EdgeInsets.symmetric(horizontal: Sizes.s10),
    required this.onPressed,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Text text = Text(
      label,
      style: TextStyle(
        fontSize: fontSize ?? Sizes.s18.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: 0.5,
      ),
    );

    var textWithIcon = Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.s16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? const SizedBox.shrink(),
          SizedBox(height: Sizes.s16.h),
          text,
        ],
      ),
    );

    return MaterialButton(
      textColor: context.colorScheme.primary,
      color: color ?? context.colorScheme.onBackground,
      padding: padding,
      height: height ?? Sizes.s54.h,
      minWidth: width ?? context.width,
      elevation: 0,
      highlightElevation: 0,
      disabledElevation: 0,
      disabledColor: const Color(0xff9BA4D0),
      splashColor: Colors.white.withOpacity(0.1),
      highlightColor: Colors.white.withOpacity(0.1),
      shape:
          StadiumBorder(side: BorderSide(color: context.colorScheme.primary)),
      onPressed: onPressed != null
          ? () {
              FocusScope.of(context).requestFocus(FocusNode());
              onPressed?.call();
            }
          : null,
      child: icon != null ? textWithIcon : text,
    );
  }
}
