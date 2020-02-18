import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';

class DefaultAppBar extends StatelessWidget with PreferredSizeWidget {
  DefaultAppBar({
    Key key,
    this.title = '',
    this.isbackButton = false,
    this.isSettingsButton = false,
  }) : super(key: key);
  final String title;
  final bool isbackButton;
  final bool isSettingsButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: AppColors.verve,
      elevation: 0.0,
      leading: isbackButton
          ? IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white60),
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: AutoSizeText(
        title,
        style: TextStyle(
          color: AppColors.text60,
          fontSize: 17,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: isSettingsButton
          ? <Widget>[
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white60),
                // TODO Page Notifications
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                tooltip: "Notifications",
              ),
            ]
          : null,
    );
  }

  /// Define sizes of the app bar.
  Size get preferredSize => Size(double.infinity, 55);
}
