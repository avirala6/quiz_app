import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/data_summary.dart';

class ResultsScreen extends StatelessWidget{

  const ResultsScreen(this.chosenAnswers,{super.key,required this.onRestart});

  final List<String> chosenAnswers;

  final void Function(bool isRestart) onRestart;

  List<Map<String,Object>> getSummaryData(){
   final List<Map<String,Object>> dataSummary = []; 

   for(var i=0;i<chosenAnswers.length;i++){
    dataSummary.add({
      'question_index': i,
      'question': questions[i].text,
      'correct_answer': questions[i].answers[0],
      'user_answer': chosenAnswers[i]
    });
   }

   return dataSummary;
  }

  @override
  Widget build(BuildContext context) { 

    var totalNumberOfQuestions = questions.length;
    var dataSummary = getSummaryData();
    var correctNumberOfQuestions = dataSummary.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;


    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $correctNumberOfQuestions out of $totalNumberOfQuestions questions correctly!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 212, 155, 237),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30,),
            DataSummary(dataSummary),
            const SizedBox(height: 30,),
            TextButton.icon(
              onPressed: (){
                onRestart(true);
              }, 
              icon: const Icon(Icons.replay),
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(174, 255, 255, 255),
              ),
              label:  Text(
                "Restart Quiz!",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                ),
              ))
          ],
        ),
      ),
    );
  }
  
}