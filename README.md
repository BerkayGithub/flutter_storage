# flutter_storage

A new Flutter project about storing data using Shared Preferences and database.

## Getting Started

This project is a starting point for a Flutter application.

## SharedPreferences

dependencies:
  shared_preferences: ^2.5.3

## Secure storage

A Flutter plugin that stores data inside the app securely by encrypting it. It uses platform-specific secure storage mechanisms, such as Keystore on Android and Keychain on iOS

dependencies:
  flutter_secure_storage: ^9.2.4

## Path Provider

A Flutter plugin for finding file locations in the filesystem, supports creating, reading and writing from files.

dependencies:
  path_provider: ^2.1.5

var filePath = await getApplicationDocumentsDirectory();

## Get it

A dependency injection and service locator package for Flutter projects enabling developers to decouple the instantiation of objects from their usage. This separation fosters a more modular and testable codebase, as dependencies can be easily managed and replaced when necessary..

get_it:
    dependency: "direct main"
    description:
      name: get_it
      sha256: a4292e7cf67193f8e7c1258203104eb2a51ec8b3a04baa14695f4064c144297b
      url: "https://pub.dev"
    source: hosted
    version: "8.2.0"

get_it: ^8.2.0

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<LocalStorageServices>(SharedPreferencesService());
  //locator.registerLazySingleton<LocalStorageServices>(() => SharedPreferencesService());  this one creates the instance when it is needed and not immediately
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

//In UI class
LocalStorageServices _preferencesService = locator<LocalStorageServices>();

