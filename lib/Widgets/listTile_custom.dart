import 'package:flutter/material.dart';
import 'package:reciprocity/views/exam.dart';

class ListTileCustom extends StatefulWidget {
  final String title;
  final int examIndex;
  final int actualHighestScore;
  final int numberOfQuestions;
  final List<Map<String, dynamic>> questionsexam;
  final Function(int, int, int, String, bool) updateHighestScore;
  final Function(int) updateTimesCompleted;
  final String? imageasset;
  final int timesCompleted;

  const ListTileCustom({
    super.key,
    required this.title,
    required this.examIndex,
    required this.actualHighestScore,
    required this.numberOfQuestions,
    required this.questionsexam,
    required this.updateHighestScore,
    required this.updateTimesCompleted,
    this.imageasset,
    required this.timesCompleted,
  });

  @override
  State<ListTileCustom> createState() => _ListTileCustomState();
}

class _ListTileCustomState extends State<ListTileCustom> {
  String textoamostrar = '';

  @override
  void initState() {
    super.initState();
    _checkCompletion();
  }

  void _checkCompletion() {
    bool completed =
        widget.actualHighestScore == widget.numberOfQuestions;
    setState(() {
      textoamostrar = completed
          ? '¡Felicidades! Has completado el examen'
          : 'Aún no has completado el examen';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: GestureDetector(
              onTap: () async {
                final correctAnswers = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamView(
                      questionsexam: widget.questionsexam,
                      numberOfQuestions: widget.numberOfQuestions,
                    ),
                  ),
                );

                if (correctAnswers != null) {
                  bool completed =
                      correctAnswers == widget.numberOfQuestions;
                  if (correctAnswers > widget.actualHighestScore || completed) {
                    widget.updateHighestScore(correctAnswers,
                        widget.numberOfQuestions, widget.examIndex, widget.title, completed);
                    await widget.updateTimesCompleted(widget.examIndex);
                  }
                }
              },
              child: Column(
                children: [
                  ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(widget.title),
                            Text(
                                'Highest Score: ${widget.actualHighestScore}/${widget.numberOfQuestions}. Times completed: ${widget.timesCompleted}'),
                          ],
                        ),
                      ],
                    ),
                    leading: const Icon(Icons.book),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      widget.imageasset ??
                          'assets/images/logoconleyenda.png',
                      height: 220,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
