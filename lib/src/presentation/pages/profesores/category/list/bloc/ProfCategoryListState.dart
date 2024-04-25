import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class ProfCategoryListState extends Equatable {
  final Resource? response;

  const ProfCategoryListState({this.response});

  ProfCategoryListState copyWith({Resource? response}) {
    return ProfCategoryListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
