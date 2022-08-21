import 'package:cached_network_image/cached_network_image.dart';
import 'package:digitaltestproject/common/app_text_style.dart';
import 'package:digitaltestproject/common/widgets/digital_divider/digital_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

///Screen constant declared here
const double _kCellHeight = 100;
const EdgeInsets _kCellCommonHorizontalPadding =
    EdgeInsets.symmetric(horizontal: 8.0);
const EdgeInsets _kImagePadding = EdgeInsets.only(left: 10, top: 4);
const double _kImageSize = 75;
const double _kImageBorderRadius = 5;
const EdgeInsets _kTextLeftPadding = EdgeInsets.only(left: 12.0);
const double _kTextSpacing = 8;
const String _kHearIconUrl = "assets/svg/heart.svg";
const String _kHearDefaultImageUrl = "assets/svg/no_image.svg";

///[SearchListingCell] is the cell displayed in listing page.
class SearchListingCell extends StatelessWidget {
  ///[imageUrl] image url to display in cell.
  ///if imageUrl sent empty default image from asset will be used
  final String imageUrl;

  ///[isFavourite] will make the  Favurite icon show or hide based
  ///on it
  final bool isFavourite;

  ///[title] to be shown in Cell
  final String title;

  ///[place] to be shown in Cell
  final String place;

  ///[date] to be shown in Cell. But no parsing will happen here.
  final String date;

  ///[onTap] on Cell Tap.
  final Function()? onTap;

  const SearchListingCell(
      {Key? key,
      required this.imageUrl,
      this.isFavourite = false,
      required this.date,
      required this.place,
      required this.title,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: _kCellHeight,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: _kCellCommonHorizontalPadding,
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: _kImagePadding,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(_kImageBorderRadius),
                            child: CachedNetworkImage(
                              width: _kImageSize,
                              height: _kImageSize,
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              errorWidget: (context, daa, data) {
                                return SvgPicture.asset(_kHearDefaultImageUrl);
                              },
                            ),
                          ),
                        ),
                        if (isFavourite) SvgPicture.asset(_kHearIconUrl),
                      ],
                    ),
                    Expanded(
                        child: Padding(
                      padding: _kTextLeftPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title,
                              style: AppTextStyle.kSearchListCellHeader),
                          const SizedBox(
                            height: _kTextSpacing,
                          ),
                          Text(
                            place,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.kSearchListCellSubHeader,
                          ),
                          const SizedBox(
                            height: _kTextSpacing,
                          ),
                          Text(
                            date,
                            style: AppTextStyle.kSearchListCellFooter,
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
            const DigitalDivider()
          ],
        ),
      ),
    );
  }
}
