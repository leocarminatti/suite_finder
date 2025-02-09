import 'package:flutter/material.dart';
import 'package:suite_finder/core/core.dart';

import '../../go_now.dart';

class MotelTitle extends StatelessWidget {
  const MotelTitle({
    super.key,
    required this.motels,
  });

  final MotelEntity motels;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          motels.name,
          style: context.titleLarge,
        ),
        Text(
          motels.neighborhood,
          style: context.titleSmall.copyWith(
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 6),
        Rating(
          rating: motels.rating,
          reviewsCount: motels.reviewsCount,
        ),
      ],
    );
  }
}
