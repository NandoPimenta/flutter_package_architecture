
import '../models/error_model.dart';

abstract class BaseException {
  ErrorModel? error;
  BaseException({ this.error});
}

class ServerException extends BaseException implements Exception{
  ServerException({ super.error });
}