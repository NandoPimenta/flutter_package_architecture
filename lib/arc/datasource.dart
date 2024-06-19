abstract class Datasource<M, P> {
  Future<M> call({required P data});
}
