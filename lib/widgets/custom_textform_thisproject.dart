import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rusume_builder/constants/colors.dart';



class CustomTextformThisProject extends StatelessWidget {
  final double? fieldHeight;
  final bool? enabled, filled, isDense;
  final bool autufocus;
  final TextStyle? helperStyle, hintStyle, counterStyle, labelStyle;
  final TextEditingController? controller;
  final int? maxLength, maxLines;
  final FocusNode? focusNode;
  final String? initialValue,
      lable,
      prefixText,
      suffixText,
      helperText,
      counterText,
      hintText;
  final Widget? suffix, suffixIcon, prefix, prefixIcon, icon;
  final Color? suffixIconColor, prefixIconColor, fillColor, hoverColor;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final Function()? onTap;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputType? keyboardType;
  const CustomTextformThisProject({
    Key? key,
    this.fieldHeight,
    this.autufocus = false,
    this.enabled,
    this.filled,
    this.isDense,
    this.helperStyle,
    this.hintStyle,
    this.counterStyle,
    this.labelStyle,
    this.controller,
    this.maxLength,
    this.maxLines,
    this.focusNode,
    this.initialValue,
    this.prefixText,
    this.suffixText,
    this.helperText,
    this.counterText,
    this.hintText,
    this.lable,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.icon,
    this.suffixIconColor,
    this.prefixIconColor,
    this.fillColor,
    this.hoverColor,
    this.inputFormatters,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.onTap,
    this.contentPadding,
    this.textAlign,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (lable != null)
          Padding(
            padding: const EdgeInsets.only(
              bottom: 2,
              left: 4,
              right: 4,
            ),
            child: Text(
              '$lable',
              style: ResumeCustomTextStyle.poppins(
                fontSize: 14,
                color: Colors.black.withOpacity(0.60),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TextFormField(
            keyboardType: keyboardType,
            autofocus: autufocus,
            controller: controller,
            maxLength: maxLength,
            maxLines: maxLines ?? 1,
            focusNode: focusNode,
            initialValue: initialValue,
            enabled: enabled,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onTap: onTap,
            onSaved: onSaved,
            validator: validator,
            textAlign: textAlign ?? TextAlign.start,
            decoration: InputDecoration(
              hintTextDirection: TextDirection.ltr,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              isDense: isDense,
              icon: icon,
              suffix: suffix,
              suffixIcon: suffixIcon,
              prefix: prefix,
              prefixIcon: prefixIcon,
              prefixIconColor: prefixIconColor,
              suffixIconColor: suffixIconColor,
              filled: filled,
              fillColor: fillColor,
              contentPadding: contentPadding ?? EdgeInsets.zero,
              prefixText: prefixText,
              suffixText: suffixText,
              helperText: helperText,
              hoverColor: hoverColor,
              helperStyle: helperStyle,
              isCollapsed: false,
              hintStyle: hintStyle ??
                  ResumeCustomTextStyle.poppins(
                    color: Colors.black.withOpacity(0.52),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
              counterStyle: counterStyle,
              hintText: hintText,
              counterText: counterText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: ResumeConstColor.primary,
                  width: 1.2,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.35),
                  width: 1.0,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.black.withOpacity(0.35),
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red[300]!,
                  width: 1.2,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.red[600]!,
                  width: 1.5,
                ),
              ),
              errorStyle: ResumeCustomTextStyle.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.red[400]!,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
