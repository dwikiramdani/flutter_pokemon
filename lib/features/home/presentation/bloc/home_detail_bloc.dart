import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item_detail.dart';
import 'package:flutter_pokemon/features/home/data/models/owned_item_detail.dart';
import 'package:flutter_pokemon/features/home/data/models/read_book.dart';
import 'package:flutter_pokemon/features/home/domain/repositories/home_repository.dart';

part 'home_detail_state.dart';

class HomeDetailBloc extends Cubit<HomeDetailState> {
  HomeDetailBloc() : super(HomeInitialState());

  Future<void> fetchOpenApiItemById(int bookId) async {
    try {
      emit(HomeDetailLoadingProcess());
      final BookDetails data = await HomeRepository().getPortalItemById(bookId);
      emit(HomeDetailDataLoadedState(data));
    } catch (e) {
      emit(HomeDetailErrorState("Failed to fetch data"));
    }
  }

  Future<void> fetchOwnedItemById(int bookId) async {
    try {
      emit(HomeDetailLoadingProcess());
      final OwnedItemDetail data =
          await HomeRepository().getOwnedItemById(bookId);
      final ReadBook? readBook =
          await HomeRepository().getOpenApiReadBook(bookId);
      emit(HomeOwnedDetailDataLoadedState(data, readBook!));
    } catch (e) {
      emit(HomeDetailErrorState("Failed to fetch data"));
    }
  }
}
