abstract class BaseApiService {
  final String baseUrl = "https://nibrahim.pythonanywhere.com/"; //LOCAL

  final String apikey = "?api_key=2966A";
  Future<dynamic> get(String url);

  Future<dynamic> post(String url,
      {Map<String, dynamic>? data = const {}, type});

  Future<dynamic> put(
    String url, {
    Map<String, dynamic>? data = const {},
  });
}
