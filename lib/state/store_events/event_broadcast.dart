import 'dart:async';

class EventModel<E, T> {
  E? tag;
  StreamController<T>? value;
  EventModel({this.tag, this.value});
}

class EventBroadcast{
  static final List<EventModel> values = [];

  static addEvent(EventModel e) => values.add(e);
  static addEventBroadCast<E,T>(E e){
    values.add(EventModel(tag: e,value: StreamController<T>.broadcast()));
  }
  static removeEvent(EventModel e) {
    EventModel event = values.firstWhere((element) => element.tag == e.tag);
    event.value!.stream.listen((event) {}).cancel();
    values.removeWhere((element) => element.tag == e.tag);
  }
}

abstract class EventBroadcasLisenable<E> {
  Stream listen({required E tag}) {
    EventModel event = EventBroadcast.values.firstWhere(
      (element) => element.tag == tag,
      orElse: () => EventModel(),
    );
    if (event.value == null) throw Exception();
    return event.value!.stream;
  }
}

abstract class EventBroadcastSender<E> {
  send({required E tag, required dynamic value}) {
    EventModel event = EventBroadcast.values.firstWhere(
      (element) => element.tag == tag,
      orElse: () => EventModel(),
    );
    if (event.value == null) throw Exception();
    event.value!.add(value);
  }
}


