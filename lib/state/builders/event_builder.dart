import 'package:flutter/material.dart';

class EventBuilder extends StatelessWidget {
   const EventBuilder({super.key, required this.builder, required this.event});

  final Widget Function(dynamic data)  builder;
  final Stream? event;

  @override
  Widget build(BuildContext context) {
 
    return StreamBuilder(
      stream: event,
      builder: (ctx, asc) {
        return builder(asc.data);
      },
    );
  }
}
