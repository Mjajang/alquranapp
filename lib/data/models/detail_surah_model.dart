import 'dart:convert';

class DetailSurahResponseModel {
  final int? code;
  final String? message;
  final DetailSurahModel? data;

  DetailSurahResponseModel({
    this.code,
    this.message,
    this.data,
  });

  factory DetailSurahResponseModel.fromJson(String str) =>
      DetailSurahResponseModel.fromMap(json.decode(str));

  factory DetailSurahResponseModel.fromMap(Map<String, dynamic> json) =>
      DetailSurahResponseModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : DetailSurahModel.fromMap(json["data"]),
      );
}

class DetailSurahModel {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final String? deskripsi;
  final Map<String, String>? audioFull;
  final List<Ayat>? ayat;
  final SuratSelanjutnya? suratSelanjutnya;
  final bool? suratSebelumnya;

  DetailSurahModel({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
    this.suratSelanjutnya,
    this.suratSebelumnya,
  });

  factory DetailSurahModel.fromJson(String str) =>
      DetailSurahModel.fromMap(json.decode(str));

  factory DetailSurahModel.fromMap(Map<String, dynamic> json) =>
      DetailSurahModel(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        ayat: json["ayat"] == null
            ? []
            : List<Ayat>.from(json["ayat"]!.map((x) => Ayat.fromMap(x))),
        suratSelanjutnya: json["suratSelanjutnya"] == null
            ? null
            : SuratSelanjutnya.fromMap(json["suratSelanjutnya"]),
        suratSebelumnya: json["suratSebelumnya"],
      );
}

class Ayat {
  final int? nomorAyat;
  final String? teksArab;
  final String? teksLatin;
  final String? teksIndonesia;
  final Map<String, String>? audio;

  Ayat({
    this.nomorAyat,
    this.teksArab,
    this.teksLatin,
    this.teksIndonesia,
    this.audio,
  });

  factory Ayat.fromJson(String str) => Ayat.fromMap(json.decode(str));

  factory Ayat.fromMap(Map<String, dynamic> json) => Ayat(
        nomorAyat: json["nomorAyat"],
        teksArab: json["teksArab"],
        teksLatin: json["teksLatin"],
        teksIndonesia: json["teksIndonesia"],
        audio: Map.from(json["audio"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
      );
}

class SuratSelanjutnya {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;

  SuratSelanjutnya({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
  });

  factory SuratSelanjutnya.fromJson(String str) =>
      SuratSelanjutnya.fromMap(json.decode(str));

  factory SuratSelanjutnya.fromMap(Map<String, dynamic> json) =>
      SuratSelanjutnya(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
      );
}
