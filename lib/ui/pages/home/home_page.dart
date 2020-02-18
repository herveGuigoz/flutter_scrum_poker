import 'package:flutter/material.dart';
import 'package:scrum_poker/Bloc/app_bloc.dart';
import 'package:scrum_poker/Bloc/provider.dart';
import 'package:scrum_poker/ui/pages/home/card.dart';
import 'package:scrum_poker/ui/widget/app_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppBloc _bloc;
  @override
  void initState() {
    _bloc = BlocProvider.of<AppBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(isSettingsButton: true),
      body: SafeArea(
        child: StreamBuilder<List<int>>(
            initialData: _bloc.initialNumbers,
            stream: _bloc.numbersList,
            builder: (context, snapshot) {
              return GridView.count(
                primary: false,
                padding: const EdgeInsets.all(16.0),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 2,
                children: <Widget>[
                  for (int number in snapshot.data) _buildCard(number),
                ],
              );
            }),
      ),
    );
  }
}

Widget _buildCard(int n) {
  return HomeCard(
    number: n,
  );
}
