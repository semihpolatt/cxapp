import 'package:cxapp/models/reservations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class UserAttendanceLineChart extends StatelessWidget {
  final List<Reservation> reservations;

  const UserAttendanceLineChart({Key? key, required this.reservations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<DateTime, Set<String>> userAttendancePerDay = {};

    for (var reservation in reservations) {
      if (reservation.startTm != null && reservation.userName != null) {
        DateTime date = DateTime(
          reservation.startTm!.year,
          reservation.startTm!.month,
          reservation.startTm!.day,
        );
        userAttendancePerDay
            .putIfAbsent(date, () => Set<String>())
            .add(reservation.userName!);
      }
    }

    List<FlSpot> spots = [];
    List<DateTime> sortedDates = userAttendancePerDay.keys.toList()..sort();
    for (var date in sortedDates) {
      final index = sortedDates.indexOf(date).toDouble();
      final userCount = userAttendancePerDay[date]!.length.toDouble();
      spots.add(FlSpot(index, userCount));
    }

    return AspectRatio(
      aspectRatio: 1.8,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                getTitlesWidget: (value, meta) {
                  final date = sortedDates[value.toInt()];
                  if (value.toInt() % 7 == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text('${date.day}/${date.month}/${date.year}',
                          style: TextStyle(fontSize: 10, color: Colors.white)),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
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
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (spots.length - 1).toDouble(),
          maxY: userAttendancePerDay.values
              .fold(0, (prev, set) => set.length > prev ? set.length : prev)
              .toDouble(),
          minY: 0,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.blue,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 165, 227, 237),
                    Color(0xFF2196F3),
                  ].map((color) => color.withOpacity(0.3)).toList(),
                ),
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
