import 'package:flutter/material.dart';
import 'package:flutter_storage/model/my_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesKullanimi extends StatefulWidget {
  const SharedPreferencesKullanimi({super.key});

  @override
  State<SharedPreferencesKullanimi> createState() =>
      _SharedPreferencesKullanimiState();
}

class _SharedPreferencesKullanimiState
    extends State<SharedPreferencesKullanimi> {
  var _secilenCinsiyet = CINSIYET.KADIN;
  var _secilenRenkler = <String>[];
  var _ogrenciMisin = false;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _verileriOku();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SharedPreferences Kullanımı")),
      body: ListView(
        children: [
          ListTile(
            title: TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Adınızı Giriniz"),
            ),
          ),
          buildRadioListTile("Kadın", CINSIYET.KADIN),
          buildRadioListTile("Erkek", CINSIYET.ERKEK),
          buildCheckboxListTile(RENK.KIRMIZI, Colors.red),
          buildCheckboxListTile(RENK.MAVI, Colors.blue),
          buildCheckboxListTile(RENK.SARI, Colors.yellow),
          buildCheckboxListTile(RENK.YESIL, Colors.green),
          SwitchListTile(
            value: _ogrenciMisin,
            onChanged: (deger) {
              setState(() {
                _ogrenciMisin = deger;
              });
            },
            title: Text("Öğrenci misin ?"),
          ),
          TextButton(onPressed: _verileriKaydet, child: Text("Kaydet")),
        ],
      ),
    );
  }

  void _verileriKaydet() async{
    final preferences = await SharedPreferences.getInstance();
    final name = _nameController.text;

    preferences.setString('isim', name);
    preferences.setBool('ogrenci', _ogrenciMisin);
    preferences.setInt('cinsiyet', _secilenCinsiyet.index);
    preferences.setStringList('renkler', _secilenRenkler);
    debugPrint(_secilenCinsiyet.index.toString());
  }

  void _verileriOku() async{
    final preferences = await SharedPreferences.getInstance();
    _nameController.text = preferences.getString('isim') ?? '';
    _ogrenciMisin = preferences.getBool('ogrenci') ?? false;
    _secilenCinsiyet = CINSIYET.values[preferences.getInt('cinsiyet') ?? 0];
    _secilenRenkler = preferences.getStringList('renkler') ?? <String>[];
    setState(() {});
  }

  CheckboxListTile buildCheckboxListTile(RENK renk, Color color) {
    return CheckboxListTile(
      value: _secilenRenkler.contains(renk.name),
      onChanged: (secildi) {
        setState(() {
          if (secildi!) {
            _secilenRenkler.add(renk.name);
          } else {
            _secilenRenkler.remove(renk.name);
          }
          debugPrint(_secilenRenkler.toString());
        });
      },
      activeColor: color,
      title: Text(renk.name),
    );
  }

  RadioListTile<CINSIYET> buildRadioListTile(String title, CINSIYET cinsiyet) {
    return RadioListTile(
      title: Text(title),
      value: cinsiyet,
      groupValue: _secilenCinsiyet,
      onChanged: (CINSIYET? secilmisCinsiyet) {
        setState(() {
          _secilenCinsiyet = secilmisCinsiyet!;
        });
      },
    );
  }
}
