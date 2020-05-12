import 'package:youtube/app/modules/inicio/bloc/inicio_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:youtube/app/modules/inicio/inicio_page.dart';

class InicioModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => InicioBloc()),
      ];

  @override
  List<Dependency> get dependencies => [];

  @override
  Widget get view => InicioPage();

  static Inject get to => Inject<InicioModule>.of();
}
