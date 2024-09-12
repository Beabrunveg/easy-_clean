ipa:
	flutter build ipa -t lib/main_dev.dart  --flavor dev --dart-define=devTools=false

ipa_dev:
	flutter build ipa -t lib/main_prod.dart  --flavor prod --dart-define=devTools=false

aab:
	flutter build appbundle -t lib/main_prod.dart  --flavor dev --dart-define=devTools=false

aab_dev:
	flutter build appbundle  -t lib/main_dev.dart  --flavor prod -dart-define=devTools=false

apk_dev:
	flutter build apk -t lib/main_dev.dart --flavor dev --dart-define=devTools=false

apk_prod:
	flutter build apk -t lib/main_prod.dart --flavor prod --dart-define=devTools=false

apk_release_dev:
	flutter build apk --release -t lib/main_dev.dart  --flavor dev --dart-define=devTools=false
	
apk_release_prod:
	flutter build apk --release -t lib/main_prod.dart  --flavor prod --dart-define=devTools=false

open_apk:
	open build/app/outputs/flutter-apk/

analyze:
	flutter analyze

iconApp:
	flutter pub run flutter_launcher_icons

b:
	dart run build_runner build --delete-conflicting-outputs

flavor:
	dart run flutter_flavorizr

clear:
	dart run build_runner clean

init:
	flutter clean && fvm flutter pub get packages && fvm flutter pub upgrade && fvm flutter pub run build_runner build --delete-conflicting-outputs
