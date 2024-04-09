import 'package:flutter/material.dart';
import 'package:quiz_app/summary_item.dart';

class DataSummary extends StatelessWidget {
  const DataSummary(this.dataSummary, {super.key});

  final List<Map<String, Object>> dataSummary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...dataSummary.map((data) {
              return SummaryItem(data);
            }),
          ],
        ),
      ),
    );
  }
}
