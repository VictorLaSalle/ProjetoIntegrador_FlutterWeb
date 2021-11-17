import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatelessWidget {
  const Charts(List<SheetsData> chartData, String title)
      : this._chartData = chartData,
        this._title = title;

  final List<SheetsData> _chartData;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      title: ChartTitle(text: this._title),
      legend: Legend(isVisible: true),
      series: <CircularSeries>[
        DoughnutSeries<SheetsData, String>(
            dataSource: _chartData,
            xValueMapper: (SheetsData data, _) => data.answer,
            yValueMapper: (SheetsData data, _) => data.amount,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
            ))
      ],
    );
  }
}

class SheetsData {
  SheetsData(this.answer, this.amount);
  final String answer;
  final double amount;
}
