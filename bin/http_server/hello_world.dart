import 'dart:io';

Future<void> main() async {
  final host = InternetAddress.loopbackIPv4;
  const PORT = 9001;
  final server = await HttpServer.bind(host, PORT);
  print('Listening on http://${server.address.address}:${server.port}/');
  await for (final request in server) {
    request.response.write('hello world');
    await request.response.close();
  }
}
