import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKepper = [];

//  List<String> question = [
//    ,
//    'Approximately one quarter of human bones are in the feet.',
//    'A slug\'s blood is green.'
//  ];
//
//  List<bool> answer = [false, true, true];
//
//  Question q1 = Question(q:'You can lead a cow down stairs but not up stairs.',a:false);

  QuizBrain quizBrain = QuizBrain();

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.questionBank[questionNumber].question,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                setState(() {
                  if(questionNumber == quizBrain.questionBank.length - 1){
                    Alert(
                      context: context,
                      type: AlertType.info,
                      title: "FINISHED",
                      desc: "You have reached the end of the quiz!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OKAY",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              scoreKepper.clear();
                              questionNumber=0;
                              Navigator.pop(context);
                            });
                           },
                          width: 120,
                        )
                      ],
                    ).show();
                  }else {
                    bool correctAnswer = quizBrain.questionBank[questionNumber].answer;
                    if (correctAnswer == true) {
                      scoreKepper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    }else{
                      scoreKepper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                    questionNumber = questionNumber + 1;
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  if(questionNumber == quizBrain.questionBank.length - 1){
                    Alert(
                      context: context,
                      type: AlertType.info,
                      title: "FINISHED",
                      desc: "You have reached the end of the quiz!",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OKAY",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              scoreKepper.clear();
                              questionNumber=0;
                              Navigator.pop(context);
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }else {
                    bool correctAnswer = quizBrain.questionBank[questionNumber].answer;
                    if (correctAnswer == false) {
                      scoreKepper.add(
                        Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      );
                    }else{
                      scoreKepper.add(
                        Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                      );
                    }
                    questionNumber = questionNumber + 1;
                  }
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(
          children: scoreKepper,
        )
      ],
    );
  }
}

onAlertButtonPressed(context) {

}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
