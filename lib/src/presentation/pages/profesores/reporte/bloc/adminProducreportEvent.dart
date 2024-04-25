import 'package:equatable/equatable.dart';
import 'package:sniper_pro/src/domain/models/Report.dart';

abstract class AdminProducreportEvent extends Equatable {
  const AdminProducreportEvent();
  @override
  List<Object?> get props => [];
}

class AdminProductreportInitEvent extends AdminProducreportEvent {
  const AdminProductreportInitEvent();
  @override
  List<Object?> get props => [];
}

class ChartSampleData {
  final String x;
  final double y;
  ChartSampleData({required this.x, required this.y});

  @override
  List<Object?> get props => [x, y];
}
