import 'package:digitaltestproject/common/app_colors.dart';
import 'package:flutter/material.dart';

///Screen constant declared here
const double _kDividerThickness = 1;
const double _kDividerHeight = 1;

///[DigitalDivider] is used to give an horizontal
///divider throughout the App
class DigitalDivider extends StatelessWidget {
  const DigitalDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: _kDividerThickness,
      height: _kDividerHeight,
      color: AppColors.dividerColor,
    );
  }
}
