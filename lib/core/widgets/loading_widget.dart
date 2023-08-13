import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitWaveSpinner(
      color: AppColors.orange,
      size: 50.0,
    ));
  }
}
