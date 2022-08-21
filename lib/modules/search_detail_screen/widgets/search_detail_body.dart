import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitaltestproject/common/app_text_style.dart';
import 'package:digitaltestproject/common/widgets/digital_divider/digital_divider.dart';
import 'package:digitaltestproject/modules/search_detail_screen/bloc/search_detail_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Screen constant declared here
const double _kTextSpacing = 8;
const double _kTextToImageSpacing = 16;
const int _kSearchDetailDateMaxLine = 2;
const EdgeInsets _kTotalPadding = EdgeInsets.only(left: 16, right: 16, top: 8);
const EdgeInsets _kDividerToImagePadding = EdgeInsets.only(left: 0, top: 16);
const double _kImageCircularRadius = 5;
const String _kHearDefaultImageUrl = "assets/svg/no_image.svg";

/// [SearchDetailBody] will be used when viewModel data is available
class SearchDetailBody extends StatelessWidget {
  const SearchDetailBody({Key? key, required this.state}) : super(key: key);

  ///[state] will have viewModel isntance so it can be used for rendering
  ///this widget
  final SearchDetailScreenListLoaded state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _kTotalPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DigitalDivider(),
            Padding(
              padding: _kDividerToImagePadding,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(_kImageCircularRadius),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width,
                  imageUrl: state.item.imageUrl,
                  fit: BoxFit.cover,
                  errorWidget: (context, daa, data) {
                    return SvgPicture.asset(
                      _kHearDefaultImageUrl,
                      height: MediaQuery.of(context).size.width,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: _kTextToImageSpacing,
            ),
            Text(
              state.item.dateTimeInString,
              style: AppTextStyle.kSearchDetailDateText,
              maxLines: _kSearchDetailDateMaxLine,
            ),
            const SizedBox(
              height: _kTextSpacing,
            ),
            Text(
              state.item.city,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.kSearchDetailCityText,
            ),
            const SizedBox(
              height: _kTextToImageSpacing,
            ),
          ],
        ),
      ),
    );
  }
}
