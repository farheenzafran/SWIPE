// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'BarChartModel.dart';
//
// class BarChartGraph extends StatefulWidget {
//   final List<BarChartModel>? data;
//
//   const BarChartGraph({Key? key, this.data}) : super(key: key);
//
//   @override
//   _BarChartGraphState createState() => _BarChartGraphState();
// }
//
// class _BarChartGraphState extends State<BarChartGraph> {
//   late List<BarChartModel> _barChartList;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _barChartList = [
//       BarChartModel(month: "Nov"),
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BarChartModel, String>> series = [
//       charts.Series(
//           id: "Financial",
//           data: widget.data!,
//           domainFn: (BarChartModel series, _) => series.year!,
//           measureFn: (BarChartModel series, _) => series.financial,
//           colorFn: (BarChartModel series, _) => series.color!),
//
//     ];
//
//     return _buildFinancialList(series);
//
//   }
//
//   Widget _buildFinancialList(series) {
//     return _barChartList != null ?
//     Container(
//         height: MediaQuery.of(context).size.height/2.3,
//         padding: EdgeInsets.all(10),
//         child: charts.BarChart(series, animate: true))
//         : SizedBox();
//   }
// }