import 'package:cxapp/controllers/data_controller.dart';
import 'package:cxapp/view/graph_page/graph_example3.dart';
import 'package:cxapp/view/graph_page/user_graph.dart';
import 'package:cxapp/view/home_page/widgets/card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DataController());
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff120E22),
              // Color.fromARGB(255, 80, 98, 214),
              Color(0xff2D28B0),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'CXAI Analytics',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.find<DataController>().getMonthData();
                    },
                    child: const Text(
                      'Month Data',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      //shape: BorderRadius.circular(20),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blueAccent.withOpacity(0.8)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.find<DataController>().getQuarterData();
                    },
                    child: const Text(
                      'Quarter Data',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      //shape: BorderRadius.circular(20),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blueAccent.withOpacity(0.8)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.find<DataController>().getyearData();
                    },
                    child: const Text(
                      'Year Data',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ButtonStyle(
                      //shape: BorderRadius.circular(20),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blueAccent.withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff111333),
                          Color(0xff111333),
                        ],
                      ),
                    ),
                    width: 700,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  'Office Type Graph',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Office',
                                      style: TextStyle(
                                          color: Colors.yellow,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Desk',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      color: Colors.red,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    const Text(
                                      'Room',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          if (Get.find<DataController>().isLoading.value ==
                              false) {
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff111333),
                          Color(0xff111333),
                        ],
                      ),
                    ),
                    width: 700,
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'User By Day Graph',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(() {
                          if (Get.find<DataController>().isLoading.value ==
                              false) {
                            return UserAttendanceLineChart(
                              reservations: Get.find<DataController>().xModel,
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  /* GetBuilder<DataController>(
                          builder: (controller) {
                            if (controller.isLoading.value == false) {
                              return GraphExample3(
                                reservations: controller.xModel,
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ) */

                  CardWidget(
                    title: 'Office Count',
                    count:
                        Get.find<DataController>().officeCount.value.toString(),
                    icon: Icons.person,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CardWidget(
                    title: 'Desk Count',
                    count:
                        Get.find<DataController>().deskCount.value.toString(),
                    icon: Icons.person,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CardWidget(
                    title: 'Room Count',
                    count:
                        Get.find<DataController>().roomCount.value.toString(),
                    icon: Icons.person,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CardWidget(
                    title: 'Users Count',
                    count: '24',
                    icon: Icons.person,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
