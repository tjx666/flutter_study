import 'dart:convert';
import 'dart:io';

class HttpUtil {
  static final Utf8Decoder utf8Decoder = Utf8Decoder();
  static final HttpClient client = HttpClient();

  static dynamic get<T>(String url) async {
    HttpClientRequest request;
    try {
      request = await client.getUrl(Uri.parse(url));
    } catch (e) {
      print('Make request error, please check your request configuration.');
      rethrow;
    }

    HttpClientResponse response;
    try {
      response = await request.close();
    } catch (e) {
      rethrow;
    }

    if (response.statusCode != 200)
      throw HttpException(
          'url: $url, code: ${response.statusCode}, msg: ${response.reasonPhrase}');

    final bodyData = <int>[];
    await for (var data in response) {
      bodyData.addAll(data);
    }
    final mime = response.headers.contentType?.mimeType;
    dynamic body = bodyData;
    if (mime?.contains(r'text|json') == true) {
      final bodyString = utf8Decoder.convert(bodyData);
      if (mime == 'application/json') {
        body = jsonDecode(bodyString);
      } else {
        body = bodyString;
      }
    }

    return body as T;
  }
}

Future<void> main(List<String> args) async {
  final stopWatch = Stopwatch()..start();
  final response = await HttpUtil.get(
      'https://hacker-news.firebaseio.com/v0/topstories.json');
  print(stopWatch.elapsed.inMilliseconds);
}
