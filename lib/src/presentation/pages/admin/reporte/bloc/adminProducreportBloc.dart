import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sniper_pro/src/domain/useCases/products/ProductsUseCase.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/reporte/bloc/adminProducreportState.dart';

class AdminProducreportBloc
    extends Bloc<AdminProducreportEvent, AdminProducreportState> {
  ProductsUseCase peoductsUseCase;
  AdminProducreportBloc(this.peoductsUseCase)
      : super(AdminProducreportState()) {
    on<AdminProductreportInitEvent>(_onInitevEvent);
  }

  Future<void> _onInitevEvent(AdminProducreportEvent event,
      Emitter<AdminProducreportState> emit) async {
    Resource response = await peoductsUseCase.report.run();
    print(response);
    emit(state.copyWith(response: response));
  }
}
