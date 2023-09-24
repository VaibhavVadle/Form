import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form/core/extensions/build_context_ex.dart';

import '../core/constants/app_sizes.dart';
import '../core/constants/app_theme.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool readOnly;
  final bool obscureText;
  final TextInputType keyboardInputType;
  final VoidCallback? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLength;
  final Color? textColor;
  final Color? labelColor;
  final bool? filled;
  final String? label;
  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final TextStyle? errorStyle;
  final String? counterText;
  final int maxLines;
  final AutovalidateMode? autovalidateMode;
  final double? height;
  final double? width;
  final Widget? labelWidget;

  const AppTextFormField({
    Key? key,
    required this.controller,
    this.hintText,
    this.onChanged,
    this.inputFormatters,
    this.labelColor,
    this.hintStyle,
    this.maxLength,
    this.readOnly = false,
    this.obscureText = false,
    this.filled = true,
    this.validator,
    this.onTap,
    this.prefix,
    this.counterText,
    this.suffix,
    this.textColor,
    this.maxLines = 1,
    this.label,
    this.labelStyle,
    this.errorStyle,
    this.autovalidateMode,
    this.keyboardInputType = TextInputType.text,
    this.height,
    this.width,
    this.labelWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelWidget != null)
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.s4.h),
            child: labelWidget,
          ),
        if (label != null)
          Padding(
            padding: EdgeInsets.only(bottom: Sizes.s4.h),
            child: Text(
              label ?? '',
              style: labelStyle ??
                  TextStyle(
                    fontSize: Sizes.s14.sp,
                    color: labelColor ?? context.colorScheme.primary,
                  ),
            ),
          ),
        SizedBox(
          height: height,
          child: TextFormField(
            autofocus: false,
            autocorrect: false,
            cursorColor: AppThemeData.borderColor,
            controller: controller,
            readOnly: readOnly,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            keyboardType: keyboardInputType,
            onChanged: onChanged,
            onTap: onTap,
            obscureText: obscureText,
            maxLines: maxLines,
            autovalidateMode:
                autovalidateMode ?? AutovalidateMode.onUserInteraction,
            style: TextStyle(
              fontSize: Sizes.s14.sp,
              color: context.colorScheme.primary,
            ),
            decoration: InputDecoration(
              filled: filled,
              counterText: counterText,
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: hintStyle ??
                  TextStyle(
                    fontSize: Sizes.s14.sp,
                  ),
              errorStyle: errorStyle ??
                  TextStyle(
                    fontSize: Sizes.s14.sp,
                  ),
              prefixIcon: prefix,
              suffixIcon: suffix,
              contentPadding: EdgeInsets.symmetric(
                horizontal: Sizes.s15.h,
                vertical: Sizes.s12.h,
              ),
              border: _outlineInputBorder(AppThemeData.borderColor),
              enabledBorder: _outlineInputBorder(AppThemeData.borderColor),
              focusedBorder: _outlineInputBorder(AppThemeData.borderColor),
              errorBorder: _outlineInputBorder(Colors.red),
              focusedErrorBorder: _outlineInputBorder(Colors.red),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(Sizes.s10.r),
      borderSide: BorderSide(color: color),
    );
  }
}
