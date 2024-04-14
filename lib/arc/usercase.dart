
import 'package:package_architecture/arc/repository.dart';
import 'package:result_dart/result_dart.dart';
import '../errors/failures/failure.dart';

abstract class Usercase<BaseEntity extends Object, BaseEntityParams>{
  Repository<BaseEntity,BaseEntityParams> repository;
  Usercase({required this.repository});
  Future<Result<BaseEntity,CodeFailure>> call({required BaseEntityParams data});
}