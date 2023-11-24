import 'dart:convert';

class ListSurahModelResponse {
  final int? code;
  final String? message;
  final List<ListSurahModel>? data;

  ListSurahModelResponse({
    this.code,
    this.message,
    this.data,
  });

  factory ListSurahModelResponse.fromJson(String str) =>
      ListSurahModelResponse.fromMap(json.decode(str));

  factory ListSurahModelResponse.fromMap(Map<String, dynamic> json) =>
      ListSurahModelResponse(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ListSurahModel>.from(
                json["data"]!.map((x) => ListSurahModel.fromMap(x))),
      );
}

class ListSurahModel {
  final int? nomor;
  final String? nama;
  final String? namaLatin;
  final int? jumlahAyat;
  final String? tempatTurun;
  final String? arti;
  final String? deskripsi;
  final Map<String, String>? audioFull;

  ListSurahModel({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
  });

  factory ListSurahModel.fromJson(String str) =>
      ListSurahModel.fromMap(json.decode(str));

  factory ListSurahModel.fromMap(Map<String, dynamic> json) => ListSurahModel(
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["namaLatin"],
        jumlahAyat: json["jumlahAyat"],
        tempatTurun: json["tempatTurun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audioFull: Map.from(json["audioFull"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
      );
}
