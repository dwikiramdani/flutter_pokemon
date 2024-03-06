import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/data/models/book_item.dart';
import 'package:flutter_pokemon/features/home/data/models/owned_item.dart';
import 'package:flutter_pokemon/features/home/domain/repositories/home_repository.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(HomeInitialState());

  int offset = 0;
  int limit = 10;
  int page = 1;
  bool isNextEnable = false;
  bool isPreviousEnable = false;

  void onChangeNextPage() async {
    offset = offset + 10;
    limit = limit + 10;
    page = page + 1;
    isPreviousEnable = true;
    await fetchOpenApiListOfItems();
  }

  void onChangePreviousPage() async {
    if (offset != 0) {
      offset = offset - 10;
      limit = limit - 10;
      page = page - 1;
      if(offset == 0){
        isPreviousEnable = false;
      }
    } else {
      isPreviousEnable = false;
    }
    await fetchOpenApiListOfItems();
  }

  Future<void> fetchOpenApiListOfItems({String query = ""}) async {
    try {
      emit(HomeLoadingProcess());
      final List<Item> data = await HomeRepository().getOpenApiListOfItems(
        offset: offset,
        limit: limit,
        query: query,
      );
      print("Item Length: ${data.length}");
      if (data.length == 10) {
        isNextEnable = true;
      }
      print("isNextEnable: ${isNextEnable}");
      emit(HomeDataLoadedState(data, isNextEnable, isPreviousEnable, page));
    } catch (e) {
      emit(HomeErrorState("Failed to fetch data"));
    }
  }

  Future<void> fetchOwnedItems() async {
    try {
      emit(HomeLoadingProcess());
      final data = await HomeRepository().getOwnedItems();
      emit(HomeOwnedDataLoadedState(data));
    } catch (e) {
      emit(HomeErrorState("Failed to fetch data"));
    }
  }
}
