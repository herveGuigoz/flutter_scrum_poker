import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scrum_poker/Bloc/app_bloc.dart';
import 'package:scrum_poker/router.dart';
import 'package:scrum_poker/ui/common/app_colors.dart';
import 'Bloc/provider.dart';
import 'ui/pages/home/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Allow portait only
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return BlocProvider<AppBloc>(
      blocBuilder: () => AppBloc(),
      blocDispose: (AppBloc bloc) => bloc?.dispose(),
      child: MaterialApp(
        title: 'Scrum Poker',
        theme: ThemeData(
          primaryColor: AppColors
              .coral, // The background color for major parts of the app (toolbars, tab bars, etc)
          scaffoldBackgroundColor:
              AppColors.verve, // The background color for our app.
          textTheme: TextTheme(
            body1: TextStyle(color: AppColors.text, fontFamily: 'Avenir'),
            body2: TextStyle(color: AppColors.text, fontFamily: 'Avenir'),
            title: TextStyle(color: AppColors.text, fontFamily: 'Avenir'),
            subtitle: TextStyle(color: AppColors.text, fontFamily: 'Avenir'),
            subhead: TextStyle(
                color: AppColors.text, fontFamily: 'Avenir'), // Text color
          ),
        ),
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}
