import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/features/launches/domain/usecases/get_launch.dart';
import 'package:spacex/features/launches/presentation/bloc/launch_event.dart';
import 'package:spacex/features/launches/presentation/bloc/launch_state.dart';

class LaunchesBloc extends Bloc<LaunchesEvent, LaunchesState> {
  final GetLaunches getLaunches;

  LaunchesBloc({required this.getLaunches}) : super(LaunchesInitial()) {
    on<FetchLaunches>(_onFetchLaunches);
  }

  Future<void> _onFetchLaunches(FetchLaunches event, Emitter<LaunchesState> emit) async {
    emit(LaunchesLoading());
    final result = await getLaunches();
    result.fold((failure) => emit(LaunchesError(failure.message)), (launches) => emit(LaunchesLoaded(launches)));
  }
}
