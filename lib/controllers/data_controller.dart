import 'dart:html';

import 'package:cxapp/models/reservations.dart';
import 'package:cxapp/services/data_services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class DataController extends GetxController {
  RxBool isLoading = true.obs;

  RxList<Reservation> xModel = RxList<Reservation>();

  RxInt userCount = 0.obs;
  RxInt officeCount = 0.obs;
  RxInt deskCount = 0.obs;
  RxInt roomCount = 0.obs;

  @override
  void onInit() {
    getDataByDate();

    super.onInit();
  }

  getData() async {
    try {
      isLoading(true);
      xModel.value = await ReservationService().fetchReservations();
    } finally {
      isLoading(false);
    }
  }

  getDataByDate() async {
    DateTime startDate = DateTime(2023, 10, 10);
    DateTime endDate = DateTime(2024, 5, 1);
    try {
      isLoading(true);
      xModel.value = await ReservationService()
          .fetchReservationsByDate(startDate, endDate);
    } finally {
      isLoading(false);
    }
  }

  getMonthData() async {
    DateTime startDate = DateTime(2024, 1, 1);
    DateTime endDate = DateTime(2024, 2, 1);
    try {
      isLoading(true);
      xModel.value = await ReservationService()
          .fetchReservationsByDate(startDate, endDate);
    } finally {
      isLoading(false);
    }
  }

  getQuarterData() async {
    DateTime startDate = DateTime(2023, 6, 1);
    DateTime endDate = DateTime(2024, 1, 1);
    try {
      isLoading(true);
      xModel.value = await ReservationService()
          .fetchReservationsByDate(startDate, endDate);
    } finally {
      isLoading(false);
    }
  }

  getyearData() async {
    DateTime startDate = DateTime(2023, 10, 10);
    DateTime endDate = DateTime(2024, 10, 10);
    try {
      isLoading(true);
      xModel.value = await ReservationService()
          .fetchReservationsByDate(startDate, endDate);
    } finally {
      isLoading(false);
    }
  }

  measureCounts() {
    for (var i in xModel) {}
  }
}
