import 'package:flutter/material.dart';
import 'package:flutter_application_3/dashboard_screen.dart'; // Ensure correct import path

class PCOSQuestionnaireScreen extends StatefulWidget {
  const PCOSQuestionnaireScreen({super.key});

  @override
  State<PCOSQuestionnaireScreen> createState() =>
      _PCOSQuestionnaireScreenState();
}

class _PCOSQuestionnaireScreenState extends State<PCOSQuestionnaireScreen> {
  // Sample PCOS-related questions
  final List<String> _questions = [
    "Do you have irregular menstrual cycles?",
    "Do you experience excessive hair growth (hirsutism)?",
    "Have you noticed significant weight gain recently?",
    "Do you have acne or oily skin issues?",
    "Do you experience frequent mood swings or depression?",
    "Have you experienced difficulty in conceiving?",
  ];

  // Tracking answers (Yes/No) for each question
  final Map<int, bool?> _answers = {};

  void _submitAnswers() {
    // Check if all questions are answered
    if (_answers.length == _questions.length && !_answers.containsValue(null)) {
      // Navigate to DashboardScreen after submitting answers
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardScreen()),
      );
    } else {
      // Show an error if any question is unanswered
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please answer all questions.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PCOD/PCOS Questionnaire"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Please answer the following questions:",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Questions list
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(_questions[index]),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _answers[index] = true;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: _answers[index] == true
                                  ? Colors.pinkAccent
                                  : Colors.grey[300],
                            ),
                            child: const Text("Yes",
                                style: TextStyle(color: Colors.white)),
                          ),
                          const SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _answers[index] = false;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: _answers[index] == false
                                  ? Colors.pinkAccent
                                  : Colors.grey[300],
                            ),
                            child: const Text("No",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: _submitAnswers,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}