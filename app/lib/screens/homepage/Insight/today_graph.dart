import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wellbe/models/CustomModels/chart_model.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/insight_provider.dart';
import 'package:wellbe/utilites/colors.dart';

class TodayGraph extends StatelessWidget {
  TodayGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Color(0xFFe2f2ff));
    color.add(Color(0xFFe2f2ff).withOpacity(0.5));
    color.add(Color(0xFFffffd8).withOpacity(0.5));
    color.add(Color(0xFFffffd8));
    // color.add(Color);
    //color.add(Colors.blue);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        colors: color, begin: Alignment.topCenter, end: Alignment.bottomCenter);
    return Consumer2<InsightProvider, MoodProvider>(
        builder: (context, insightProvider, moodProvider, child) {
      final yPostion = moodProvider.yPositions;
      debugPrint('value:${yPostion[4]}');
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Container(
            width: double.infinity,
            height: 250,
            child: SfCartesianChart(
              backgroundColor: Colors.transparent,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              plotAreaBorderColor: Colors.transparent,
              plotAreaBackgroundColor: Colors.transparent,
              enableSideBySideSeriesPlacement: false,
              borderWidth: 0,
              margin: EdgeInsets.zero,
              primaryXAxis: CategoryAxis(
                borderColor: Colors.transparent,
                borderWidth: 0,
                majorGridLines: MajorGridLines(width: 1, color: kPrimaryColor),
                //Hide the axis line of x-axis
                axisLine: AxisLine(width: 0),
                //   isVisible: false
              ),
              primaryYAxis: NumericAxis(
                  //Hide the gridlines of y-axis
                  majorGridLines: MajorGridLines(width: 0),
                  //Hide the axis line of y-axis
                  axisLine: AxisLine(width: 0),
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                  isVisible: false),
              series: <AreaSeries<ChartData, String>>[
                AreaSeries<ChartData, String>(
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                  dataSource: <ChartData>[
                    // ...List.generate(moodProvider.getMoodsTodayModels.length,
                    //     (index) {
                    //   final getToday = moodProvider.getMoodsTodayModels[index];
                    //
                    //   DateTime dateTime =
                    //       DateTime.parse(getToday.updatedAt.toString());
                    //   String formattedXValue =
                    //       DateFormat('h a').format(dateTime);
                    //   debugPrint(
                    //       '<<<<<<<<<<formatted value ${formattedXValue}>>>>>>>>>');
                    //   return ChartData(
                    //     xValue: '${formattedXValue}',
                    //     yValue: getToday.moodCount,
                    //   );
                    // })
                    ChartData(xValue: '2 am', yValue: yPostion[0]),

                    ChartData(xValue: '4 am', yValue: yPostion[1]),
                    ChartData(xValue: '8 am', yValue: yPostion[2]),
                    ChartData(xValue: '12 am', yValue: yPostion[3]),
                    ChartData(xValue: '16 am', yValue: yPostion[4]),
                    ChartData(xValue: '20 am', yValue: yPostion[5]),
                    ChartData(xValue: '24 am', yValue: yPostion[6]),
                  ],
                  xValueMapper: (ChartData sales, _) => sales.xValue,
                  yValueMapper: (ChartData sales, _) => sales.yValue,
                  gradient: gradientColors,
                ),
              ],
            ),
          )));
    });
  }
}
