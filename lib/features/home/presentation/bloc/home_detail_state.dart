part of 'home_detail_bloc.dart';

abstract class HomeDetailState extends Equatable{}

class HomeInitialState extends HomeDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeDetailDataLoadedState extends HomeDetailState {
  final BookDetails data;

  HomeDetailDataLoadedState(this.data);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeOwnedDataLoadedState extends HomeDetailState {
  HomeOwnedDataLoadedState();

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeErrorState extends HomeDetailState {
  final String errorMessage;

  HomeErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
