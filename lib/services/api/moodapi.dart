import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mood_app/models/category.dart';
import 'package:mood_app/models/survey.dart';

class MoodProvider {
  var client = http.Client();
  final _token = '8295b02e6a94e6a2df5ff45cd3d3977bd20d73b1';
  final String _url = 'api.clueo.net';

  Future<Categories> fetchCategories() async {
    var uri = Uri.http(_url, '/api/category');
    final response = await http.get(uri, headers: {'Authorization': 'Token ${_token}'});

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Categories.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load categories');
    }
  }

  Future<Survey> fetchSurvey(int surveyId) async {
    var uri = Uri.http(_url, '/api/survey/${surveyId}');
    final response = await http.get(uri, headers: {'Authorization': 'Token ${_token}'});

    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return Survey.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load survey');
    }
  }
}