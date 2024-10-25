import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
 
 
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/AdminMensajeCreateContent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/admin/mensajes/create/bloc/AdminMensajeCreateState.dart';

class AdminMensajeCreatePage extends StatefulWidget {
  const AdminMensajeCreatePage({super.key});

  @override
  State<AdminMensajeCreatePage> createState() =>
      _AdminMensajeCreatePageState();
}
 
class _AdminMensajeCreatePageState extends State<AdminMensajeCreatePage> {
  AdminMensajeCreateBloc? _bloc;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<AdminMensajeCreateBloc>(context);
    return Scaffold(
        body: BlocListener<AdminMensajeCreateBloc, AdminMensajeCreateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          //context.read<AdminMensajeListBloc>().add(Getcategories());
            if (responsestate.data is bool) {
               Fluttertoast.showToast(
              msg: 'El mensaje se envio correctamente',
              toastLength: Toast.LENGTH_LONG);
                _bloc?.add(ResetForm());
          
              }
        
        } else if (responsestate is Error) {
          Fluttertoast.showToast(
              msg: responsestate.message, toastLength: Toast.LENGTH_LONG);
        }
      },
      child: BlocBuilder<AdminMensajeCreateBloc, AdminMensajeCreateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              AdminMensajeCreateContent(_bloc, state),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return AdminMensajeCreateContent(_bloc, state);
      }),
    ));
  }
}
