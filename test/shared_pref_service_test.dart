import 'package:flutter_storage/model/my_models.dart';
import 'package:flutter_storage/services/shared_pref_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late var sharedPreferencesServices;
  setUp(() {
    SharedPreferences.setMockInitialValues({});
    sharedPreferencesServices = SharedPreferencesService();
  });

  test(
    'should save and read a UserInformation value',
    () async {
      final UserInformation userInformation = UserInformation(
        "TestİsmiBerkay",
        CINSIYET.ERKEK,
        [RENK.MAVI.name, RENK.SARI.name],
        false,
      );
      await sharedPreferencesServices.verileriKaydet(userInformation);
      var userObject = await sharedPreferencesServices.verileriOku();
      expect(userObject.isim, "TestİsmiBerkay");
      expect(userObject.cinsiyet, CINSIYET.ERKEK);
      expect(userObject.renkler, [RENK.MAVI.name, RENK.SARI.name]);
      expect(userObject.ogrenciMi, false);
    });
}
