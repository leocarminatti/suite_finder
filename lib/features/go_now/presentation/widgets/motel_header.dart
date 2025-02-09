import 'package:flutter/material.dart';

import '../../go_now.dart';

class MotelHeader extends StatelessWidget {
  const MotelHeader({
    super.key,
    required this.motels,
  });

  final MotelEntity motels;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 15,
          backgroundImage: NetworkImage(motels.logo),
        ),
        const SizedBox(width: 10),
        MotelTitle(motels: motels),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_sharp,
            color: motels.favoritesCount > 0 ? Colors.red : Colors.grey,
          ),
        )
      ],
    );
  }
}
