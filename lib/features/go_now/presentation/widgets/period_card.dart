import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../go_now.dart';

class PeriodCard extends StatelessWidget {
  const PeriodCard({
    super.key,
    required this.period,
    this.onTap,
  });

  final PeriodEntity period;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultCard(
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        onTap: () {},
        title: Text(
          period.formattedTime,
          style: context.labelLarge.copyWith(
            fontWeight: FontWeight.w300,
            color: Colors.grey[800],
          ),
        ),
        subtitle: Text(
          period.totalPrice.toCurrency(),
          style: context.labelLarge.copyWith(
            fontWeight: FontWeight.w300,
            color: Colors.grey[800],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey[500],
        ),
      ),
    );
  }
}
