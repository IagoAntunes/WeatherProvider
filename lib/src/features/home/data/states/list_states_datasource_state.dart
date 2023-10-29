abstract class IListStatesDatasourceState {}

class SuccessListStatesDatasourcesState extends IListStatesDatasourceState {
  String response;
  SuccessListStatesDatasourcesState({
    required this.response,
  });
}

class ErrorListStatesDatasourcesState extends IListStatesDatasourceState {}
