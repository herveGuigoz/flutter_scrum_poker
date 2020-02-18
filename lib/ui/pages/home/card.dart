import 'package:flutter/material.dart';
import 'package:scrum_poker/ui/common/app_colors.dart';

class HomeCard extends StatelessWidget {
  final int number;
  HomeCard({this.number});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/selected', arguments: number),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.gray,
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
              color: AppColors.brown,
              fontSize: 80.0,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
