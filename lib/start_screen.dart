import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {

  const StartScreen(this.startQuiz,{super.key});

  final void Function(bool isRestart) startQuiz;

  @override
  Widget build(Object context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 350,
              color: const Color.fromARGB(150, 255, 255, 255),
            ),
            const SizedBox(
              height: 55,
            ),
            Text(
              "Learn Flutter The Fun way!",
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 202, 122, 222),
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: const BeveledRectangleBorder()
                ),
                onPressed: (){
                  startQuiz(false);
                },
                icon: const Icon(Icons.arrow_right_alt_outlined),
                label: const Text(
                  "Take a Quiz"
                )),
          ],
        ),
      );
  }
}
