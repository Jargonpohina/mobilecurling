import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final handler = webSocketHandler((channel, protocol) {
    // Here we want to receive the stones that are being thrown.
    channel.stream.listen((message) {
      print(message);
    });

    // Here we want to send the game state.
    channel.sink.add('hi, this is lobby $id');
  });
  return handler(context);
}
