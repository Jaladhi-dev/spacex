import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocBuilder, ReadContext;
import 'package:spacex/features/launches/domain/entities/launch_entity.dart';
import 'package:spacex/features/launches/presentation/bloc/launch_bloc.dart';
import 'package:spacex/features/launches/presentation/bloc/launch_event.dart';
import 'package:spacex/features/launches/presentation/bloc/launch_state.dart';

class LaunchesPage extends StatelessWidget {
  const LaunchesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LaunchesBloc, LaunchesState>(
        builder: (context, state) {
          if (state is LaunchesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LaunchesLoaded) {
            return ListView.builder(
              itemCount: state.launches.length,
              itemBuilder: (context, index) {
                final launch = state.launches[index];
                return LaunchTile(launch: launch);
              },
            );
          } else if (state is LaunchesError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 8),
                  ElevatedButton(onPressed: () => context.read<LaunchesBloc>().add(FetchLaunches()), child: const Text('Retry')),
                ],
              ),
            );
          } else {
            return Center(
              child: ElevatedButton(onPressed: () => context.read<LaunchesBloc>().add(FetchLaunches()), child: const Text('Load Launches')),
            );
          }
        },
      ),
    );
  }
}

class LaunchTile extends StatelessWidget {
  final LaunchEntity launch;

  const LaunchTile({super.key, required this.launch});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(launch.missionName ?? ''),
      subtitle: Text(launch.launchYear ?? ''),
      trailing: Text(launch.rocket?.rocket?.name ?? ''),
    );
  }
}
