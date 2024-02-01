import 'package:flutter/foundation.dart';

import 'controller.dart';

abstract class BaseStore<S> extends ValueNotifier<S> {
  BaseStore(super.value, { this.controllers = const {}});

  Map<dynamic,BaseController> controllers = {};

  changePageState(S t) {
    value = t;
    for (var element in controllers.values) {
      element.changePageState(t);
    }
  }
}
