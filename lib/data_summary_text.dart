import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataSummaryText extends StatelessWidget {
  const DataSummaryText(this.data, {super.key});

  final String data;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.lato(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
