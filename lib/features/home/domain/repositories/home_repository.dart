import 'package:flutter_pokemon/features/home/data/sample_model.dart';

abstract class HomeRepository {
  Future<List<SampleModel>> getAllData();
  Future<void> addData(SampleModel data);
  Future<void> updateData(SampleModel data);
  Future<void> deleteData(int id);
}