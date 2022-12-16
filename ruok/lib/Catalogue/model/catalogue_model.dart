import 'dart:convert';

CatalogueModel catalogueModelFromJson(String str) =>
    CatalogueModel.fromJson(json.decode(str));

String catalogueModelToJson(CatalogueModel data) =>
    json.encode(data.toJson());

class CatalogueModel {
  CatalogueModel({
    required this.namaItem,
    required this.metodePembayaran,
    required this.metodePengiriman,
  });

  String namaItem;
  String metodePembayaran;
  String metodePengiriman;

  factory CatalogueModel.fromJson(Map<String, dynamic> json) =>
      CatalogueModel(
        namaItem: json["nama_item"],
        metodePembayaran: json["metode_pembayaran"],
        metodePengiriman: json["metode_pengiriman"],
      );

  Map<String, dynamic> toJson() => {
        "nama_item": namaItem,
        "metode_pembayaran": metodePembayaran,
        "metode_pengiriman": metodePengiriman,
      };
}