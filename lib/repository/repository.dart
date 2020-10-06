import 'package:dio/dio.dart';
import 'package:news_app/model/source_response.dart';

class NewsRepository {
  static String mainUrl = "https://newsapi.org/v2/"; /////
  final String apiKey = "6ba0aab5a5804a318089313594ee9a4a";

  final Dio _dio = Dio();

  var getSourcesUrl = "$mainUrl/sources";
  var getTopHeadLinesUrl = "$mainUrl/top-headLines";
  var everythingUrl = "$mainUrl/everything";

  Future<SourceResponse> getSources() async {
    var params = {
      "apiKey": apiKey,
      "language": "en",
      "country": "us",
    };
    try {
      Response response =
          await _dio.get(getSourcesUrl, queryParameters: params);
      return SourceResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return SourceResponse.withError(error);
    }
  }
}
