import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_project/core/components/error_state_widget.dart';
import 'package:weather_project/src/features/home/presenter/components/loading_list_state_widget.dart';
import 'package:weather_project/src/features/home/presenter/components/success_list_state_widget.dart';
import 'package:weather_project/src/features/home/presenter/controllers/home_controller.dart';
import 'package:weather_project/src/features/home/presenter/utils/list_states_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read<HomeController>().getWeatherStates(),
      builder: (context, snapshot) =>
          switch (context.read<HomeController>().state) {
        LoadingListStatesState() => const LoadingListStateWidget(),
        FailureListStatesState() => const ErrorStateWidget(),
        SuccessListStatesState() => const SuccessListStateWidget(),
        _ => Container(),
      },
    );
  }
}
