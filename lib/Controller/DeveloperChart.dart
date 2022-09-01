// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'BankData.dart';
//
// class DeveloperChart extends StatelessWidget {
//   final List<BankData> data;
//
//   DeveloperChart({required this.data});
//   @override
//   Widget build(BuildContext context) {
//     List<charts.Series<BankData, String>> series = [
//       charts.Series(
//           id: "developers",
//           data: data,
//           domainFn: (BankData series, _) => series.accountname.toString(),
//           measureFn: (BankData series, _) => series.mask.toString(),
//           colorFn: (BankData series, _) => series.accountname.toString()
//       )
//     ];
//
//     return Container(
//       height: 300,
//       padding: EdgeInsets.all(25),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(9.0),
//           child: Column(
//             children: <Widget>[
//               Text(
//                 "Yearly Growth in the Flutter Community",
//                 style: Theme.of(context).textTheme.body2,
//               ),
//               Expanded(
//                 child: charts.BarChart(series, animate: true),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }