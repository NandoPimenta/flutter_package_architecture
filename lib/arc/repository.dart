
import 'package:package_architecture/arc/base_model.dart';
import 'package:result_dart/result_dart.dart';
import '../errors/exceptions/exeptions.dart';
import '../errors/failures/failure.dart';
import '../errors/models/error_model.dart';
import 'datasource.dart';

abstract class Repository<BaseEntity extends Object,BaseEntityParams>{
  
  Datasource<BaseModel,BaseEntityParams> datasource;
  Repository({required this.datasource});



  Future<Result<BaseEntity,CodeFailure>> call({required BaseEntityParams data});
 
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
