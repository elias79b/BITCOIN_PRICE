import 'package:flutter/material.dart';
import 'package:fmutter_chart_tut/model/chart.data.dart';
import 'package:fmutter_chart_tut/style/app_style.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<ChartData> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [
      ChartData(17, 26000),
      ChartData(18, 27000),
      ChartData(19, 27000),
      ChartData(20, 25000),
      ChartData(21, 20000),
      ChartData(22, 17500),
      ChartData(23, 17000),
      ChartData(24, 23500),
      ChartData(25, 21354),
      ChartData(26, 22354),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bg_color,
      appBar: AppBar(
        backgroundColor: AppStyle.bg_color,
        elevation: 0.0,
        title: const Text("Bitcoin Price"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "BITCOIN",
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            "img/bitcoin.png",
            height: 100,
            width: 100,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "(BTC)",
            style: TextStyle(color: Colors.white12, fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: SfCartesianChart(
              margin: const EdgeInsets.all(0),
              borderWidth: 0,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                maximum: 26,
                minimum: 17,
                isVisible: false,
                interval: 1,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: NumericAxis(
                maximum: 30000,
                minimum: 15000,
                interval: 1000,
                isVisible: false,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              series: <ChartSeries<ChartData, int>>[
                SplineAreaSeries(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.price,
                  splineType: SplineType.natural,
                  gradient: LinearGradient(
                    colors: [
                      AppStyle.spline_color,
                      AppStyle.bg_color.withAlpha(150)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                SplineSeries(
                    dataSource: data,
                    color: AppStyle.accent_color,
                    width: 4,
                    markerSettings: const MarkerSettings(
                        color: Colors.white,
                        width: 2,
                        borderWidth: 2,
                        shape: DataMarkerType.circle,
                        borderColor: Colors.white,
                        isVisible: true),
                    xValueMapper: (ChartData data, _) => data.day,
                    yValueMapper: (ChartData data, _) => data.price)
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                      side: BorderSide(color: AppStyle.accent_color)),
                  icon: const Icon(
                    Icons.upload,
                    color: Colors.white,
                  ),
                  label: const Text("Sell",style: TextStyle(color: Colors.white,fontSize: 18),)),
              OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.all(16),
                      side: BorderSide(color: AppStyle.accent_color)),
                  icon: const Icon(
                    Icons.download,
                    color: Colors.white,
                  ),
                  label: const Text("Bay",style: TextStyle(color: Colors.white,fontSize: 18),)),
            ],
          )
        ],
      ),
    );
  }
}
