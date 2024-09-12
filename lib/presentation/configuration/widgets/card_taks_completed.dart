import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:taks_daily_app/components/components.dart';
import 'package:taks_daily_app/core/configs/configs.dart';
import 'package:taks_daily_app/src/models/daily_task.dart';

class CardTaksCompleted extends StatelessWidget {
  const CardTaksCompleted({
    required this.progress,
    required this.onRedeemCoupon,
    required this.taks,
    required this.message,
    required this.statusReedem,
    required this.date,
    super.key,
  });
  final double progress;
  final VoidCallback onRedeemCoupon;
  final List<DailyTask> taks;
  final StatusReedem statusReedem;
  final String message;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padSy16.copyWith(
        left: 0,
        right: 0,
        top: 0,
        bottom: 8,
      ),
      child: Container(
        padding: padSy16,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.blue50,
          ),
        ),
        child: Column(
          children: [
            ExpansionWidget(
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
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                date,
                                style: TextStyleApp.body.black,
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
                  ),
                );
              },
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.builder(
                    itemCount: taks.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: padSy16.copyWith(
                          left: 0,
                          top: 0,
                          bottom: 8,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              taks[index].isCompleted
                                  ? Icons.check_box_rounded
                                  : Icons.check_box_outline_blank_rounded,
                              color: taks[index].isCompleted
                                  ? AppColors.green
                                  : AppColors.gray,
                              size: 24,
                            ),
                            space8,
                            Text(
                              taks[index].taskName,
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
            gap16,
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.gray,
                ),
              ),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 6,
                color: AppColors.black,
                borderRadius: BorderRadius.circular(8),
                backgroundColor: AppColors.white,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.green,
                ),
              ),
            ),
            gap4,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${(progress * 100).round()}% completado',
                style: TextStyleApp.caption,
              ),
            ),
            gap16,
            SizedBox(
              width: double.infinity,
              child: ButtonCoupon(
                statusReedem: statusReedem,
                message: message,
                label: 'Canjear cupón',
                onPressed: onRedeemCoupon,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
