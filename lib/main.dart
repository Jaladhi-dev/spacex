import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/launches/presentation/bloc/launch_bloc.dart';
import 'package:spacex/features/launches/presentation/pages/launch_page.dart';
import 'core/di/injection.dart' as di;
import 'features/launches/presentation/bloc/launch_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SpaceX App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => di.sl<LaunchesBloc>()..add(FetchLaunches()),
        child: const LaunchesPage(),
      ),
    );
  }
}