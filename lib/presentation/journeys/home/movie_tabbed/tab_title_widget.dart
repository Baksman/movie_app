import 'package:flutter/material.dart';
import 'package:movie_app/common/extension/size_extensions.dart';
import 'package:movie_app/common/constants/size_constant.dart';
import 'package:movie_app/presentation/themes/app_color.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool isSelected;

  const TabTitleWidget(
      {Key key, this.title, this.onTap, this.isSelected = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                  bottom: BorderSide(
                      width: Sizes.dimen_1.h,
                      color: isSelected
                          ? AppColor.royalBlue
                          : Colors.transparent))),
          child: Text(title,
              style: isSelected
                  ? Theme.of(context).textTheme.royalBlueSubtitle1
                  : Theme.of(context).textTheme.subtitle1)),
    );
  }
}
