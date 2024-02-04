import 'package:flutter_pokemon/features/home/data/models/sample_model.dart';
import 'package:flutter_pokemon/features/home/domain/repositories/home_repository.dart';

class HomeUseCase {
  final HomeRepository repository;

  HomeUseCase(this.repository);

  Future<List<SampleModel>> getAllData() {
    return repository.getAllData();
  }

  Future<void> addData(SampleModel data) {
    return repository.getData(data);
  }

  Future<void> updateData(SampleModel data) {
    return repository.updateData(data);
  }

  Future<void> deleteData(int id) {
    return repository.deleteData(id);
  }
}
