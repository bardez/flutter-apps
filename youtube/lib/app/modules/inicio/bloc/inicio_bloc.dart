import 'dart:async';
import 'package:bloc/bloc.dart';

import 'inicio_event.dart';
import 'inicio_state.dart';

class InicioBloc extends Bloc<InicioEvent, InicioState> {
  @override
  InicioState get initialState => InitialInicioState();

  @override
  Stream<InicioState> mapEventToState(InicioEvent event) async* {
    // TODO: Add Logic
  }
}
