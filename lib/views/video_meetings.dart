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
          Text(
            'PREPARE FOR THE VIDEOMEETING',
            style: GoogleFonts.fjallaOne(textStyle: const TextStyle(fontSize: 30)),
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
          Text(
            'Tap on the Image',
            style: GoogleFonts.cabin( textStyle: TextStyle(fontSize: 20, color: Colors.blue)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
