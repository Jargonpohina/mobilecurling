import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context) async {
  final handler = webSocketHandler((channel, protocol) {
    // Listen to clients
    channel.stream.listen((message) {
      print(message);
    });

    // Send a msg to client
    channel.sink.add('hi');
  });
  return handler(context);
}
