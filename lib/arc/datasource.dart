
abstract class Datasource<BaseModel,BaseEntityParams>{
  Future<BaseModel> call({required BaseEntityParams data});
}