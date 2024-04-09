import 'dart:async';

class BroadcasterX {
  static var streamController = StreamController.broadcast();

  static StreamSubscription subscribe(void Function(String)? onNotif) {
    return streamController.stream.listen((notif) {
      onNotif!(notif);
    });
  }

  static unsubscribe(StreamSubscription subscription) {
    subscription.cancel();
  }

  static void broadcast(String notif) {
    streamController.sink.add(notif);
  }
}
