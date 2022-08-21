import 'package:flutter/material.dart';

class AppTextStyle {
  ///[kSearchListAppBar] is used to show search App Bar Cell
  static const TextStyle kSearchListAppBar = TextStyle(
    color: Color(0xFFFFFFFF),
  );

  ///[kSearchListCellHeader] is used to show search List Cell Header
  static const TextStyle kSearchListCellHeader = TextStyle(
    fontWeight: FontWeight.w800,
    overflow: TextOverflow.ellipsis,
    fontSize: 16,
  );

  ///[kSearchListCellSubHeader] is used to show search List Cell sub Header
  static const TextStyle kSearchListCellSubHeader = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  ///[kSearchListCellFooter] is used to show search List Cell Footer
  static const TextStyle kSearchListCellFooter = TextStyle(
    fontSize: 14,
    overflow: TextOverflow.ellipsis,
    color: Colors.grey,
  );

  ///[kSearchDetailAppBarText] is used to show search Detail
  ///[AppBar] Style
  static const TextStyle kSearchDetailAppBarText = TextStyle(
    fontWeight: FontWeight.w800,
    overflow: TextOverflow.ellipsis,
    fontSize: 18,
  );

  ///[kSearchDetailDateText] is used to show search Detail
  ///date style
  static const TextStyle kSearchDetailDateText = TextStyle(
    fontWeight: FontWeight.w800,
    overflow: TextOverflow.ellipsis,
    fontSize: 18,
  );

  ///[kSearchDetailDateText] is used to show search Detail
  ///city style
  static const TextStyle kSearchDetailCityText = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
}
