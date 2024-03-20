import 'package:cxapp/controllers/data_controller.dart';
import 'package:cxapp/models/reservations.dart';
import 'package:cxapp/services/data_services.dart';
import 'package:cxapp/view/graph_page/graph_example.dart';
import 'package:cxapp/view/graph_page/graph_example2.dart';
import 'package:cxapp/view/graph_page/graph_example3.dart';
import 'package:cxapp/view/graph_page/user_graph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({super.key});

  @override
  Widget build(BuildContext context) {
    //ReservationService().fetchReservations()
    Get.put(DataController());
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Obx(() {
            if (Get.find<DataController>().isLoading.value == false) {
              return LineChartPage(
                reservations: Get.find<DataController>().xModel,
              );

              /*   return UserAttendanceLineChart(
                reservations: Get.find<DataController>().xModel,
              ); */
            } else {
              return const CircularProgressIndicator();
            }
          }),
          SizedBox(
            height: 100,
          ),
          Obx(() {
            if (Get.find<DataController>().isLoading.value == false) {
              return UserAttendanceLineChart(
                reservations: Get.find<DataController>().xModel,
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ],
      ),
    );
  }
}
