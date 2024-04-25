import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class AdminProducreportState extends Equatable {
  final Resource? response;

  const AdminProducreportState({this.response});

  AdminProducreportState copyWith({Resource? response}) {
    return AdminProducreportState(response: response);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [response];
}
