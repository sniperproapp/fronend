import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Zoom.dart';
import 'package:sniper_pro/src/presentation/Utils/BlocForItem.dart';

abstract class AdminZoomUpdateEvent extends Equatable {
  const AdminZoomUpdateEvent();

  @override
  List<Object?> get props => [];
}

class AdminzoomInitEvent extends AdminZoomUpdateEvent {
  final Zoom? zoom;
  const AdminzoomInitEvent({required this.zoom});
  @override
  List<Object?> get props => [zoom];
}

class NameChanged extends AdminZoomUpdateEvent {
  final BlocForItem name;
  const NameChanged({required this.name});
  @override
  List<Object?> get props => [name];
}

class LinkChanged extends AdminZoomUpdateEvent {
  final BlocForItem link;
  const LinkChanged({required this.link});
  @override
  List<Object?> get props => [link];
}

class descriptionChanged extends AdminZoomUpdateEvent {
  final BlocForItem description;
  const descriptionChanged({required this.description});
  @override
  List<Object?> get props => [description];
}

class FormSubmit extends AdminZoomUpdateEvent {
  const FormSubmit();
  @override
  List<Object?> get props => [];
}

class ZoomUpdatePickImage extends AdminZoomUpdateEvent {
  const ZoomUpdatePickImage();
}

class ZoomUpdateTakePhoto extends AdminZoomUpdateEvent {
  const ZoomUpdateTakePhoto();
}

class ResetForm extends AdminZoomUpdateEvent {
  const ResetForm();
  @override
  List<Object?> get props => [];
}
