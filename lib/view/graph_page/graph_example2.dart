import 'package:cxapp/models/reservations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ReservationLineChart extends StatelessWidget {
  final List<Reservation> reservations;

  const ReservationLineChart({Key? key, required this.reservations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Tarih ve o tarihte yapılan rezervasyon sayısını eşleştiren Map
    Map<DateTime, int> reservationCountPerDay = {};

    for (var reservation in reservations) {
      if (reservation.startTm != null) {
        // Saat, dakika, saniye bilgisini atarak sadece tarih bilgisini al
        DateTime date = DateTime(
          reservation.startTm!.year,
          reservation.startTm!.month,
          reservation.startTm!.day,
        );
        reservationCountPerDay.update(date, (value) => ++value,
            ifAbsent: () => 1);
      }
    }

    List<FlSpot> spots = [];
    List<DateTime> sortedDates = reservationCountPerDay.keys.toList()..sort();
    for (var date in sortedDates) {
      final index = sortedDates.indexOf(date).toDouble();
      final count = reservationCountPerDay[date]!.toDouble();
      spots.add(FlSpot(index, count));
    }

    return AspectRatio(
      aspectRatio: 4,
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
                  return Text('${date.day}/${date.month}/${date.year}',
                      style: TextStyle(fontSize: 6, color: Colors.white));
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
                interval: 1, // Bu değeri ihtiyacınıza göre ayarlayın
                reservedSize: 40,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (spots.length - 1).toDouble(),
          maxY: reservationCountPerDay.values
              .fold(0, (prev, count) => count > prev ? count : prev)
              .toDouble(),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
