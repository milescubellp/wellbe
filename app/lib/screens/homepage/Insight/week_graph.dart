import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wellbe/models/CustomModels/chart_model.dart';
import 'package:wellbe/provider/MoodProvider/mood_provider.dart';
import 'package:wellbe/provider/insight_provider.dart';
import 'package:wellbe/utilites/colors.dart';

class WeekGraph extends StatelessWidget {
  WeekGraph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Color> color = <Color>[];
    color.add(Colors.blue[50]!);
    color.add(Colors.blue[100]!);
    color.add(Colors.blue);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors = LinearGradient(
        colors: color, begin: Alignment.topCenter, end: Alignment.bottomCenter);
    // final List<Color> colors = [
    //   Colors.red,
    //   Colors.blue,
    //   Colors.green,
    //   Colors.yellow,
    //   Colors.purple
    // ];
    // final List<Gradient> gradients =
    // colors.map((color) => LinearGradient(colors: [color, Colors.white])).toList();

    return Consumer2<InsightProvider, MoodProvider>(
        builder: (context, insightProvider, moodProvider, child) {
      final yPostion = moodProvider.yPositions;

      return Scaffold(
          body: Center(
              child: Container(
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
                        rangePadding: ChartRangePadding.auto,
                        majorGridLines: MajorGridLines(
                          width: 0,
                          color: kPrimaryColor,
                        ),

                        //Hide the axis line of x-axis
                        axisLine: AxisLine(width: 0),
                        //   isVisible: false
                      ),
                      primaryYAxis: NumericAxis(
                          //Hide the gridlines of y-axis
                          maximumLabelWidth: 5,
                          //    maximum: 35,
                          rangePadding: ChartRangePadding.round,
                          // maximum: 30,
                          majorGridLines: MajorGridLines(width: 0),
                          //Hide the axis line of y-axis
                          axisLine: AxisLine(width: 0),
                          borderWidth: 0,
                          borderColor: Colors.transparent,
                          isVisible: false),
                      series: <ChartSeries>[
            ColumnSeries<ChartData, String>(
                //  trackPadding: ,
                width: 0.3,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFe2f2ff),
                    Color(0xFFfae1d2),
                    Color(0xFFe2f2ff),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(22),
                    topRight: Radius.circular(22)),
                dataSource: [
                  ChartData(xValue: "Sun", yValue: yPostion[0]),
                  ChartData(xValue: "Mon", yValue: yPostion[1]),
                  ChartData(xValue: "Tue", yValue: yPostion[2]),
                  ChartData(xValue: "Wed", yValue: yPostion[3]),
                  ChartData(xValue: "Thu", yValue: yPostion[4]),
                  ChartData(xValue: "Fri", yValue: yPostion[5]),
                  ChartData(xValue: "Sat", yValue: yPostion[6])
                ],
                xValueMapper: (ChartData data, _) => data.xValue.toString(),
                yValueMapper: (ChartData data, _) => data.yValue)
          ]))));
    });
  }
}
