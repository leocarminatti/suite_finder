import 'package:flutter/material.dart';
import 'package:suite_finder/core/core.dart';

class MoreButton extends StatelessWidget {
  const MoreButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            style: context.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.end,
            softWrap: true,
            overflow: TextOverflow.visible,
          ),
        ),
        Icon(
          Icons.keyboard_arrow_down_outlined,
          size: 14,
          color: Colors.grey[700],
        ),
      ],
    );
  }
}
