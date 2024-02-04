import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pokemon/features/home/data/models/sample_model.dart';
import 'package:flutter_pokemon/features/home/domain/usecases/home_usecase.dart';

part 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final HomeUseCase useCase;

  HomeBloc(this.useCase) : super(HomeInitialState());

  Future<void> fetchData() async {
    try {
      final data = await useCase.getAllData();
      emit(HomeDataLoadedState(data));
    } catch (e) {
      emit(HomeErrorState("Failed to fetch data"));
    }
  }
}
