part of 'home_detail_bloc.dart';

abstract class HomeDetailState extends Equatable{}

class HomeInitialState extends HomeDetailState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeDetailLoadingProcess extends HomeDetailState {
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

class HomeOwnedDetailDataLoadedState extends HomeDetailState {
  final OwnedItemDetail data;
  final ReadBook readBook;

  HomeOwnedDetailDataLoadedState(this.data, this.readBook);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeDetailErrorState extends HomeDetailState {
  final String errorMessage;

  HomeDetailErrorState(this.errorMessage);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
