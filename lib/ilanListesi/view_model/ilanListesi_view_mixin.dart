import 'package:flutter/material.dart';

mixin IlanListesiViewMixin {
  /// Örnek veri: Oda tipi
  String get roomType => "Mini";

  /// Örnek veri: Fiyat bilgisi
  String get price => "3430₽";

  /// Örnek veri: Oda büyüklüğü (m²)
  double get roomSize => 2.2;

  /// Örnek veri: Özellikler listesi (ikon + metin)
  List<Map<String, dynamic>> get features => [
    {'icon': Icons.pets, 'label': 'Cat sitter'},
    {'icon': Icons.fastfood, 'label': 'Feeding'},
    {'icon': Icons.photo_camera, 'label': 'Photo report'},
    {'icon': Icons.games, 'label': 'Games'},
  ];
}
