import 'package:flutter/material.dart';

class QuestionIdentifier extends StatelessWidget{

  const QuestionIdentifier(this.index,this.isCorrectAnswer,{super.key});

  final String index;
  final bool isCorrectAnswer;

  @override
  Widget build(BuildContext context) {
    return Container(  
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAnswer? const Color.fromARGB(255, 149, 180, 150) : const Color.fromARGB(255, 186, 131, 149) ,
        borderRadius: BorderRadius.circular(100)
      ),
      child: Text(
        index,
        style: const TextStyle(
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

}