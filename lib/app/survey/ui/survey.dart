import 'package:flutter/material.dart';
import 'package:mood_app/app/survey/bloc/survey.dart';
import 'package:mood_app/models/category.dart';

class Survey extends StatelessWidget {
  final String text;

  Survey({required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllCategories();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Survey'),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: StreamBuilder(
        stream: bloc.allCategories,
        builder: (context, AsyncSnapshot<Categories> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<Categories> snapshot) {
    return new Column(
      children: <Widget>[
        for ( var category in snapshot.data!.categories ) ListTile(
          leading: const Icon(Icons.person),
          title: new TextField(
            decoration: new InputDecoration(
              hintText: category.name,
            ),
          ),
        ),
      ]
    );
  }
}
