import 'dart:math';
import 'package:flutter/material.dart';
import 'package:reciprocity/Widgets/app_bar.dart';

class ExamView extends StatefulWidget {
  final List<Map<String, dynamic>> questionsexam;
  final int numberOfQuestions;

  ExamView({
    Key? key,
    required this.questionsexam,
    required this.numberOfQuestions,
  }) : super(key: key);

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  List<Map<String, dynamic>> _allQuestions = [];
  int _actualnumberOfQuestions = 0;
  late List<Map<String, dynamic>> _selectedQuestions;
  final Map<int, Set<String>> _selectedAnswers = {};
  final Map<int, String> _selectedSingleAnswer = {};
  final Map<int, String> _openAnswers = {};

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
      if (question['type'] == 'mult') {
        Set<String> correctOptions = Set.from(question['answer']);
        if (_selectedAnswers[index] != null &&
            _selectedAnswers[index]!.containsAll(correctOptions) &&
            correctOptions.containsAll(_selectedAnswers[index]!)) {
          correctAnswers++;
        }
      } else if (question['type'] == 'unique') {
        if (_selectedSingleAnswer[index] == question['answer']) {
          correctAnswers++;
        }
      } else if (question['type'] == 'open') {
        if (_openAnswers[index] != null &&
            _openAnswers[index]!.trim().toLowerCase() == question['answer'].trim().toLowerCase()) {
          correctAnswers++;
        }
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
                  if (question['type'] == 'mult') ...question['options'].map<Widget>((option) {
                    bool isChecked = _selectedAnswers[index]?.contains(option) ?? false;
                    return CheckboxListTile(
                      title: Text(option),
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          if (_selectedAnswers[index] == null) {
                            _selectedAnswers[index] = <String>{};
                          }
                          if (value == true) {
                            _selectedAnswers[index]!.add(option);
                          } else {
                            _selectedAnswers[index]!.remove(option);
                          }
                        });
                      },
                    );
                  }).toList(),
                  if (question['type'] == 'unique') ...question['options'].map<Widget>((option) {
                    bool isSelected = _selectedSingleAnswer[index] == option;
                    return RadioListTile<String>(
                      title: Text(option),
                      value: option,
                      groupValue: _selectedSingleAnswer[index],
                      onChanged: (value) {
                        setState(() {
                          _selectedSingleAnswer[index] = value!;
                        });
                      },
                    );
                  }).toList(),
                  if (question['type'] == 'open') 
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Your Answer',
                      ),
                      onChanged: (value) {
                        setState(() {
                          _openAnswers[index] = value;
                        });
                      },
                    ),
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
