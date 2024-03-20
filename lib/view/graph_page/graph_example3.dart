import 'package:cxapp/controllers/data_controller.dart';
import 'package:cxapp/models/reservations.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

class LineChartPage extends StatefulWidget {
  final List<Reservation> reservations;

  const LineChartPage({Key? key, required this.reservations}) : super(key: key);

  @override
  _LineChartPageState createState() => _LineChartPageState();
}

class _LineChartPageState extends State<LineChartPage> {
  late List<FlSpot> deskSpots;
  late List<FlSpot> roomSpots;
  late List<FlSpot> officeSpots;
  late List<FlSpot> allTypeAttendance;
  //List<DateTime> sortedDates = [];

  @override
  void initState() {
    super.initState();
    final Map<DateTime, int> deskCounts = {};
    final Map<DateTime, int> roomCounts = {};
    final Map<DateTime, int> officeCounts = {};

    for (var reservation in widget.reservations) {
      if (reservation.spaceType == 'desk' ||
          reservation.spaceType == 'Room' ||
          reservation.spaceType == 'office') {
        DateTime date = DateTime(reservation.startTm!.year,
            reservation.startTm!.month, reservation.startTm!.day);

        if (reservation.spaceType == 'desk') {
          Get.find<DataController>().officeCount.value =
              Get.find<DataController>().officeCount.value + 1;
          deskCounts[date] = (deskCounts[date] ?? 0) + 1;
        } else if (reservation.spaceType == 'Room') {
          Get.find<DataController>().roomCount.value =
              Get.find<DataController>().roomCount.value + 1;
          roomCounts[date] = (roomCounts[date] ?? 0) + 1;
        } else if (reservation.spaceType == 'office') {
          Get.find<DataController>().deskCount.value =
              Get.find<DataController>().deskCount.value + 1;
          officeCounts[date] = (officeCounts[date] ?? 0) + 1;
        }
      }
    }

    /*  Get.find<DataController>().officeCount.value = officeCounts.length;
    Get.find<DataController>().roomCount.value = roomCounts.length;
    Get.find<DataController>().deskCount.value = deskCounts.length; */

    print('officeCounts : ' +
        Get.find<DataController>().officeCount.value.toString());

    deskSpots = deskCounts.entries
        .map((e) =>
            FlSpot(e.key.millisecondsSinceEpoch.toDouble(), e.value.toDouble()))
        .toList();
    roomSpots = roomCounts.entries
        .map((e) =>
            FlSpot(e.key.millisecondsSinceEpoch.toDouble(), e.value.toDouble()))
        .toList();

    officeSpots = officeCounts.entries
        .map((e) =>
            FlSpot(e.key.millisecondsSinceEpoch.toDouble(), e.value.toDouble()))
        .toList();

    // Sırala tarih sırasına göre
    deskSpots.sort((a, b) => a.x.compareTo(b.x));
    roomSpots.sort((a, b) => a.x.compareTo(b.x));
    officeSpots.sort((a, b) => a.x.compareTo(b.x));
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
              rightTitles:
                  AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  getTitlesWidget: (value, meta) {
                    print(DateTime.fromMillisecondsSinceEpoch(value.toInt())
                        .toString());
                    DateTime date =
                        DateTime.fromMillisecondsSinceEpoch(value.toInt());

                    if (value.toInt() % 7 == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text('${date.day}/${date.month}/${date.year}',
                            style:
                                TextStyle(fontSize: 10, color: Colors.white)),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    return Text(
                      value == value.toInt().toDouble()
                          ? value.toInt().toString()
                          : '',
                      style: TextStyle(color: Colors.white),
                    );
                  },
                  interval: 1,
                  reservedSize: 40,
                ),
              ),
              show: true),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: deskSpots,
              isCurved: true,
              color: Colors.blueAccent,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.pink,
                  ].map((color) => color.withOpacity(0.3)).toList(),
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Colors.pink,
                ],
              ),
            ),
            LineChartBarData(
              spots: roomSpots,
              isCurved: true,
              //color: Colors.greenAccent,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF50E4FF),
                    Color(0xFF2196F3),
                  ].map((color) => color.withOpacity(0.3)).toList(),
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF50E4FF),
                  Color(0xFF2196F3),
                ],
              ),
            ),
            LineChartBarData(
              spots: officeSpots,
              isCurved: true,
              //color: Colors.greenAccent,
              barWidth: 2,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.yellow,
                    Colors.orange,
                  ].map((color) => color.withOpacity(0.3)).toList(),
                ),
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.yellow,
                  Colors.orange,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
