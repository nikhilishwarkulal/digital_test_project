import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///[SearchDetailAppBar] is the Appbar used in detail screen
class SearchDetailAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchDetailAppBar({
    Key? key,
    required this.getTitleWidget,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  ///[getTitleWidget] is used to get the [SearchDetailBody] from the screen
  final Widget Function() getTitleWidget;
  @override
  Widget build(BuildContext context) {
    return getTitleWidget();
  }

  @override
  final Size preferredSize;
}
