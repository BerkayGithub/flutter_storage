import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_storage/model/my_models.dart';
import 'package:flutter_storage/services/local_storage.dart';
import 'package:path_provider/path_provider.dart';

class FileStorageService implements LocalStorageServices{

  FileStorageService(){
    _createFile();
  }

  Future<String> _getFilePath() async {
    var filePath = await getApplicationDocumentsDirectory();
    debugPrint(filePath.path);
    return filePath.path;
  }

  Future<File> _createFile() async {
    var file = File('${await _getFilePath()}/info.json');
    return file;
  }

  Future<void> verileriKaydet(UserInformation userInformation) async{
    var file = await _createFile();
    await file.writeAsString(jsonEncode(userInformation));
  }

  Future<UserInformation> verileriOku() async{
    try{
      var file = await _createFile();
      var dosyaStringIcerik = await file.readAsString();
      var userJson = jsonDecode(dosyaStringIcerik);
      final user = UserInformation.fromJson(userJson);
      return user;
    }catch(e){
      print(e);
    };
    return UserInformation('', CINSIYET.KADIN, [], false);
  }
}