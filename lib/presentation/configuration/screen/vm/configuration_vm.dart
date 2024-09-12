import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taks_daily_app/components/button_coupon.dart';
import 'package:taks_daily_app/presentation/configuration/widgets/card_taks_completed.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/usecases/usecases.dart';

class ConfigurationVm extends ChangeNotifier {
  ConfigurationVm() {
    onDailyPast();
  }

  List<WeeklySummary> _weeklySummary = [];
  List<WeeklySummary> get weeklySummary => _weeklySummary;
  set weeklySummary(List<WeeklySummary> value) {
    _weeklySummary = value;
    notifyListeners();
  }

  List<Widget> data = [
    CardTaksCompleted(
      statusReedem: StatusReedem.notAvailable,
      progress: 0.3,
      message: 'Vale de 20% de dscto en KFC',
      onRedeemCoupon: () {},
      taks: [
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
      ],
      date: 'Lun.12 Ago - Dom. 18 de Ago del 2024',
    ),
    CardTaksCompleted(
      statusReedem: StatusReedem.available,
      progress: 0.8,
      message: 'Combo personal en KFC',
      onRedeemCoupon: () {},
      taks: [
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
      ],
      date: 'Lun.19 Ago - Dom. 25 de Ago del 2024',
    ),
    CardTaksCompleted(
      statusReedem: StatusReedem.redeemed,
      progress: 0.4,
      message: 'Combo personal en Bembos',
      onRedeemCoupon: () {},
      taks: [
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: true,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
        DailyTask(
          id: 0,
          taskName: 'Desayunar',
          taskDescription: 'Desayunar',
          date: '2024-08-12',
          isCompleted: false,
          color: Colors.blue.value.toRadixString(16),
          image: '',
        ),
      ],
      date: 'Lun.05 Ago - Dom. 11 de Ago del 2024',
    ),
  ];

  Future<void> onDailyPast() async {
    final result = await sl<GetWeeklyTaskCount>().execute();
    result.match(
      (l) {
        weeklySummary = [];
      },
      (r) {
        weeklySummary = r;
        log('WeeklySummary: ${weeklySummary.length}');
        log('WeeklySummary: ${weeklySummary[0].tasks}');
      },
    );
  }
}
