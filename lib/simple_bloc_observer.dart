import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    debugPrint(change.toString());
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
  }
}
