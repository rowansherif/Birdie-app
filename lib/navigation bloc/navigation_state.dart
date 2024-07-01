// navigation_state.dart
import 'package:equatable/equatable.dart';

abstract class NavigationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadingState extends NavigationState {}

class CarLifeState extends NavigationState {}
class DVRState extends NavigationState {}
class MonitorState extends NavigationState {}
class FilesState extends NavigationState {}
class ProfilePageState extends NavigationState {}