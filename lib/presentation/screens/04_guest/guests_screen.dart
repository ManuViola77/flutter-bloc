import 'package:blocs_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/blocs.dart';

class GuestsScreen extends StatelessWidget {
  const GuestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc - GuestBloc'),
      ),
      body: const _TodoView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read<GuestsBloc>().addGuest(RandomGenerator.getRandomName());
        },
      ),
    );
  }
}

class _TodoView extends StatelessWidget {
  const _TodoView();

  @override
  Widget build(BuildContext context) {
    final guestsBloc = context.watch<GuestsBloc>();
    final selectedFilter = guestsBloc.state.filter;

    return Column(
      children: [
        const ListTile(
          title: Text('Listado de invitados'),
          subtitle: Text('Estas son las personas a invitar a la fiesta'),
        ),

        SegmentedButton(
          segments: const [
            ButtonSegment(value: GuestsFilter.all, icon: Text('Todos')),
            ButtonSegment(value: GuestsFilter.invited, icon: Text('Invitados')),
            ButtonSegment(
                value: GuestsFilter.notInvited, icon: Text('No invitados')),
          ],
          selected: <GuestsFilter>{selectedFilter},
          onSelectionChanged: (value) {
            guestsBloc.changeFilter(value.first);
          },
        ),
        const SizedBox(height: 5),

        /// Listado de personas a invitar
        Expanded(
          child: ListView.builder(
            itemCount: guestsBloc.state.howManyFilteredGuests,
            itemBuilder: (context, index) {
              final guest = guestsBloc.state.filteredGuests[index];

              return SwitchListTile(
                  title: Text(guest.description),
                  value: guest.done,
                  onChanged: (value) {
                    guestsBloc.toggleGuest(guest.id);
                  });
            },
          ),
        )
      ],
    );
  }
}
