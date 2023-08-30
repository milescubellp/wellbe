import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wellbe/models/CustomModels/chart_model.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/insight_provider.dart';
import 'package:wellbe/widgets/custom_text.dart';

class MonthChart extends StatefulWidget {
  int? total;
  MonthChart({Key? key, this.total}) : super(key: key);

  @override
  State<MonthChart> createState() => _MonthChartState();
}

class _MonthChartState extends State<MonthChart> {
  late TooltipBehavior _tooltipBehavior;
  late SelectionBehavior _selectionBehavior;
  // List<ChartData> chartData=[];

  var dailyEngineHours = ["Sun", "Mon", "Tue", "Wed", "Thu"];
  @override
  void initState() {
    _tooltipBehavior =
        TooltipBehavior(enable: true, header: '', canShowMarker: true);
    super.initState();
    _selectionBehavior = SelectionBehavior(
        // Enables the selection
        enable: true);
    //dailyEngineHours = widget.data["dailyEngineHours"];
    for (int i = 0; i < dailyEngineHours.length; i++) {
      //  chartData.add(ChartData(xValue: dailyEngineHours[i],yValue:i+1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<InsightProvider, MoodProvider>(
        builder: (context, insightProvider, moodProvider, child) {
      final yPostion = moodProvider.yPositions;

      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Container(
                  child: SfCircularChart(
                      margin: EdgeInsets.zero,
                      annotations: <CircularChartAnnotation>[
                CircularChartAnnotation(),
              ],
                      series: <CircularSeries>[
                PieSeries<ChartData, String>(
                    dataSource: [
                      ChartData(
                          xValue: "Sun", yValue: yPostion[0], size: "101"),
                      ChartData(xValue: "Mon", yValue: yPostion[1], size: "90"),
                      ChartData(xValue: "Tue", yValue: yPostion[2], size: "90"),
                      ChartData(xValue: "Wed", yValue: yPostion[3], size: "90"),
                      ChartData(xValue: "Thu", yValue: yPostion[4], size: "90"),
                      ChartData(xValue: "Fri", yValue: yPostion[5], size: "90"),
                      ChartData(xValue: "Sat", yValue: yPostion[6], size: "90"),
                    ],
                    xValueMapper: (ChartData data, _) => data.xValue,
                    yValueMapper: (ChartData data, _) => data.yValue,
                    pointRadiusMapper: (ChartData data, _) => data.size,

                    // pointColorMapper: (ChartSampleData data, _) => data.pointColor,
                    // Radius of doughnut
                    radius: '90%',
                    dataLabelSettings: DataLabelSettings(isVisible: true))
              ]))));
    });
  }
}
