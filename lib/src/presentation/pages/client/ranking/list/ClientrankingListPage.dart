import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sniper_pro/src/domain/models/Ranking.dart';
import 'package:sniper_pro/src/presentation/Utils/Resource.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/ClientrankingListItem.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/bloc/ClientRankingListBloc.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/bloc/ClientRankingListEvent.dart';
import 'package:sniper_pro/src/presentation/pages/client/ranking/list/bloc/ClientRankingListState.dart';

class ClientrankingListPage extends StatefulWidget {
  const ClientrankingListPage({super.key});

  @override
  State<ClientrankingListPage> createState() => _ClientrankingListPageState();
}

class _ClientrankingListPageState extends State<ClientrankingListPage> {
  ClientRankingListBloc? _bloc;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _bloc?.add(GetRanking());
    });
  }

  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<ClientRankingListBloc>(context);

    return Scaffold(
        body: BlocListener<ClientRankingListBloc, ClientRankingListState>(
      listener: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
        } else if (responseState is Error) {
          Fluttertoast.showToast(
              msg: responseState.message, toastLength: Toast.LENGTH_LONG);
          if (responseState.message == "Unauthorized") {
            Navigator.pushNamed(context, 'login/cerrarsesion');
          }
        }
      },
      child: BlocBuilder<ClientRankingListBloc, ClientRankingListState>(
          builder: (context, state) {
        final responseState = state.response;
        if (responseState is Success) {
          List<Ranking> ranking = responseState.data as List<Ranking>;

          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/fondodrawel.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: ListView.builder(
              itemCount: ranking.length,
              itemBuilder: (context, index) {
                return ClientrankingListItem(_bloc, ranking[index]);
              },
            ),
          );
        }
        return Container();
      }),
    ));
  }
}
