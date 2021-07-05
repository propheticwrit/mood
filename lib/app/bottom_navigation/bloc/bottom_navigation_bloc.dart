import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mood_app/app/survey/repo/repository.dart';
import 'package:mood_app/app/trends/repo/repository.dart';

import 'bottom_navigation_state.dart';
import 'bottom_navigation_event.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc({required this.surveyRepository, required this.trendsRepository})
      : assert(surveyRepository != null),
        assert(trendsRepository != null),
        super(PageLoading());

  final SurveyRepository surveyRepository;
  final TrendsRepository trendsRepository;
  int currentIndex = 0;

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      this.add(PageTapped(index: this.currentIndex));
    }
    if (event is PageTapped) {
      this.currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
      yield PageLoading();

      if (this.currentIndex == 0) {
        String data = await _getSurveyData();
        yield FirstPageLoaded(text: data);
      }
      if (this.currentIndex == 1) {
        String data = await _getTrendsData();
        yield SecondPageLoaded(text: data);
      }
    }
  }

  Future<String> _getSurveyData() async {
    String data = surveyRepository.data;
    if (data.isEmpty) {
      await surveyRepository.fetchData();
      data = surveyRepository.data;
    }
    return data;
  }

  Future<String> _getTrendsData() async {
    String data = trendsRepository.data;
    if (data.isEmpty) {
      await trendsRepository.fetchData();
      data = trendsRepository.data;
    }
    return data;
  }
}
