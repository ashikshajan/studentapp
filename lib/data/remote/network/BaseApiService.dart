abstract class BaseApiService {
  final String baseUrl = "http://192.168.1.34:5000/trip_app/"; //LOCAL
  Future<dynamic> get(String url);

  Future<dynamic> post(String url,
      {Map<String, dynamic>? data = const {}, type});

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? data = const {},
  });
}
