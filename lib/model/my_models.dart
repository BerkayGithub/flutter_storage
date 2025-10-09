enum CINSIYET { KADIN, ERKEK }
enum RENK { SARI, KIRMIZI, MAVI, YESIL }

class UserInformation {
  final String isim;
  final CINSIYET cinsiyet;
  final List<String> renkler;
  final bool ogrenciMi;

  UserInformation(this.isim, this.cinsiyet, this.renkler, this.ogrenciMi);

  Map<String, dynamic> toJson() {
    return {
      'isim': isim,
      'cinsiyet': cinsiyet.name,
      'renkler': renkler,
      'ogrenci': ogrenciMi,
    };
  }

  UserInformation.fromJson(Map<String, dynamic> userMap)
      : isim = userMap['isim'],
      cinsiyet = CINSIYET.values.firstWhere((e) => e.name == userMap['cinsiyet']),
      renkler = List<String>.from(userMap['renkler']),
      ogrenciMi = userMap['ogrenci']
    ;

}
