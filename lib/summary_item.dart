import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.data, {super.key});

  final Map<String,Object> data;

  bool isCorrectAnswer(){
    return data['user_answer'] == data['correct_answer'];
  }

  @override
  Widget build(BuildContext context) {

    bool isCorrect = isCorrectAnswer();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          ((data['question_index'] as int) + 1).toString(),
          isCorrect,
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data['question'] as String,
                style: GoogleFonts.lato(color: Colors.white, fontSize: 16),
              ),
              Text(
                data['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 70, 126, 175),
                ),),
              Text(
                data['correct_answer'] as String,
                style: const TextStyle(
                  color:  Color.fromARGB(255, 118, 181, 120),
                ),
                ),
            ],
          ),
        )
      ],
    );
  }
}
