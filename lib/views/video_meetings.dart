import 'package:flutter/material.dart';
import 'package:reciprocity/views/videomeeting.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoMeetings extends StatefulWidget {
  const VideoMeetings({super.key});

  @override
  State<VideoMeetings> createState() => _VideoMeetingsState();
}

class _VideoMeetingsState extends State<VideoMeetings> {
  @override
  Widget build(BuildContext context) {
    //return Text('hola');
    return Container(
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'PREPARE FOR THE VIDEOMEETING',
            style: TextStyle(
              fontFamily: "Fjalla",
              fontSize: 30
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,),
          
          SizedBox(
            width: 350,
            child: ElevatedButton(
                clipBehavior: Clip.antiAlias,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const JitsiTrial()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: EdgeInsets.zero,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/videomeeting.png',
                    ),
                  ],
                )),
          ),
          const Text(
            'Tap on the Image',
            style: TextStyle(
              fontFamily: "Cabin",
              fontSize: 20,
              color: Colors.blue
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
