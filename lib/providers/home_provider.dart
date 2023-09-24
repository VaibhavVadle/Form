import 'package:form/api/api_url.dart';
import 'package:form/providers/defaulf_change_notifier.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeProvider extends DefaultChangeNotifier {
  late final WebSocketChannel _channel;

  HomeProvider() {
    _channel = WebSocketChannel.connect(
      Uri.parse(socketUrl),
    );
    // _channel.stream.listen((event) {
    //   debugPrint("Changed");
    // });
  }

  Stream get stream => _channel.stream;

  void addData(String data) {
    _channel.sink.add(data);
  }

  void closeStream() {
    _channel.sink.close();
  }
}
