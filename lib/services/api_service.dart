import 'package:dio/dio.dart';
import '../models/astronaut.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://api.open-notify.org';

  Future<List<Astronaut>> getAstronauts() async {
    try {
      final response = await _dio.get('$_baseUrl/astros.json');
      if (response.statusCode == 200) {
        final List<dynamic> peopleJson = response.data['people'];
        return peopleJson.map((json) => Astronaut.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load astronauts');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}