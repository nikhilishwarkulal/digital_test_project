import 'package:digitaltestproject/common/app_text_style.dart';
import 'package:digitaltestproject/modules/search_detail_screen/bloc/search_detail_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Screen constant declared here
const double _kAppBarHeightAfterSafeArea = 58;
const EdgeInsets _kAppBarHeartIconPadding = EdgeInsets.all(10.0);
const double _kHeartIconSize = 28;
const String _kHeartIconAssetPath = "assets/svg/heart.svg";
const String _kHeartDisabledIconAssetPath = "assets/svg/heart_disbled.svg";
const int _kAppBarMaxLine = 2;

///[SearchDetailAppbarWidget] is a widget that is put inside the AppBar
class SearchDetailAppbarWidget extends StatelessWidget {
  const SearchDetailAppbarWidget({
    Key? key,
    required this.state,
    this.onTap,
  }) : super(key: key);

  ///[state] is needed to disable or enable Fav icon and display title
  ///in AppBar.
  final SearchDetailScreenListLoaded state;

  ///[onTap] On Tap of fav icon action is sent as callBack
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      ///appbar height and top padding needed to work on safe areas.
      height: MediaQuery.of(context).padding.top + _kAppBarHeightAfterSafeArea,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: Row(
              children: [
                const BackButton(
                  color: Colors.blue,
                ),
                Expanded(
                  child: Text(
                    state.item.title,
                    style: AppTextStyle.kSearchDetailAppBarText,
                    maxLines: _kAppBarMaxLine,
                  ),
                ),
                InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: _kAppBarHeartIconPadding,
                    child: SvgPicture.asset(
                      state.item.isFavourite
                          ? _kHeartIconAssetPath
                          : _kHeartDisabledIconAssetPath,
                      width: _kHeartIconSize,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
