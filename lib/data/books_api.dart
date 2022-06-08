import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:task_bilclick/constants/constans.dart';

import 'package:task_bilclick/model/books_model.dart';
import 'package:task_bilclick/service/local_storage.dart';

LocalStorage _localStorage = LocalStorage();

class BooksApi {
  static final _api = BooksApi._();

  factory BooksApi() {
    return _api;
  }

  BooksApi._();

  Future<List<BooksModel>> getAllBooks() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      _localStorage.openBox(parsed);

      final result =
          parsed.map<BooksModel>((json) => BooksModel.fromJson(json)).toList();

      return result;
    } else {
      throw Exception('Failed to load post');
    }
  }
}
