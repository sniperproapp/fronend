import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

abstract class AdminHomeEvent extends Equatable {
  const AdminHomeEvent();

  @override
  List<Object?> get props => [];
}

class AdminChangeDrawerPage extends AdminHomeEvent {
  final int pageIndex;
  const AdminChangeDrawerPage({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class AdminLogout extends AdminHomeEvent {
  const AdminLogout();
}

class adminProfInfoGetUser extends AdminHomeEvent {
  const adminProfInfoGetUser();
}
