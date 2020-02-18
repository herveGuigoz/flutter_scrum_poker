import 'package:flutter/material.dart';
import 'package:scrum_poker/ui/common/animations/Rotation3d.dart';

class FlippableBox extends StatelessWidget {
  final Widget front;
  final Widget back;
  final bool isFlipped;

  const FlippableBox({Key key, this.isFlipped = false, this.front, this.back})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 700),
      curve: Curves.easeOut,
      tween: Tween(begin: 0.0, end: isFlipped ? 180.0 : 0.0),
      builder: (context, value, child) {
        var content = value >= 90 ? back : front;
        return Rotation3d(
          rotationY: value,
          child: Rotation3d(
            rotationY: value >= 90 ? 180 : 0,
            child: content,
          ),
        );
      },
    );
  }
}
