import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../go_now.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.suite,
  });

  final SuiteEntity suite;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...suite.categories.take(5).map(
                (e) => _CategoryIcon(icon: e.icon),
              ),
          if (suite.categories.length < 5) const Spacer(),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () {},
                child: MoreButton(text: 'ver todos'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({
    required this.icon,
  });

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade100,
      ),
      margin: const EdgeInsets.only(
        left: 15,
        top: 15,
        bottom: 15,
      ),
      child: Image.network(
        icon,
        width: 37,
        height: 37,
      ),
    );
  }
}
