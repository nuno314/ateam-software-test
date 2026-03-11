import 'package:ateam_software_test/common/constants/app_text_style.dart';
import 'package:ateam_software_test/presentation/extensions/space_extension.dart';
import 'package:ateam_software_test/presentation/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final String? title;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final String? hint;
  final bool isPassword;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final Function()? onTap;
  final Function(String)? onTextChanged;
  final Function(String)? onSubmitted;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final bool isRequired;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final BorderSide? borderSide;
  final TextAlign textAlign;
  final int? maxLength;
  final bool showBorder;
  const AppTextField({
    super.key,
    this.hintText,
    this.title,
    this.controller,
    this.prefixIcon,
    this.hint,
    this.isPassword = false,
    this.readOnly = false,
    this.suffixIcon,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.onTap,
    this.onTextChanged,
    this.onSubmitted,
    this.maxLines,
    this.inputFormatters,
    this.enable = true,
    this.isRequired = false,
    this.fillColor,
    this.hintStyle,
    this.textStyle,
    this.borderSide,
    this.textAlign = TextAlign.left,
    this.maxLength,
    this.showBorder = true,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  Color _filledColor = ThemeColor.colorF2F2F3;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _filledColor = ThemeColor.colorF1F1FE;
        });
      } else {
        setState(() {
          _filledColor = ThemeColor.colorF2F2F3;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.title != null && widget.title!.isNotEmpty) ...[
          Text(
            widget.title!,
            style: AppTextStyle.textRegular24px.copyWith(
              color: ThemeColor.color1a1e25,
            ),
          ),
          8.vSpace,
        ],
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.r),
            border: widget.showBorder
                ? _focusNode.hasFocus
                      ? GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [
                              ThemeColor.color917AFD,
                              ThemeColor.color6246EA,
                            ],
                          ),
                          width: 0.8,
                        )
                      : Border.all(color: ThemeColor.colorE3E3E7, width: 0.8)
                : null,
          ),
          child: TextField(
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            focusNode: _focusNode,
            controller: _controller,
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 6,
              ),
              fillColor: _filledColor,
              hintText: widget.hintText,
              hintStyle: AppTextStyle.textRegular24px,
              focusColor: ThemeColor.color917AFD,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: widget.prefixIcon,
                    )
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: widget.suffixIcon,
                    )
                  : null,
              border: InputBorder.none,
              enabledBorder: widget.showBorder
                  ? OutlineInputBorder(
                      borderSide:
                          widget.borderSide ??
                          const BorderSide(
                            color: ThemeColor.colorE3E3E7,
                            width: 0.8,
                          ),
                      borderRadius: BorderRadius.circular(24.r),
                    )
                  : InputBorder.none,
              focusedBorder: widget.showBorder
                  ? OutlineInputBorder(
                      borderSide: widget.borderSide ?? BorderSide.none,
                      borderRadius: BorderRadius.circular(24.r),
                    )
                  : InputBorder.none,
            ),
            keyboardType: widget.keyboardType,
            textCapitalization: widget.textCapitalization,
            style:
                widget.textStyle ??
                AppTextStyle.textRegular24px.copyWith(
                  color: ThemeColor.color1a1e25,
                ),
            obscureText: widget.isPassword,
            onChanged: (text) {
              widget.onTextChanged?.call(text);
            },
          ),
        ),
      ],
    );
  }
}
