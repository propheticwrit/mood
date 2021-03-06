import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable {
  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class CurrentIndexChanged extends BottomNavigationState {
  final int currentIndex;

  CurrentIndexChanged({required this.currentIndex});

  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';
}

class PageLoading extends BottomNavigationState {
  @override
  String toString() => 'PageLoading';
}

class SurveyLoaded extends BottomNavigationState {
  final String text;

  SurveyLoaded({required this.text});

  @override
  String toString() => 'SurveyPage Loaded with text: $text';
}

class TrendsLoaded extends BottomNavigationState {
  final String text;

  TrendsLoaded({required this.text});

  @override
  String toString() => 'TrendsPage Loaded with text: $text';
}
