import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:taks_daily_app/src/injection.config.dart';

GetIt sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  sl.init();
}
