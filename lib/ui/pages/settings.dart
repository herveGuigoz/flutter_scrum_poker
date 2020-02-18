import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scrum_poker/Bloc/app_bloc.dart';
import 'package:scrum_poker/Bloc/provider.dart';
import 'package:scrum_poker/ui/common/app_colors.dart';

/// To allow pop back action,
/// one option must be selected.
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AppBloc _bloc;
  List<int> _options;
  @override
  void initState() {
    _bloc = BlocProvider.of<AppBloc>(context);
    _options = AppBloc.defaultNumbers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
        stream: _bloc.numbersList,
        initialData: _bloc.initialNumbers,
        builder: (context, snapshot) {
          return WillPopScope(
            onWillPop: () async => snapshot.data.isNotEmpty,
            child: Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                backgroundColor: AppColors.beige,
                elevation: 0,
                brightness: Brightness.dark,
                title: Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      color: AppColors.brown,
                      fontSize: 16.0,
                      fontFamily: 'avenir',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.brown,
                  ),
                  onPressed: () => _sendSelectedOption(snapshot.data),
                ),
              ),
              backgroundColor: AppColors.verve,
              body: Container(
                decoration: BoxDecoration(
                  color: AppColors.beige,
                  border: Border(
                    top: BorderSide(
                      color: AppColors.brown,
                    ),
                  ),
                ),
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      child: ListView(
                        children: <Widget>[
                          for (int option in _options)
                            _buildOption(option, snapshot.data)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  // Build LisView in DropdownOption page
  Widget _buildOption(int option, List<int> selectedOption) {
    return GestureDetector(
      onTap: () => _selectOption(option),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.beige,
          border: Border(
            bottom: BorderSide(
              color: AppColors.brown,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AutoSizeText(
              '$option',
              style: TextStyle(
                fontFamily: 'avenir',
                fontSize: 30,
                color: AppColors.brown,
                fontWeight: FontWeight.w500,
              ),
            ),
            Icon(Icons.check,
                color: selectedOption.contains(option)
                    ? AppColors.verve
                    : Colors.transparent,
                size: 40)
          ],
        ),
      ),
    );
  }

  // Validate and return to DropdownMenu page
  void _sendSelectedOption(List<int> selectedOption) {
    if (selectedOption.isNotEmpty) {
      Navigator.pop(context);
    } else {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Select one of the options')));
    }
  }

  // Update bloc's numbers list
  void _selectOption(int option) {
    _bloc.numbers.add(option);
  }
}
