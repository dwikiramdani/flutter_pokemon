part of 'home_bloc.dart';

abstract class HomeState extends Equatable{}

class HomeInitialState extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoadingProcess extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeDataLoadedState extends HomeState {
  final List<Item> data;
  bool isNextEnable = false;
  bool isPreviousEnable = false;
  int page = 1;

  HomeDataLoadedState(this.data, this.isNextEnable, this.isPreviousEnable, this.page);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeOwnedDataLoadedState extends HomeState {
  final List<OwnedItem> data;

  HomeOwnedDataLoadedState(this.data);

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
