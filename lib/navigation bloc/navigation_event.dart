// navigation_event.dart
import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class NavigateToCarLife extends NavigationEvent {}
class NavigateToDvr extends NavigationEvent {}
class NavigateToMonitor extends NavigationEvent {}
class NavigateToFiles extends NavigationEvent {}
class NavigateToProfilePage extends NavigationEvent {}