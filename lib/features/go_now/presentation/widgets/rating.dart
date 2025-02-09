import 'package:flutter/material.dart';
import 'package:suite_finder/core/core.dart';

import 'widgets.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
    required this.rating,
    required this.reviewsCount,
  });

  final double rating;
  final int reviewsCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.yellow[700]!),
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow[700]!,
                size: 12,
              ),
              const SizedBox(width: 3),
              Text(
                rating.toString(),
                style: context.bodySmall,
              ),
            ],
          ),
        ),
        const SizedBox(width: 6),
        InkWell(
          onTap: () {},
          child: MoreButton(text: '$reviewsCount avaliações'),
        )
      ],
    );
  }
}
