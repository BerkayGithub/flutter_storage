enum CINSIYET { KADIN, ERKEK }
enum RENK { SARI, KIRMIZI, MAVI, YESIL }

class UserInformation {
  final String isim;
  final CINSIYET cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);

}