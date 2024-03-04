import 'package:flutter_pokemon/features/home/data/models/sample_model.dart';
import 'package:flutter_pokemon/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  List<SampleModel> _data = []; // Placeholder for data

  @override
  Future<List<SampleModel>> getAllData() async {
    return _data;
  }

  @override
  Future<void> getData(SampleModel data) async {
    _data.add(data);
  }

  @override
  Future<void> updateData(SampleModel data) async {
    final index = _data.indexWhere((element) => element.id == data.id);
    if (index != -1) {
      _data[index] = data;
    }
  }

  @override
  Future<void> deleteData(int id) async {
    _data.removeWhere((element) => element.id == id);
  }

  @override
  Future<List<SampleModel>> getPortalItems() async {
    return _data;
  }
  @override
  Future<List<SampleModel>> getPortalItemsDetail() async {
    return _data;
  }
  @override
  Future<List<SampleModel>> getPortalSharedLibraryItem() async {
    return _data;
  }
  @override
  Future<List<SampleModel>> getOpenApiSearchItem() async {
    return _data;
  }
  @override
  Future<List<SampleModel>> getOpenApiReadBook() async {
    return _data;
  }
  @override
  Future<List<SampleModel>> getOpenApiBookDownload() async {
    return _data;
  }
  @override
  Future<List<SampleModel>> setOpenApiKey() async {
    return _data;
  }

}
