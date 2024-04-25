import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sniper_pro/src/domain/models/Report.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportState.dart';
import 'package:sniper_pro/src/presentation/widgets/DefaultIconBack.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminProducreportContent extends StatelessWidget {
  AdminProducreportBloc? _bloc;
  AdminProducreportState? state;
  TooltipBehavior? tooltipBehavior;
  List<Report> data;
  AdminProducreportContent(
      this._bloc, this.state, this.tooltipBehavior, this.data);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Column(
                    children: [_buildTrackerColumnChart(tooltipBehavior, data)],
                  ),
                ),
                Divider(
                  color: Colors.grey[300],
                  height: 0,
                  thickness: 3,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<ColumnSeries<Report, String>> _getTracker(List<Report> data) {
  return <ColumnSeries<Report, String>>[
    ColumnSeries<Report, String>(
        dataSource: data,

        /// We can enable the track for column here.
        isTrackVisible: true,
        trackColor: const Color.fromRGBO(198, 201, 207, 1),
        borderRadius: BorderRadius.circular(10),
        xValueMapper: (Report sales, _) => sales.x as String,
        yValueMapper: (Report sales, _) => sales.y,
        name: 'Marks',
        dataLabelSettings: const DataLabelSettings(
            isVisible: true,
            labelAlignment: ChartDataLabelAlignment.top,
            textStyle: TextStyle(fontSize: 10, color: Colors.white)))
  ];
}

SfCartesianChart _buildTrackerColumnChart(
    TooltipBehavior? tooltipBehavior, List<Report> data) {
  return SfCartesianChart(
    plotAreaBorderWidth: 0,
    title: ChartTitle(text: 'SEÑALES POR USUARIO'),
    primaryXAxis: const CategoryAxis(majorGridLines: MajorGridLines(width: 0)),
    primaryYAxis: const NumericAxis(
        minimum: 0,
        maximum: 10,
        axisLine: AxisLine(width: 0),
        majorGridLines: MajorGridLines(width: 0),
        majorTickLines: MajorTickLines(size: 0)),
    series: _getTracker(data),
    tooltipBehavior: tooltipBehavior,
  );
}
