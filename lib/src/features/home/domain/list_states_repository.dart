import 'package:weather_project/core/models/state_uf_model.dart';
import 'package:weather_project/src/features/home/data/datasource/list_states_datasource.dart';
import 'package:weather_project/src/features/home/data/states/list_states_datasource_state.dart';
import 'package:weather_project/core/models/info_state_model.dart';

abstract class IListStatesRepository {
  Future<List<StateUf>?> getWeatherStates();
}

class ListStatesRepository extends IListStatesRepository {
  ListStatesDatasource data;
  ListStatesRepository({
    required this.data,
  });
  @override
  Future<List<StateUf>?> getWeatherStates() async {
    final result = await data.getListStates();
    if (result is SuccessListStatesDatasourcesState) {
      InfoStateModel teste = InfoStateModel.fromJson(result.response);
      List<StateUf> listStates = [];
      for (var item in teste.estados) {
        listStates.add(item);
      }
      return listStates;
    } else if (result is ErrorListStatesDatasourcesState) {
      return null;
    }
    return null;
  }
  //
}
