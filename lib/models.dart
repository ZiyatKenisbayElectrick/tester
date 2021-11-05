import 'main.dart';

class Question{
  final int? id;
  final List<int>? answer;
  final String? question;
  final List<String>? options;
  final bool taskState = false;
  int selected = -1;

  Question({this.id, this.question, this.answer, this.options});
}

List<Question> sample_data = [  
  Question(
    answer: [0,0,1,0], 
    id: 1, 
    question: 'Сколько будет 2 + 2?', 
    options: ['2', '1', '4', '5'],
  ),
  Question(
    answer: [0,0,0,1], 
    id: 2, 
    question: 'В какой аудитории самые мощные компы?', 
    options: ['241', '243', '239', '226'],
  ),
  Question(
    answer: [0,0,1,0], 
    id: 3, 
    question: 'Сколько длиться перемена между занятиями?', 
    options: ['15', '5', '10', '20'],
  ),
  Question(
    answer: [1,0,0,0], 
    id: 4, 
    question: 'Сколько человек в группе 19-311-13?', 
    options: ['27', '23', '30', '18'],
  ),
];

