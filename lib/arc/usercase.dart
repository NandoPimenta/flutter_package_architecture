import 'package:package_architecture/arc/repository.dart';
import 'package:result_dart/result_dart.dart';
import '../errors/failures/failure.dart';

abstract class Usercase<R extends Object, P, M> {
  Repository<R, P, M> repository;
  Usercase({required this.repository});
  Future<Result<R, CodeFailure>> call({required P data});
}
