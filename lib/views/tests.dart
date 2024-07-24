import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';
import 'package:reciprocity/utils/exams_items.dart';
import 'package:reciprocity/Widgets/listTile_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Tests extends StatefulWidget {
  final List<Map<String, dynamic>> examsList;

  Tests({super.key, required this.examsList});

  @override
  State<Tests> createState() => _TestsState();
}

class _TestsState extends State<Tests> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _currentUser;
  DateTime dateTime = DateTime.now();
  late List<Map<String, dynamic>> exams;

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser;
    exams = widget.examsList;
    loadHighestScore();
    loadTimesCompleted();
  }

  Future<void> loadHighestScore() async {
    for (int i = 0; i < exams.length; i++) {
      String examId = exams[i]['title'];
      DocumentSnapshot doc = await _firestore
          .collection('highestScores')
          .doc('${examId}_${_currentUser!.email}')
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
      String examId = exams[i]['title'];
      DocumentSnapshot doc = await _firestore
          .collection('highestScores')
          .doc('${examId}_${_currentUser!.email}')
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
    String examId = exams[examIndex]['title'];
    DocumentSnapshot doc = await _firestore
        .collection('highestScores')
        .doc('${examId}_${_currentUser!.email}')
        .get();

    if (doc.exists) {
      if (completed) {
        await _firestore
            .collection('highestScores')
            .doc('${examId}_${_currentUser!.email}')
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
          .doc('${examId}_${_currentUser!.email}')
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
    String examId = exams[examIndex]['title'];
    DocumentSnapshot doc = await _firestore
        .collection('highestScores')
        .doc('${examId}_${_currentUser!.email}')
        .get();
    if (doc.exists) {
      setState(() {
        exams[examIndex]['times_completed'] = doc['times_completed'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: ListView(
        children: [
          Container(
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
          ),
        ],
      ),
    );
  }
}
