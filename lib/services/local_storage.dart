import '../model/my_models.dart';

abstract class LocalStorageServices{
  Future<void> verileriKaydet(UserInformation userInformation);
  Future<UserInformation> verileriOku();
}