
import 'package:result_dart/result_dart.dart';
import '../errors/exceptions/exeptions.dart';
import '../errors/failures/failure.dart';
import '../errors/models/error_model.dart';

abstract class Usercase<T extends Object,U extends Object>{
  Future<Result<T,CodeFailure>> call({U data});
  Future<void> errorCheck({required String name, required Map<String,dynamic> data})async{
    if(!data.containsKey(name)) return;
      Map<String,dynamic> result = data[name];
      if(!result.containsKey('errors')) return ;
      var errors = data[name]['errors'] as List;
        if (errors.isNotEmpty) {
          ErrorModel error = ErrorModel(message:  errors[0]['message'], code:  errors[0]['code']);
          throw ServerException(error: error);
        }

    }
}