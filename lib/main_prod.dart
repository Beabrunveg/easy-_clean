import 'package:taks_daily_app/flavors.dart';
import 'package:taks_daily_app/main.dart' as runner;

Future<void> main() async {
  F.appFlavor = Flavor.prod;
  await runner.main();
}
