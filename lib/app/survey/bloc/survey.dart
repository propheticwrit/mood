import 'package:mood_app/app/survey/repo/repository.dart';
import 'package:mood_app/models/category.dart';
import 'package:mood_app/models/survey.dart';
import 'package:rxdart/rxdart.dart';

class SurveysBloc {
  final _repository = SurveyRepository();

  final _categoriesFetcher = PublishSubject<Categories>();
  final _surveyFetcher = PublishSubject<Survey>();

  Stream<Categories> get allCategories => _categoriesFetcher.stream;
  Stream<Survey> get survey => _surveyFetcher.stream;

  fetchAllCategories() async {
    try {
      Categories categories = await _repository.fetchCategories();
      _categoriesFetcher.sink.add(categories);
    } on Exception {
      print('Could not fetch categories');
    }
  }

  fetchSurvey(int surveyId) async {
    try {
      Survey survey = await _repository.fetchSurvey(surveyId);
      _surveyFetcher.sink.add(survey);
    } on Exception {
      print('Could not fetch survey with id ${surveyId}');
    }
  }

  dispose() {
    _categoriesFetcher.close();
    _surveyFetcher.close();
  }
}

final bloc = SurveysBloc();