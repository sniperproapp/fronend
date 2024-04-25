import 'package:equatable/equatable.dart';

abstract class ProfHomeEvent extends Equatable {
  const ProfHomeEvent();

  @override
  List<Object?> get props => [];
}

class ProfChangeDrawerPage extends ProfHomeEvent {
  final int pageIndex;
  const ProfChangeDrawerPage({required this.pageIndex});
  @override
  List<Object?> get props => [pageIndex];
}

class ProfLogout extends ProfHomeEvent {
  const ProfLogout();
}

class ProfInfoGetUser extends ProfHomeEvent {
  const ProfInfoGetUser();
}
