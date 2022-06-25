import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modal/umkm.dart';

class FetchUmkmList {
  static Future<List<Umkm>> getUmkms(String query) async {
    final url = Uri.parse('https://gisntbmall.000webhostapp.com/api/umkm');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List umkms = json.decode(response.body)['data'];

      return umkms.map((json) => Umkm.fromJson(json)).where((umkm) {
        // final titleLower = umkm.name.toLowerCase();
        final authorLower = umkm.districts.toLowerCase();
        final searchLower = query.toLowerCase();

        return authorLower.contains(searchLower);
        // ||
        //     authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
