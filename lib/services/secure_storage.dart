import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_storage/services/local_storage.dart';
import '../model/my_models.dart';

class SecureStorage implements LocalStorageServices{
  late final FlutterSecureStorage secureStorage;

  Future<void> verileriKaydet(UserInformation userInformation) async{
    final name = userInformation.isim;
    await secureStorage.write(key: 'isim', value: name);
    await secureStorage.write(key: 'ogrenci', value: userInformation.ogrenciMi.toString());
    await secureStorage.write(key: 'cinsiyet', value: userInformation.cinsiyet.index.toString());
    await secureStorage.write(key: 'renkler', value: jsonEncode(userInformation.renkler));
  }

  Future<UserInformation> verileriOku() async{
    secureStorage = FlutterSecureStorage();
    var _isim = await secureStorage.read(key: 'isim') ?? '';
    var ogrenciMi = await secureStorage.read(key: 'ogrenci') ?? 'false';
    var _ogrenciMi = ogrenciMi.toLowerCase() == 'true' ? true : false;
    var cinsiyet = await secureStorage.read(key: 'cinsiyet') ?? '0';
    var _cinsiyet = CINSIYET.values[int.parse(cinsiyet)];
    var renkler = await secureStorage.read(key: 'renkler');
    var _renkler = renkler == null ? <String>[] : List<String>.from(jsonDecode(renkler));
    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenciMi);
  }
}