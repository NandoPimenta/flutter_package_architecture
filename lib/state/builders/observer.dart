import 'package:flutter/material.dart';
import '../store_events/widget_store.dart';

class ObserverState<T> extends StatelessWidget {
  const ObserverState(
      {super.key,
      required this.store,
      required this.initial,
      this.error,
      this.loading,
      this.disabled,
      this.success});
  final WidgetStore<T> store;
  final Widget? loading;
  final Widget? error;
  final Widget? success;
  final Widget? disabled;
  final Widget initial;

  @override
  Widget build(BuildContext context) {
    store.initialWidget = initial;
    store.loadingWidget = loading ?? initial;
    store.errorWidget = error ?? initial;
    store.successWdiget = success ?? initial;
    store.disabledWdiget = disabled ?? initial;
    return ValueListenableBuilder(
        valueListenable: store,
        builder: ((context, value, child) {
          return store.changeState(value);
        }));
  }
}
