import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class StoreX{}

class LoadingState  extends StoreX{}

class InitialState extends StoreX{}

class ErrorState extends StoreX{}

class SuccessState extends StoreX{}

class DisabledState extends StoreX{}

abstract class WidgetStore<S> extends ValueNotifier<S> {
  WidgetStore(super.value );



  Widget changeState(v) {
    if (v is LoadingState) {
      loadingState();
      return loadingWidget;
    }
    if (v is ErrorState) {
      errorState();
      return errorWidget;
    }
    if (v is SuccessState) {
      successState();
      return successWdiget;
    }
    if (v is DisabledState) {
      disabledState();
      return disabledWdiget;
    }
    initialState();
    return initialWidget;
  }

  late Widget loadingWidget;
  late Widget initialWidget;
  late Widget errorWidget;
  late Widget successWdiget;
  late Widget disabledWdiget;

  loadingState();
  initialState();
  errorState();
  successState();
  disabledState();
}

