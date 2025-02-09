import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import 'widgets.dart';

class MotelCard extends StatelessWidget {
  final MotelEntity motels;

  const MotelCard({
    super.key,
    required this.motels,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 24),
              child: MotelHeader(motels: motels),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                viewportFraction: .95,
                enableInfiniteScroll: false,
                padEnds: false,
                height: MediaQuery.of(context).size.height * 0.7,
              ),
              itemCount: motels.suites.length,
              itemBuilder: (context, index, realIndex) {
                final suite = motels.suites[index];
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SuiteCard(suite: suite),
                        const SizedBox(height: 10),
                        CategoryCard(suite: suite),
                        const SizedBox(height: 10),
                        PeriodCard(period: suite.periods.first),
                        const SizedBox(height: 10),
                        PeriodCard(period: suite.periods.last),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
