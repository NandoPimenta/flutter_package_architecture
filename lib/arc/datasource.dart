
abstract class Datasource<U>{
  Future<Map<String,dynamic>> call({U data});
}