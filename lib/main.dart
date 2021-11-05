import 'package:flutter/material.dart';

import 'models.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  List<Question> questions = sample_data;
  int Task = 1;
  int counter = 0;
  
  bool TestStatus = false;
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    Widget _Text(String worde) {
      return Padding(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: Text(
          worde,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        ),
      );
    }

    Widget _button(int number) {
      String title = questions[Task-1].options![number];
      int state = questions[Task-1].answer![number];
      Color changedColor;
      if (state == 1)
        {
          changedColor = Colors.green;
        }
        else
        {
          changedColor = Colors.red;
        }
      

      return ElevatedButton(
        onPressed: () {
          return setState(() {
            if (!TestStatus)
            {
              questions[Task-1].selected = number;
            }
            
          });
        },
        child: Text( (questions[Task-1].selected != number) ? title : title+" +",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(TestStatus ? changedColor : color),
            ),
      );
    }

   

    
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Тест'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _Text(questions[Task-1].question!),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 170, 0, 0), child: _button(0)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(1)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(2)),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0), child: _button(3)),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          return setState(() {
                            if (Task > 1)
                              Task--;
                          });
                        },
                        child: Text('Назад',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),

                      Text(
                        'Вопрос №$Task',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          return setState(() {
                            if (Task+1 <= questions.length)
                              Task++;
                            
                          });
                        },
                        child: Text('Вперёд',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),

                      
                    ],
                  ),),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                        onPressed: () {
                          return setState(() {
                              TestStatus = true;
                              for (int i = 0; i < questions.length; i++)
                                if(questions[i].selected != -1)
                                  counter += questions[i].answer![questions[i].selected];
                          });
                        },
                        child: Text('Закончить тест',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
            ),
            if (TestStatus)
                        Padding( padding : EdgeInsets.fromLTRB(0, 30, 0, 0), child : ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResultScreen(counter : "$counter")));
                          },
                          child: Text('Окно результатов',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)),
                        ),),
          ],
        ),
        
      ),
      
      
    );
  }
}

class ResultScreen extends StatelessWidget {

  String counter;
  ResultScreen({this.counter=''});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("Ваш результат: "+ counter)
      ),
    );
  }
}