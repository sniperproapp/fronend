import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/mensajes/create/bloc/profMensajeCreateBloc.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/mensajes/create/bloc/profMensajeCreateEvent.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/mensajes/create/bloc/profMensajeCreateState.dart';
import 'package:sniper_pro/src/presentation/pages/profesores/mensajes/create/profMensajeCreateContent.dart';
 
 

class profMensajeCreatePage extends StatefulWidget {
  const profMensajeCreatePage({super.key});

  @override
  State<profMensajeCreatePage> createState() =>
      _profMensajeCreatePageState();
}
 
class _profMensajeCreatePageState extends State<profMensajeCreatePage> {
  profMensajeCreateBloc? _bloc;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<profMensajeCreateBloc>(context);
    return Scaffold(
        body: BlocListener<profMensajeCreateBloc, profMensajeCreateState>(
      listener: (context, state) {
        final responsestate = state.response;
        if (responsestate is Success) {
          //context.read<profMensajeListBloc>().add(Getcategories());
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
      child: BlocBuilder<profMensajeCreateBloc, profMensajeCreateState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Loading) {
          return Stack(
            children: [
              profMensajeCreateContent(_bloc, state),
              Center(child: CircularProgressIndicator()),
            ],
          );
        }
        return profMensajeCreateContent(_bloc, state);
      }),
    ));
  }
}
