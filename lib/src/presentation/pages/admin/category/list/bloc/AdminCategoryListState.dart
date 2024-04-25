import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class AdminCategoryListState extends Equatable {
  final Resource? response;

  const AdminCategoryListState({this.response});

  AdminCategoryListState copyWith({Resource? response}) {
    return AdminCategoryListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
