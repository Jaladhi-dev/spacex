import 'package:equatable/equatable.dart';
import 'package:spacex/features/launches/domain/entities/launch_entity.dart';

abstract class LaunchesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LaunchesInitial extends LaunchesState {}

class LaunchesLoading extends LaunchesState {}

class LaunchesLoaded extends LaunchesState {
  final List<LaunchEntity> launches;

  LaunchesLoaded(this.launches);

  @override
  List<Object?> get props => [launches];
}

class LaunchesError extends LaunchesState {
  final String message;

  LaunchesError(this.message);

  @override
  List<Object?> get props => [message];
}
