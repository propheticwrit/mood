class Survey {
  String _name = '';
  DateTime _created = new DateTime.now();
  DateTime _modified = new DateTime.now();
  int _category = 0;
  List<_Question> _questions = [];


  Survey.fromJson(Map<String, dynamic> parsedJson) {
    _name = parsedJson['name'];
    _created = DateTime.parse(parsedJson['created']);
    _modified = DateTime.parse(parsedJson['modified']);
    _category = int.parse(parsedJson['category']);

    List<_Question> temp = [];
    for (int i = 0; i < parsedJson['questions'].length; i++) {
      _Question question = _Question(parsedJson['questions'][i]);
      temp.add(question);
    }
    _questions = temp;
  }

  String get name => _name;
  DateTime get created => _created;
  DateTime get modified => _modified;
  int get category => _category;
  List<_Question> get questions => _questions;
}

class _Question {

  String _name = '';
  String _text = '';
  DateTime _created = new DateTime.now();
  DateTime _modified = new DateTime.now();
  int _survey = 0;
  List<_Answer> _answers = [];

  _Question(question) {
    _name = question['name'];
    _text = question['text'];
    _created = DateTime.parse(question['created']);
    _modified = DateTime.parse(question['modified']);
    _survey = int.parse(question['survey']);

    List<_Answer> temp = [];
    for (int i = 0; i < question['answers'].length; i++) {
      _Answer answer = _Answer(question['answers'][i]);
      temp.add(answer);
    }
    _answers = temp;
  }

  String get name => _name;
  String get text => _text;
  DateTime get created => _created;
  DateTime get modified => _modified;
  int get survey => _survey;
  List<_Answer> get answers => _answers;
}

class _Answer {

  String? _label;
  String? _text;
  int _sequence = 0;
  String _style = '';
  int _question = 0;

  _Answer(answer) {
    if (answer['label'] != null)
      _label = answer['label'];
    if (answer['text'] != null)
      _text = answer['text'];
    _sequence = int.parse(answer['sequence']);
    _style = answer['style'];
    _question = int.parse(answer['question']);
  }

  String? get label => _label;
  String? get text => _text;
  int get sequence => _sequence;
  String get style => _style;
  int get question => _question;
}