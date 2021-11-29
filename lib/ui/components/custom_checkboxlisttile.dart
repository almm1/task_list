import 'package:flutter/material.dart';

class CustomCheckboxListTile extends StatelessWidget {
  final double? size;
  final double? iconSize;
  final Function onChange;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? borderColor;
  final Color? unSelectedBacgroundColor;
  final IconData? icon;
  final bool value;
  final double? borderWidth;
  final double? bottomPading;
  final Text title;

  const CustomCheckboxListTile({
    Key? key,
    this.size,
    this.iconSize,
    required this.onChange,
    this.backgroundColor,
    this.iconColor,
    this.unSelectedBacgroundColor,
    this.icon,
    this.borderWidth,
    required this.title,
    this.borderColor,
    this.bottomPading,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onChange(!value);
          },
          child: Row(
            children: [
              Container(
                  height: size ?? 24,
                  width: size ?? 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: value
                          ? backgroundColor ?? Colors.blue
                          : unSelectedBacgroundColor ?? Colors.transparent,
                      border: Border.all(
                          width: borderWidth ?? 2.0,
                          color: borderColor ?? Colors.black)),
                  child: value
                      ? Icon(
                          icon ?? Icons.check,
                          color: iconColor ?? Colors.white,
                          size: iconSize ?? 20,
                        )
                      : null),
              const SizedBox(
                width: 10,
              ),
              Expanded(child: title)
            ],
          ),
        ),
        SizedBox(height: bottomPading)
      ],
    );
  }
}
