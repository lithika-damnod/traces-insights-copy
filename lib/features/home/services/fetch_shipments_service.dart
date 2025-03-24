import 'package:traces/core/constants/api_config.dart';
import 'package:traces/core/services/jwt_service.dart';

class FetchShipmentsService {
  final JwtService _dio = JwtService();

  Future<List<dynamic>> fetchShipments() async {
    try {
      final response = await _dio.get('${ApiConfig.baseUrl}/api/shipments/');

      if (response.statusCode == 200) {
        // Return the raw JSON data
        return response.data;
      } else {
        throw Exception('Failed to load shipments');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<Map<String, dynamic>?> fetchShipmentsById(String id) async {
    try {
      final response = await _dio.get(
          '${ApiConfig.baseUrl}/api/shipments/${id.toString().replaceAll(" ", '-')}/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load shipments');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  Future<List<dynamic>?> fetchShipmentTimeline(String id) async {
    try {
      final response = await _dio.get(
          '${ApiConfig.baseUrl}/api/shipments/${id.toString().replaceAll(" ", '-')}/timeline/');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Failed to load shipments');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
