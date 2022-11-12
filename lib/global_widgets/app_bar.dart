import 'package:flavored_app_demo/extensions/num_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.showDivider = false,
    this.leading,
    this.showBackBtn = true,
    this.padding,
    this.titleStyle,
    this.bgColor,
    this.backBtnColor,
  }) : super(key: key);

  final String? title;
  final TextStyle? titleStyle;
  final bool? showDivider;
  final Widget? leading;
  final Color? backBtnColor;
  final bool? showBackBtn;
  final EdgeInsets? padding;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.size.width,
      color: bgColor ?? Colors.transparent,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (showBackBtn == true)
              GestureDetector(
                onTap: () => Get.back(),
                child: Icon(
                  CupertinoIcons.arrow_left,
                  color: backBtnColor ??
                      Theme.of(context).textTheme.bodyText1!.color,
                  size: 24.0,
                ),
              ),
            if (showBackBtn == true) 16.toSizedBoxWidth(),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (leading != null) leading!,
                  if (leading != null && title != null) 16.toSizedBoxWidth(),
                  if (title != null && title!.isNotEmpty)
                    Text(
                      title!,
                      style: titleStyle ??
                          TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).textTheme.bodyText1!.color,
                            height: 1.0,
                          ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
