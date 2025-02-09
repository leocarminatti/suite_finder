import 'package:flutter/material.dart';
import 'package:suite_finder/core/core.dart';

import '../../go_now.dart';

class SuiteCard extends StatelessWidget {
  const SuiteCard({
    super.key,
    required this.suite,
  });

  final SuiteEntity suite;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                suite.photos.first,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                suite.name,
                style: context.titleLarge.copyWith(
                  color: Colors.grey[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
