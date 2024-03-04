import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/features/home/domain/repositories/home_repository.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitialState());

  Future<void> fetchPortalItems() async {
    try {
      final List<Item> data = await HomeRepository().getPortalItems();
      emit(HomeDataLoadedState(data));
    } catch (e) {
      emit(HomeErrorState("Failed to fetch data"));
    }
  }

  Future<void> fetchOwnedItems() async {
    try {
      // final data = await HomeRepository().getPortalItems();
      emit(HomeOwnedDataLoadedState());
    } catch (e) {
      emit(HomeErrorState("Failed to fetch data"));
    }
  }
}
