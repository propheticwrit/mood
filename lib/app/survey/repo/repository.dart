import 'package:mood_app/models/survey.dart';
import 'package:mood_app/models/category.dart';
import 'package:mood_app/services/api/moodapi.dart';

class SurveyRepository {

  final moodProvider = MoodProvider();

  String _data = '';

  Future<Categories> fetchCategories() => moodProvider.fetchCategories();
  Future<Survey> fetchSurvey(int surveyId) => moodProvider.fetchSurvey(surveyId);

  Future<void> fetchData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // store dummy data
    _data = 'Survey Page';
  }

  String get data => _data;
}
