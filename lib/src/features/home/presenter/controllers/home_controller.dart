import 'package:flutter/material.dart';

import 'package:weather_project/core/models/state_uf_model.dart';
import 'package:weather_project/src/features/home/domain/list_states_repository.dart';
import 'package:weather_project/src/features/home/presenter/utils/list_states_state.dart';

class HomeController extends ChangeNotifier {
  HomeController({
    required this.repository,
  });
  IListStatesState state = IdleListStatesState();
  List<StateUf> listStates = [];
  final ListStatesRepository repository;

  Future<void> getWeatherStates() async {
    state = LoadingListStatesState();

    listStates = [];
    final value = await repository.getWeatherStates();
    if (value != null) {
      listStates.addAll(value);
      state = SuccessListStatesState();
    } else {
      state = FailureListStatesState();
    }
    notifyListeners();
  }
}
