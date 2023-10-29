import 'package:http/http.dart' as http;

import '../states/list_states_datasource_state.dart';

abstract class IListStatesDatasource {
  Future<IListStatesDatasourceState> getListStates();
}

class ListStatesDatasource extends IListStatesDatasource {
  @override
  Future<IListStatesDatasourceState> getListStates() async {
    try {
      final Map<String, String> headers = {
        'X-Parse-Application-Id': 'nAX5VLA1WnL3qkzuYnlh4tzUqS9NJuKGL13L4vas',
        'X-Parse-REST-API-Key': '3Q8wzFGU6isxalfOyagYkz2bu0lCTcrtgJ7Q4iD7',
        'X-Parse-Revocable-Session': '1',
        'Content-Type':
            'application/json', // Opcional, dependendo dos requisitos da API
      };
      final result = await http.post(
        Uri.parse(
          'https://parseapi.back4app.com/parse/functions/informacoes_do_tempo',
        ),
        headers: headers,
      );
      if (result.statusCode == 200) {
        final response = result.body;
        return SuccessListStatesDatasourcesState(response: response);
      } else {
        return ErrorListStatesDatasourcesState();
      }
    } catch (e) {
      return ErrorListStatesDatasourcesState();
    }
  }
  //
}
