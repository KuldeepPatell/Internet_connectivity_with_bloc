import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project2/bloc/internet_bloc/internet_event.dart';
import 'package:project2/bloc/internet_bloc/internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? connectivitySubscribtion;

  InternetBloc() : super(InternetInitialState()) {
    on<InternetConnectEvent>((event, emit) => emit(InternetConnectState()));
    on<InternetLostEvent>((event, emit) => emit(InternetLostState()));

    connectivitySubscribtion =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetConnectEvent());
      } else {
        add(InternetLostEvent());
      }
    });
  }
  @override
  Future<void> close() {
    connectivitySubscribtion?.cancel();
    return super.close();
  }
}
