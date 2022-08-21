import 'package:digitaltestproject/common/app_colors.dart';
import 'package:digitaltestproject/common/app_text_style.dart';
import 'package:digitaltestproject/common/i18n/app_localisation_strings.dart';
import 'package:digitaltestproject/core/translation/localisation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///Screen constant declared here
const double _kAppBarHeightAfterSafeArea = 58;
const EdgeInsets _kAppBarSearchPadding = EdgeInsets.only(left: 8.0);
const double _kAppBarSearchBarBorderRadius = 5;

///[SearchListingAppBar] is the Appbar used in search listing screen
class SearchListingAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchListingAppBar({
    Key? key,
    this.onCancelClicked,
    required this.onChanged,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(
          key: key,
        );

  ///[onCancelClicked] will trigger on cancel button clicked in search bar
  final Function()? onCancelClicked;

  ///[onChanged] on each key entered in search text field this is called
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimary,

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
                Expanded(
                  child: Padding(
                    padding: _kAppBarSearchPadding,
                    child: CupertinoSearchTextField(
                      backgroundColor: AppColors.searchBarColor,
                      borderRadius:
                          BorderRadius.circular(_kAppBarSearchBarBorderRadius),
                      itemColor: AppColors.kWhite,
                      style: AppTextStyle.kSearchListAppBar,
                      onChanged: onChanged,
                      onSubmitted: onChanged,
                    ),
                  ),
                ),
                CupertinoButton(
                  onPressed: onCancelClicked,
                  child: Text(
                    getTranslated(
                        AppLocalizationsStrings.searchListingAppBarCancel),
                    style: AppTextStyle.kSearchListAppBar,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  final Size preferredSize;
}
