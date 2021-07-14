import 'dart:io';
import 'dart:convert';

Future main() async {
  final url = Uri.https(
    'hacker-news.firebaseio.com',
    '/v0/newstories.json',
    {'orderBy': '"\$key"', 'limitToFirst': '30'},
  );
  HttpClientRequest request = await HttpClient().getUrl(url);
  HttpClientResponse response = await request.close();
  await utf8.decoder.bind(response /*5*/).forEach((String data) {
    print(data);
  });
}
