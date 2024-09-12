// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'repositories/database_repository.dart' as _i764;
import 'services/database_service.dart' as _i273;
import 'usecases/delete_inventory_usecase.dart' as _i839;
import 'usecases/delete_task_usecase.dart' as _i619;
import 'usecases/get_inventory_usecase.dart' as _i120;
import 'usecases/get_list_days_past_usecase.dart' as _i722;
import 'usecases/get_task_for_day_usecase.dart' as _i665;
import 'usecases/get_user_by_email_usecase.dart' as _i334;
import 'usecases/get_weekly_task_count_usecase.dart' as _i536;
import 'usecases/insert_inventory_usecase.dart' as _i363;
import 'usecases/insert_task_day_usecase.dart' as _i639;
import 'usecases/insert_task_usecase.dart' as _i558;
import 'usecases/insert_user_usecase.dart' as _i957;
import 'usecases/login_user_usecase.dart' as _i337;
import 'usecases/update_task_completion_usecase.dart' as _i945;
import 'usecases/update_task_usecase.dart' as _i319;
import 'usecases/update_user_usecase.dart' as _i505;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i273.DatabaseService>(() => _i273.DatabaseServiceImpl());
    gh.lazySingleton<_i764.DatabaseRepository>(
        () => _i764.DatabaseRepositoryImpl(gh<_i273.DatabaseService>()));
    gh.lazySingleton<_i665.GetTasksForDay>(
        () => _i665.GetTasksForDay(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i363.InsertInventory>(
        () => _i363.InsertInventory(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i558.InsertTask>(
        () => _i558.InsertTask(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i319.UpdateTask>(
        () => _i319.UpdateTask(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i722.GetListDaysPast>(
        () => _i722.GetListDaysPast(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i334.GetUserByEmail>(
        () => _i334.GetUserByEmail(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i839.DeleteInventory>(
        () => _i839.DeleteInventory(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i619.DeleteTask>(
        () => _i619.DeleteTask(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i337.LoginUser>(
        () => _i337.LoginUser(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i639.InsertTaskDay>(
        () => _i639.InsertTaskDay(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i120.GetInventory>(
        () => _i120.GetInventory(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i957.InsertUser>(
        () => _i957.InsertUser(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i505.UpdateUser>(
        () => _i505.UpdateUser(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i536.GetWeeklyTaskCount>(
        () => _i536.GetWeeklyTaskCount(gh<_i764.DatabaseRepository>()));
    gh.lazySingleton<_i945.UpdateTaskCompletion>(
        () => _i945.UpdateTaskCompletion(gh<_i764.DatabaseRepository>()));
    return this;
  }
}
