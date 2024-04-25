import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/adminProducreportContent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportState.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class adminreportePage extends StatefulWidget {
  const adminreportePage({super.key});

  @override
  State<adminreportePage> createState() => _adminreportePageState();
}

AdminProducreportBloc? _bloc;
TooltipBehavior? tooltipBehavior;

class _adminreportePageState extends State<adminreportePage> {
  @override
  void initState() {
    tooltipBehavior = TooltipBehavior(
        enable: true,
        canShowMarker: false,
        header: '',
        format: 'point.y marks in point.x');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(AdminProductreportInitEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminProducreportBloc>(context);
    return Scaffold(
        body: BlocListener<AdminProducreportBloc, AdminProducreportState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          // Fluttertoast.showToast(msg: 'ok', toastLength: Toast.LENGTH_LONG);
        }
        if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminProducreportBloc, AdminProducreportState>(
          builder: (context, state) {
        final responseState = state.response;

        if (responseState is Success) {
          Fluttertoast.showToast(
              msg: 'Reporte', toastLength: Toast.LENGTH_LONG);

          return AdminProducreportContent(
              _bloc, state, tooltipBehavior, responseState.data);
        }
        return AdminProducreportContent(_bloc, state, tooltipBehavior, []);
      }),
    ));
  }
}
