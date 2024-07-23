import 'package:flutter/material.dart';


class VideoMeetings extends StatefulWidget {
  const VideoMeetings({super.key});

  @override
  State<VideoMeetings> createState() => _VideoMeetingsState();
}

class _VideoMeetingsState extends State<VideoMeetings> {
  @override
  Widget build(BuildContext context) {
    return Text('hola');
    // return ElevatedButton(
    //     onPressed: () {
    //       Navigator.push(context,
    //           MaterialPageRoute(builder: (context) => Prueba_videomeeting()));
    //     },
    //     child: const Text('Hola'));
  }
}
