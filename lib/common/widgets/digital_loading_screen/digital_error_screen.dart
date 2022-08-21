import 'package:digitaltestproject/common/app_colors.dart';
import 'package:flutter/material.dart';

///[DigitalLoadingScreen] is the is widget shown when when Screen is fetching data from API
class DigitalLoadingScreen extends StatelessWidget {
  const DigitalLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.kPrimary),
    );
  }
}
