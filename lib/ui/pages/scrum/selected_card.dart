import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scrum_poker/data/icons.dart';
import 'package:scrum_poker/ui/common/app_colors.dart';
import 'package:scrum_poker/ui/widget/app_bar.dart';
import 'package:scrum_poker/ui/widget/flippable_box.dart';

class SelectedCard extends StatefulWidget {
  final int _selectedNumber;
  SelectedCard({number}) : this._selectedNumber = number;
  @override
  _SelectedCardState createState() => _SelectedCardState();
}

class _SelectedCardState extends State<SelectedCard> {
  final _randomNumber = Random().nextInt(kIcons.length - 1);

  bool isFlipped = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _height = size.height * 0.65;
    final _width = size.width * 0.75;
    final double _paddingTop = AppBar().preferredSize.height;
    return Scaffold(
      appBar: DefaultAppBar(
        isbackButton: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(bottom: _paddingTop),
        child: Container(
          child: GestureDetector(
            onTap: () => setState(() {
              if (!isFlipped)
                isFlipped = !isFlipped;
              else
                Navigator.pop(context);
            }),
            child: Center(
              child: TweenAnimationBuilder(
                duration: Duration(milliseconds: 700),
                curve: Curves.easeOut,
                tween: Tween<double>(begin: 0, end: isFlipped ? 180 : 0),
                builder: (context, value, child) {
                  return FlippableBox(
                    front: Container(
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColors.gray,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          kIcons[_randomNumber],
                          semanticsLabel: 'Icon',
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    back: Container(
                      height: _height,
                      width: _width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        color: AppColors.gray,
                      ),
                      child: Center(
                          child: Text(
                        '${widget._selectedNumber}',
                        style: TextStyle(
                            fontSize: 200.0,
                            color: AppColors.coral,
                            fontWeight: FontWeight.w900),
                      )),
                    ),
                    isFlipped: isFlipped,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
