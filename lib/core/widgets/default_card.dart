import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  const DefaultCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: child,
    );
  }
}
