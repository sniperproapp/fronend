import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class clientZoomState extends Equatable {
  final int? id;
  final String? like;

  final Resource? response;
  const clientZoomState({this.id = 0, this.like, this.response});

  clientZoomState copyWith({int? id, String? like, Resource? response}) {
    return clientZoomState(id: id, response: response, like: like);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, response, like];
}
