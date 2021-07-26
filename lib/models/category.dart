class Category {
  String _name = '';
  DateTime _created = new DateTime.now();
  DateTime _modified = new DateTime.now();
  int? _parent;

  Category(category) {
    _created = DateTime.parse(category['created']);
    _name = category['name'];
    _modified = DateTime.parse(category['modified']);
    if (category['parent'] != null) {
      _parent = int.parse(category['parent']);
    } else {
      _parent = null;
    }
  }

  String get name => _name;
  DateTime get created => _created;
  DateTime get modified => _modified;
  int? get parent => _parent;
}

class Categories {

  List<Category> _categories = [];

  Categories.fromJson(List<dynamic> parsedJson) {
    print(parsedJson.toString());

    List<Category> temp = [];
    for (int i = 0; i < parsedJson.length; i++) {
      Category category = Category(parsedJson[i]);
      temp.add(category);
    }
    _categories = temp;
  }

  List<Category> get categories => _categories;
}