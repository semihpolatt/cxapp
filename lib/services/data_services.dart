import 'package:cxapp/models/reservations.dart';
import 'package:injector/injector.dart';
import 'package:supabase/supabase.dart';

class ReservationService {
  final SupabaseClient supabaseClient =
      Injector.appInstance.get<SupabaseClient>();

  Future<List<Reservation>> fetchReservations() async {
    final response = await supabaseClient.from('reservations').select('*');

    if (response.isNotEmpty) {
      final data = List<Map<String, dynamic>>.from(response);
      return data.map((json) => Reservation.fromJson(json)).toList();
    } else {
      // Hata durumunda boş bir liste dönüyoruz veya hata yönetimi yapabiliriz.

      return [];
    }
  }

  Future<List<Reservation>> fetchReservationsByDate(
      DateTime startDate, DateTime endDate) async {
    final response = await supabaseClient
        .from('reservations')
        .select('*')
        .gte('START_TM', startDate.toIso8601String())
        .lte('START_TM', endDate.toIso8601String());

    if (response.isNotEmpty) {
      final data = List<Map<String, dynamic>>.from(response);
      return data.map((json) => Reservation.fromJson(json)).toList();
    } else {
      // Hata durumunda boş bir liste dönüyoruz veya hata yönetimi yapabiliriz.

      return [];
    }
  }
}
