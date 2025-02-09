import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:suite_finder/core/core.dart';

import '../presentation.dart';

class GoNowPage extends StatelessWidget {
  const GoNowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<GoNowCubit>()..fetchAll(),
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.hotel_class, color: Colors.white),
              const SizedBox(width: 10),
              Text(
                'Ir agora',
                style: context.labelLarge.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        body: BlocBuilder<GoNowCubit, GoNowState>(
          builder: (context, state) {
            return switch (state.status) {
              GoNowStatus.initial => const Center(child: Text('Iniciar busca')),
              GoNowStatus.loading =>
                const Center(child: CircularProgressIndicator()),
              GoNowStatus.loaded => ListView.builder(
                  itemCount: state.motels.length,
                  itemBuilder: (context, index) =>
                      MotelCard(motels: state.motels[index]),
                ),
              GoNowStatus.error =>
                Center(child: Text('Erro: ${state.errorMessage}')),
            };
          },
        ),
      ),
    );
  }
}
