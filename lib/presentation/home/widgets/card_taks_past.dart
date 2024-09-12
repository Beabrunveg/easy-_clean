import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:taks_daily_app/core/configs/configs.dart';

class CardTaksPast extends StatelessWidget {
  const CardTaksPast({
    required this.progress,
    required this.taks,
    required this.date,
    super.key,
  });
  final double progress;
  final List<String> taks;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padSy16,
      margin: padSy16.copyWith(
        top: 0,
        bottom: 8,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: ExpansionWidget(
        titleBuilder: (
          double animationValue,
          _,
          bool isExpaned,
          toogleFunction,
        ) {
          return InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => toogleFunction(animated: true),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        date,
                        style: TextStyleApp.h2.gray,
                      ),
                    ),
                    Icon(
                      animationValue == 1
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 24,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap16,
            ListView.builder(
              itemCount: taks.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: padSy16.copyWith(
                    left: 0,
                    top: 0,
                    bottom: 8,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_box_outline_blank_rounded,
                        color: AppColors.gray,
                        size: 24,
                      ),
                      space8,
                      Text(
                        taks[index],
                        style: TextStyleApp.body,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
