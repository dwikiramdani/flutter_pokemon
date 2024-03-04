import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item_detail.dart';
import 'package:flutter_pokemon/features/home/domain/repositories/home_repository.dart';

part 'home_detail_state.dart';

class HomeDetailBloc extends Cubit<HomeDetailState> {
  HomeDetailBloc() : super(HomeInitialState());

  Future<void> fetchPortalItemById(int bookId) async {
    try {
      final BookDetails data = await HomeRepository().getPortalItemById(bookId);
      emit(HomeDetailDataLoadedState(data));
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
