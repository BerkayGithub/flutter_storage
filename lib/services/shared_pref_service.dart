import 'package:flutter_storage/model/my_models.dart';
import 'package:flutter_storage/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService implements LocalStorageServices{
  @override
  Future<void> verileriKaydet(UserInformation userInformation) async{
    final preferences = await SharedPreferences.getInstance();
    final name = userInformation.isim;
    preferences.setString('isim', name);
    preferences.setBool('ogrenci', userInformation.ogrenciMi);
    preferences.setInt('cinsiyet', userInformation.cinsiyet.index);
    preferences.setStringList('renkler', userInformation.renkler);
  }

  @override
  Future<UserInformation> verileriOku() async{
    final preferences = await SharedPreferences.getInstance();
    var _isim = preferences.getString('isim') ?? '';
    var _ogrenciMi = preferences.getBool('ogrenci') ?? false;
    var _cinsiyet = CINSIYET.values[preferences.getInt('cinsiyet') ?? 0];
    var _renkler = preferences.getStringList('renkler') ?? <String>[];
    return UserInformation(_isim, _cinsiyet, _renkler, _ogrenciMi);
  }
}