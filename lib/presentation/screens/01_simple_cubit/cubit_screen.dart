import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';

class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
            // este buildWhen ya viene incluido asi
            // pero sirve si queremos solo seguir un valor particular de un objeto por ej
            // buildWhen: (previous, current) => previous != current,
            builder: (context, state) => Text(state)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<UsernameCubit>()
              .setUsername(RandomGenerator.getRandomName());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
