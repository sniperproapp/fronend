import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/blocProvider.dart';
import 'package:sniper_pro/src/domain/models/Product.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/ClientProductDescargoContent.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproducdescargoState.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproductdescargoBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/descargo/bloc/clientproductdescargoEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';

import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProducListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/product/list/bloc/ClientProductListEvent.dart';

class ClientProductDescargoPage extends StatefulWidget {
  const ClientProductDescargoPage({super.key});

  @override
  State<ClientProductDescargoPage> createState() =>
      _ClientProductDescargoPageState();
}

class _ClientProductDescargoPageState extends State<ClientProductDescargoPage> {
  clientproductdescargoBloc? _bloc;

  // @override
  // void initState() {
  //   //TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _bloc?.add(inituser());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<clientproductdescargoBloc>(context);
    return Scaffold(
        body:
            BlocListener<clientproductdescargoBloc, clientproducdescargoState>(
      listener: (context, state) async {
        final responseState = state.response;

        if (responseState! is Success) {
          if (state.authResponse?.user.descargo == 0) {
            Fluttertoast.showToast(
                msg: 'Términos Aceptados Será Redirigido',
                toastLength: Toast.LENGTH_LONG);
          }
          _bloc?.add(cambiarvalordescargouser());

          await Future.delayed(Duration(seconds: 2));
          // ignore: use_build_context_synchronously
          context.read<ClientHomeBloc>().add(clientInfoGetUser());
        }
      },
      child: BlocBuilder<clientproductdescargoBloc, clientproducdescargoState>(
          builder: (context, state) {
        return ClientProductDescargoContent(_bloc, state);
      }),
    ));
  }
}
