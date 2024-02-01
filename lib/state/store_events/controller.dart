import 'package:flutter/foundation.dart';

import 'widget_store.dart';

abstract class BaseController<StoreX>  {
  BaseController( { this.widgetStores }){
    notifier = ValueNotifier(InitialState() as StoreX);
    widgetStores = {};
  }
   late ValueNotifier<StoreX> notifier;
  Map<dynamic, WidgetStore>? widgetStores;

  addWidgetStore(dynamic key, WidgetStore value) {
    widgetStores ??= {};
    widgetStores!.addAll({key: value});
  }

  getWidgetStore(dynamic w) {
    WidgetStore? c;
    widgetStores!.forEach((key, value) {
      if (key == w) {
        c = value;
      }
    });

    return c;
  }

  changePageState(StoreX t) {
    notifier.value = t;
    for (var element in widgetStores!.values) {
      element.value = t;
    }
  }

  changeOneLoading(dynamic k) {
    for (var element in widgetStores!.values) {
      element.value = DisabledState();
    }
    widgetStores!.forEach((key, value) {
      if (key == k) {
        value.value = LoadingState();
      }
    });
  }
  changeWidgetsStates(StoreX s, List k) {
     widgetStores!.forEach((key, value) {
      if (k.contains(key)) {
        value.value = LoadingState();
      }
    });
  }
}
