import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app/app/survey/repo/repository.dart';
import 'package:mood_app/app/trends/repo/repository.dart';

import 'bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'bottom_navigation/bloc/bottom_navigation_event.dart';
import 'bottom_navigation/bloc/bottom_navigation_state.dart';
import 'home.dart';

class BasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<BottomNavigationBloc>(
        create: (context) => BottomNavigationBloc(
          surveyRepository: SurveyRepository(),
          trendsRepository: TrendsRepository(),
        )..add(AppStarted()),
        child: HomePage(),
      ),
    );
  }
}
