import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reciprocity/utils/exams_items.dart';
import 'package:reciprocity/Widgets/listTile_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Tests extends StatefulWidget {
  final int highestScore;
  Tests({super.key, required this.highestScore});

  @override
  State<Tests> createState() => _ThemesState();
}

class _ThemesState extends State<Tests> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser;
    loadHighestScore();
    loadTimesCompleted();
  }

  Future<void> loadHighestScore() async {
    for (int i = 0; i < exams.length; i++) {
      DocumentSnapshot doc = await _firestore
          .collection('highestScores')
          .doc('exam_${i}_${_currentUser!.email}')
          .get();
      if (doc.exists) {
        setState(() {
          exams[i]['actualHighestScore'] = doc['score'];
        });
      } else {
        setState(() {
          exams[i]['actualHighestScore'] = 0;
        });
      }
    }
  }

  Future<void> loadTimesCompleted() async {
    for (int i = 0; i < exams.length; i++) {
      DocumentSnapshot doc = await _firestore
          .collection('highestScores')
          .doc('exam_${i}_${_currentUser!.email}')
          .get();
      if (doc.exists) {
        setState(() {
          exams[i]['times_completed'] = doc['times_completed'];
        });
      } else {
        setState(() {
          exams[i]['times_completed'] = 0;
        });
      }
    }
  }

  Future<void> updateHighestScore(int newScore, int numberofQuestions,
      int examIndex, String examname, bool completed) async {
    setState(() {
      exams[examIndex]['actualHighestScore'] = newScore;
    });
    DocumentSnapshot doc = await _firestore
        .collection('highestScores')
        .doc('exam_${examIndex}_${_currentUser!.email}')
        .get();

    if (doc.exists) {
      if (completed) {
        await _firestore
            .collection('highestScores')
            .doc('exam_${examIndex}_${_currentUser!.email}')
            .update({
          'score': newScore,
          'times_completed': doc['times_completed'] + 1,
          'dateTime': dateTime,
        });
        setState(() {
          exams[examIndex]['times_completed'] = doc['times_completed'] + 1;
        });
      }
    } else {
      await _firestore
          .collection('highestScores')
          .doc('exam_${examIndex}_${_currentUser!.email}')
          .set({
        'score': newScore,
        'numberofQuestions': numberofQuestions,
        'email': _currentUser!.email,
        'examname': examname,
        'times_completed': 1,
        'dateTime': dateTime,
      });
      setState(() {
        exams[examIndex]['times_completed'] = 1;
      });
    }
  }

  Future<void> updateTimesCompleted(int examIndex) async {
    DocumentSnapshot doc = await _firestore
        .collection('highestScores')
        .doc('exam_${examIndex}_${_currentUser!.email}')
        .get();
    if (doc.exists) {
      setState(() {
        exams[examIndex]['times_completed'] = doc['times_completed'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: exams.length,
            itemBuilder: (context, index) {
              return ListTileCustom(
                title: exams[index]['title'].toString(),
                examIndex: index,
                actualHighestScore: exams[index]['actualHighestScore'],
                numberOfQuestions: exams[index]['numberOfQuestions'],
                questionsexam: exams[index]['exam'],
                updateHighestScore: updateHighestScore,
                updateTimesCompleted: updateTimesCompleted,
                imageasset: exams[index]['image'],
                timesCompleted: exams[index]['times_completed'],
              );
            },
          ),
        ],
      ),
    );
  }
}
