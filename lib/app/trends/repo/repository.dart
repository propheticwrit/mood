class TrendsRepository {
  String _data = '';

  Future<void> fetchData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // store dummy data
    _data = 'Trends Page';
  }

  String get data => _data;
}
