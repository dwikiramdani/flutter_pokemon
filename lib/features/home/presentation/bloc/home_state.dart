part of 'home_bloc.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeDataLoadedState extends HomeState {
  final List<SampleModel> data;

  HomeDataLoadedState(this.data);
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);
}
