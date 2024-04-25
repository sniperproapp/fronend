import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';

class clientvideoState extends Equatable {
  final int? id;
  final String? like;

  final Resource? response;
  const clientvideoState({this.id = 0, this.like, this.response});

  clientvideoState copyWith({int? id, String? like, Resource? response}) {
    return clientvideoState(id: id, response: response, like: like);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, response, like];
}
