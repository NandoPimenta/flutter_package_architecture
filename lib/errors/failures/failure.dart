import 'package:equatable/equatable.dart';

import '../models/error_model.dart';

abstract class CodeFailure extends Equatable {
  final ErrorModel? error;
   const CodeFailure({ this.error});
}
