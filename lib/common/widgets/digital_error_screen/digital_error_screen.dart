import 'package:digitaltestproject/common/i18n/app_localisation_strings.dart';
import 'package:digitaltestproject/core/translation/localisation.dart';
import 'package:flutter/material.dart';

///Screen constant declared here
const EdgeInsets _kErrorScreenPadding = EdgeInsets.symmetric(horizontal: 18);

///[DigitalEmptyScreen] is the is widget shown when there is network error
class DigitalEmptyScreen extends StatelessWidget {
  const DigitalEmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: _kErrorScreenPadding,
        child: Text(
          getTranslated(AppLocalizationsStrings.emptyScreenDescription),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
