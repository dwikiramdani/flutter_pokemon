import 'package:flutter_pokemon/features/home/data/models/sample_model.dart';

abstract class HomeRepository {
  Future<List<SampleModel>> getAllData();
  Future<void> getData(SampleModel data);
  Future<void> updateData(SampleModel data);
  Future<void> deleteData(int id);
}