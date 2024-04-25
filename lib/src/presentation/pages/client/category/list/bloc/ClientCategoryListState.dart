import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ClientCategoryListState extends Equatable {
  final Resource? response;

  const ClientCategoryListState({this.response});

  ClientCategoryListState copyWith({Resource? response}) {
    return ClientCategoryListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
