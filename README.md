# flutter_storage

A new Flutter project about storing data using Shared Preferences and database.

## Getting Started

This project is a starting point for a Flutter application.

## SharedPreferences

pubspec.yaml

	dependencies:
	  shared_preferences: ^2.5.3

shared_preferences_kullanimi.dart

	void _verileriKaydet() async{
	    final preferences = await SharedPreferences.getInstance();
	    final name = _nameController.text;
	    preferences.setString('isim', name);
	    preferences.setBool('ogrenci', _ogrenciMisin);

	void _verileriOku() async{
	    final preferences = await SharedPreferences.getInstance();
	    _nameController.text = preferences.getString('isim') ?? '';
	    _ogrenciMisin = preferences.getBool('ogrenci') ?? false;
	    _secilenCinsiyet = CINSIYET.values[preferences.getInt('cinsiyet') ?? 0];

## Secure storage

A Flutter plugin that stores data inside the app securely by encrypting it. It uses platform-specific secure storage mechanisms, such as Keystore on Android and Keychain on iOS

pubspec.yaml

	dependencies:
	  flutter_secure_storage: ^9.2.4

secure_storage.dart

	class SecureStorage{
	  late final FlutterSecureStorage secureStorage;
	
	  void verileriKaydet(UserInformation userInformation) async{
	    final name = userInformation.isim;
	    await secureStorage.write(key: 'isim', value: name);
	    await secureStorage.write(key: 'ogrenci', value: userInformation.ogrenciMi.toString());
	
	  Future<UserInformation> verileriOku() async{
	    secureStorage = FlutterSecureStorage();
	    var _isim = await secureStorage.read(key: 'isim') ?? '';
	    var ogrenciMi = await secureStorage.read(key: 'ogrenci') ?? 'false';
	    var _ogrenciMi = ogrenciMi.toLowerCase() == 'true' ? true : false;
	    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenciMi);

## Path Provider

A Flutter plugin for finding file locations in the filesystem, supports creating, reading and writing from files.

pubspec.yaml

	dependencies:
	  path_provider: ^2.1.5

file_storage.dart

	var filePath = await getApplicationDocumentsDirectory();

## Get it

A dependency injection and service locator package for Flutter projects enabling developers to decouple the instantiation of objects from their usage. This separation fosters a more modular and testable codebase, as dependencies can be easily managed and replaced when necessary..

pubspec.yaml

	get_it:
	    dependency: "direct main"
	    description:
	      name: get_it
	      sha256: a4292e7cf67193f8e7c1258203104eb2a51ec8b3a04baa14695f4064c144297b
	      url: "https://pub.dev"
	    source: hosted
	    version: "8.2.0"

	get_it: ^8.2.0

main.dart

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

shared_preferences_kullanimi.dart

	LocalStorageServices _preferencesService = locator<LocalStorageServices>();
