// navigation_bloc.dart
import 'package:birdie_app/screens/dvrscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
   NavigationBloc() : super(CarLifeState()) {
    on<NavigateToCarLife>(_onNavigateToCarLife);
    on<NavigateToDvr>(_onNavigateToDvr);
    on<NavigateToMonitor>(_onNavigateToMonitor);
    on<NavigateToFiles>(_onNavigateToFiles);
    on<NavigateToProfilePage>(_onNavigateToProfilePage);
  }

  Future<void> _onNavigateToCarLife(NavigateToCarLife event, Emitter<NavigationState> emit) async {
    emit(LoadingState());
    await Future.delayed(Duration(milliseconds: 500)); 
    emit(CarLifeState());
  }

  Future<void> _onNavigateToDvr(NavigateToDvr event, Emitter<NavigationState> emit) async {
    emit(LoadingState());
      await Future.delayed(Duration(milliseconds: 500));
      emit(DVRState());
  }

  Future<void> _onNavigateToMonitor(NavigateToMonitor event, Emitter<NavigationState> emit) async {
    emit(LoadingState());
    await Future.delayed(Duration(milliseconds: 500)); 
    emit(MonitorState());
  }

  Future<void> _onNavigateToFiles(NavigateToFiles event, Emitter<NavigationState> emit) async {
    emit(LoadingState());
    await Future.delayed(Duration(milliseconds: 500)); // Simulate loading delay
    emit(FilesState());
  }

  Future<void> _onNavigateToProfilePage (NavigateToProfilePage event, Emitter<NavigationState> emit) async {
    emit(LoadingState());
    await Future.delayed(Duration(milliseconds: 500)); // Simulate loading delay
    emit(ProfilePageState());
  }

  
}