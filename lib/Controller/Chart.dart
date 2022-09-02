import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'BankData.dart';
import 'package:flutter_charts/flutter_charts.dart';

class Chart extends StatefulWidget {
  @override
  _cMyHomePageState createState() => _cMyHomePageState();
}
class _cMyHomePageState extends State<Chart> {
  bool expanded = false;
  LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  late ChartData chartData;
  ChartOptions chartOptions = const ChartOptions();
  late var verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy);
  void initState() {
    chartData = ChartData(
      // dataRows:  [
      //   debitGraphdata,
      //   creditGraphdata,
      // ],
      // xUserLabels: graphbankname,
      dataRows: const [
        [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
        [0, -1580, -1194, 0, 0, -1800.0],
      ],
      xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
      dataRowsLegends: const ['Values', 'Values 2'],
      dataRowsColors: const [
        Colors.green,
        Colors.red,
      ],
      chartOptions: chartOptions,
    );
    verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    // var verticalBarChart = VerticalBarChart(
    //   painter: VerticalBarChartPainter(
    //     verticalBarChartContainer: verticalBarChartContainer,
    //   ),
    // );
  }
  @override
    Widget build(BuildContext context) {
      return
      Container(
       // color: Colors.yellow,
        child:  VerticalBarChart(
          painter: VerticalBarChartPainter(
            verticalBarChartContainer: verticalBarChartContainer,
          ),
        ),

      );

      chartToRun();
        Scaffold(
        appBar: AppBar(title: Text('Example')),
        body: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: expanded ? 120 : 0,
              child:
              Container(height: 120, color: Colors.yellow,)
                  //child:
                // chartToRun()



            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  child:
                  Icon(expanded ? Icons.arrow_upward : Icons.arrow_downward),
                  onPressed: () => setState(() {
                    expanded = !expanded;
                  }),
                ),
              ],
            ),
          ],
        ),
      );
    }
  Widget chartToRun() {
    LabelLayoutStrategy? xContainerLabelLayoutStrategy;
    ChartData chartData;
    ChartOptions chartOptions = const ChartOptions();
    // Example shows a mix of positive and negative data values.
    chartData = ChartData(
      dataRows: const [
        [2000.0, 1800.0, 2200.0, 2300.0, 1700.0, 0],
        [0,0,0,0,0, -1800.0],
      ],
      xUserLabels: const ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
      dataRowsLegends: const [
        'Values',
        'Values 2'
      ],
      dataRowsColors: const [
        Colors.green,
        Colors.red,
      ],
      chartOptions: chartOptions,
    );
    var verticalBarChartContainer = VerticalBarChartTopContainer(
      chartData: chartData,
      xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
    );

    var verticalBarChart = VerticalBarChart(
      painter: VerticalBarChartPainter(
        verticalBarChartContainer: verticalBarChartContainer,
      ),
    );
    return verticalBarChart;
  }
}