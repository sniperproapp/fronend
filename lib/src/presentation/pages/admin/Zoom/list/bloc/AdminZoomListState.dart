import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class AdminZoomListState extends Equatable {
  final Resource? response;

  const AdminZoomListState({this.response});

  AdminZoomListState copyWith({Resource? response}) {
    return AdminZoomListState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
