part of 'home_bloc.dart';

abstract class HomeState extends Equatable{}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeDataLoadedState extends HomeState {
  final List<Item> data;

  HomeDataLoadedState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeOwnedDataLoadedState extends HomeState {
  HomeOwnedDataLoadedState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeErrorState extends HomeState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
