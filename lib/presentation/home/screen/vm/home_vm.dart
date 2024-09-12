import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:taks_daily_app/src/injection.dart';
import 'package:taks_daily_app/src/models/models.dart';
import 'package:taks_daily_app/src/services/services_google/sign_in_with_google.dart';
import 'package:taks_daily_app/src/usecases/get_list_days_past_usecase.dart';
import 'package:taks_daily_app/src/usecases/get_user_by_email_usecase.dart';
import 'package:taks_daily_app/src/usecases/insert_task_day_usecase.dart';
import 'package:taks_daily_app/src/usecases/usecases.dart';

enum StatusHome {
  loading,
  loaded,
  error,
}

class HomeVm extends ChangeNotifier {
  HomeVm(this.email) {
    email = email;
    initState();
  }
  String email;
  Future<void> initState() async {
    status = StatusHome.loading;
    await getUserInformation();
    await onRegisterTaskDay();
    await getTaskDay();
    await onDailyPast();
    status = StatusHome.loaded;
  }

  User? user;
  final nameTask = TextEditingController();
  final descriptionTask = TextEditingController();
  Color _colorSelected = Colors.blue;
  Color get colorSelected => _colorSelected;
  set colorSelected(Color value) {
    _colorSelected = value;
    notifyListeners();
  }

  StatusHome _status = StatusHome.loading;
  set status(StatusHome value) {
    _status = value;
    notifyListeners();
  }

  final authService = AuthService();

  AuthService get getAuthService => authService;

  StatusHome get status => _status;

  List<Daily> _dailyPast = [];
  List<Daily> get dailyPast => _dailyPast;
  set dailyPast(List<Daily> value) {
    _dailyPast = value;
    notifyListeners();
  }

  Future<void> getUserInformation() async {
    final result = await sl<GetUserByEmail>().execute(email);
    result.match(
      (l) {
        user = null;
      },
      (r) {
        user = r;
        log('User: ${user?.name}');
      },
    );
  }

  List<DailyTask> _tasks = [];
  List<DailyTask> get tasks => _tasks;
  set tasks(List<DailyTask> value) {
    _tasks = value;
    notifyListeners();
  }

  Future<void> getTaskDay() async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    final result = await sl<GetTasksForDay>().execute(
      '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
    );
    result.match(
      (l) {
        tasks = [];
      },
      (r) {
        tasks = r;
      },
    );
    notifyListeners();
  }

  double get getPercentage {
    final total = tasks.length;
    final completed = tasks.where((e) => e.isCompleted).length;

    // Maneja el caso en el que total es 0 para evitar división por cero
    if (total == 0) return 0;
    final percentage = (completed / total) * 100;

    return percentage;
  }

  double getPercentageTotal(int total, int completed) {
    // Maneja el caso en el que total es 0 para evitar división por cero
    if (total == 0) return 0;
    final percentage = (completed / total) * 100;

    return percentage;
  }

  Future<void> refresh() async {
    notifyListeners();
  }

  Future<void> onRegisterTask() async {
    final result = await sl<InsertTask>().execute(
      DailyTask(
        taskName: nameTask.text,
        taskDescription: nameTask.text,
        date: '${DateTime.now().day}-${DateTime.now().month}-'
            '${DateTime.now().year}',
        id: 0,
        isCompleted: false,
        color: colorSelected.value.toRadixString(16),
        image: '',
      ),
    );
    await result.match(
      (l) {
        log('Error al registrar la tarea');
      },
      (r) async {
        log('Tarea registrada correctamente');
        nameTask.text = '';
        descriptionTask.text = '';
        await getTaskDay();
      },
    );
  }

  Future<void> onRegisterTaskDay() async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );

    final result = await sl<InsertTaskDay>().execute(
      Daily(
        id: 0,
        day: '${DateTime.now().day}-${DateTime.now().month}-'
            '${DateTime.now().year}',
      ),
    );

    await result.match(
      (l) {
        log('Error al registrar la tarea');
      },
      (r) async {
        log('Dia registrado correctamente');
        await getTaskDay();
      },
    );
  }

  Future<void> onDeleteTask(int idTask) async {
    final result = await sl<DeleteTask>().execute(
      idTask,
    );

    await result.match(
      (l) {
        log('Error al eliminar la tarea');
      },
      (r) async {
        log('Tarea eliminada correctamente');
        await getTaskDay();
      },
    );
  }

  Future<void> onUpdateTask(int idTask, String name) async {
    final taskNew = tasks.firstWhere((e) => e.id == idTask);

    final taskRegister = DailyTask(
      taskName: name,
      taskDescription: taskNew.taskDescription,
      date: taskNew.date,
      id: taskNew.id,
      isCompleted: taskNew.isCompleted,
      color: taskNew.color,
      image: taskNew.image,
    );

    final result = await sl<UpdateTask>().execute(
      taskRegister,
    );

    await result.match(
      (l) {
        log('Error al actualizar la tarea');
      },
      (r) async {
        log('Tarea actualizada correctamente');
        await getTaskDay();
      },
    );
  }

  Future<void> onCompletedTask(
    int idTask,
    bool isCompleted,
    String image,
  ) async {
    final result = await sl<UpdateTaskCompletion>().execute(
      idTask,
      isCompleted,
      image,
    );

    await result.match(
      (l) {
        log('Error al completar la tarea');
      },
      (r) async {
        log('Tarea completada correctamente');
        await getTaskDay();
      },
    );
  }

  Future<void> onDailyPast() async {
    final result = await sl<GetListDaysPast>().execute();
    result.match(
      (l) {
        dailyPast = [];
      },
      (r) {
        log('DailyPast: ${r.length}');
        dailyPast = r;
      },
    );
  }

  Future<void> refreshData() async {
    await onDailyPast();
  }

  Future<void> createMokeData(String day, bool isCompleted) async {
    log('${DateTime.now().day}-${DateTime.now().month}-'
        '${DateTime.now().year}');
    log(day);
    await sl<InsertTaskDay>().execute(
      Daily(
        id: 0,
        day: day,
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 1',
        taskDescription: 'Descripcion 1',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        color: Colors.blue.value.toRadixString(16),
        image: '',
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 2',
        taskDescription: 'Descripcion 2',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        color: Colors.blue.value.toRadixString(16),
        image: '',
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 3',
        taskDescription: 'Descripcion 3',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        color: Colors.blue.value.toRadixString(16),
        image: '',
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 4',
        taskDescription: 'Descripcion 4',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        color: Colors.blue.value.toRadixString(16),
        image: '',
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 5',
        taskDescription: 'Descripcion 5',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        color: Colors.blue.value.toRadixString(16),
        image: '',
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 6',
        taskDescription: 'Descripcion 6',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        color: Colors.blue.value.toRadixString(16),
        image: '',
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 7',
        taskDescription: 'Descripcion 7',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        image: '',
        color: Colors.blue.value.toRadixString(16),
      ),
    );
    await sl<InsertTask>().execute(
      DailyTask(
        taskName: 'Tarea 8',
        taskDescription: 'Descripcion 8',
        date: day,
        id: 0,
        isCompleted: isCompleted,
        color: Colors.blue.value.toRadixString(16),
        image: '',
      ),
    );
  }
}
