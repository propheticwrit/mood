import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_app/app/survey/ui/survey.dart';
import 'package:mood_app/app/trends/ui/trends.dart';
import 'package:mood_app/common/alert_dialog.dart';
import 'package:mood_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'bottom_navigation/bloc/bottom_navigation_bloc.dart';
import 'bottom_navigation/bloc/bottom_navigation_event.dart';
import 'bottom_navigation/bloc/bottom_navigation_state.dart';

class HomePage extends StatelessWidget {

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialog(
      context,
      title: 'Logout',
      content: 'Are you sure that you want to logout?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if (didRequestSignOut == true) {
      _signOut(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
            onPressed: () => _confirmSignOut(context),
          ),
        ],
      ),
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is SurveyLoaded) {
            return Survey(text: state.text);
          }
          if (state is TrendsLoaded) {
            return Trends(text: state.text);
          }
          return Container();
        },
      ),
      bottomNavigationBar:
        BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (BuildContext context, BottomNavigationState state) {
        return BottomNavigationBar(
          currentIndex:
          context.select((BottomNavigationBloc bloc) => bloc.currentIndex),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.storage_rounded),
              label: 'Survey',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              label: 'Trends',
            ),
          ],
          onTap: (index) => context
              .read<BottomNavigationBloc>()
              .add(PageTapped(index: index)),
        );
      }),
    );
  }
}
