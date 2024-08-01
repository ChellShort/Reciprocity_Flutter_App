import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class ExamView extends StatefulWidget {
  final List<Map<String, dynamic>> questionsexam;
  final int numberOfQuestions;
  ExamView(
      {super.key,
      required this.questionsexam,
      required this.numberOfQuestions});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  List<Map<String, dynamic>> _allQuestions = [];
  int _actualnumberOfQuestions = 0;
  late List<Map<String, dynamic>> _selectedQuestions;
  final Map<int, String> _selectedAnswers = {};

  @override
  void initState() {
    super.initState();
    _actualnumberOfQuestions = widget.numberOfQuestions;
    _allQuestions = widget.questionsexam;
    _selectedQuestions = _getRandomQuestions();
  }

  List<Map<String, dynamic>> _getRandomQuestions() {
    final random = Random();
    final List<int> indices = [];
    while (indices.length < _actualnumberOfQuestions) {
      int index = random.nextInt(_allQuestions.length);
      if (!indices.contains(index)) {
        indices.add(index);
      }
    }
    return indices.map((index) => _allQuestions[index]).toList();
  }

  void _submitAnswers() {
    int correctAnswers = 0;
    _selectedQuestions.asMap().forEach((index, question) {
      if (_selectedAnswers[index] == question['answer']) {
        correctAnswers++;
      }
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Result'),
          content: Text(
              'You got $correctAnswers out of $_actualnumberOfQuestions correct.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(correctAnswers);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(),
      body: ListView.builder(
        itemCount: _selectedQuestions.length,
        itemBuilder: (context, index) {
          final question = _selectedQuestions[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (question['image'] != null && question['image'].isNotEmpty)
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: FutureBuilder(
                            future: Future.any([
                              precacheImage(NetworkImage(question['image']),
                                  context),
                            ]),
                            builder: (c, s) =>
                                s.connectionState == ConnectionState.done
                                    ? Image.network(question['image'])
                                    : const CircularProgressIndicator(),
                          ),
                        ),
                      ),
                    ),
                  Text(
                    question['question'],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ...question['options'].map<Widget>((option) {
                    return RadioListTile(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedAnswers[index],
                      onChanged: (value) {
                        setState(() {
                          _selectedAnswers[index] = value!;
                        });
                      },
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitAnswers,
        child: const Icon(Icons.check),
      ),
    );
  }
}
