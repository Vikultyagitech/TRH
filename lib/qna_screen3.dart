import 'package:flutter/material.dart';
import 'package:flutter_application_3/allergic_screen.dart';
import 'package:flutter_application_3/bloodpressure_screen.dart';
import 'package:flutter_application_3/cholestrol_screen.dart';
import 'package:flutter_application_3/diabetes_questionnaire_screen.dart';
import 'package:flutter_application_3/digestive_screen.dart';
import 'package:flutter_application_3/healthquestionaire_screen.dart';
import 'package:flutter_application_3/pcod_screen.dart';
import 'package:flutter_application_3/thyroid_screen.dart';
import 'package:flutter_application_3/underweightscreen.dart';

class MultipleChoiceQuestionScreen2 extends StatefulWidget {
  final String userName;
  final VoidCallback onContinue;

  const MultipleChoiceQuestionScreen2({
    super.key,
    required this.userName,
    required this.onContinue,
  });

  @override
  State<MultipleChoiceQuestionScreen2> createState() =>
      _MultipleChoiceQuestionScreenState();
}

class _MultipleChoiceQuestionScreenState
    extends State<MultipleChoiceQuestionScreen2> with SingleTickerProviderStateMixin {
  final List<int> _selectedAnswers = [];
  int? _selectedButtonAnswer;
  String _otherInput = "";
  late AnimationController _animationController;
  late Animation<double> _buttonScaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _buttonScaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _toggleCheckboxAnswer(int value) {
    setState(() {
      if (_selectedAnswers.contains(value)) {
        _selectedAnswers.remove(value);
      } else {
        _selectedAnswers.add(value);
      }
    });
  }

  void _selectButtonAnswer(int value) {
    setState(() {
      if (_selectedButtonAnswer == value) {
        _selectedButtonAnswer = null;
      } else {
        _selectedButtonAnswer = value;
        _selectedAnswers.clear();
      }
    });
  }

  void _submitAnswer() {
    if (_selectedButtonAnswer == 0) {
      widget.onContinue(); // Call the onContinue callback
    } else if (_selectedAnswers.contains(1)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const ThyroidQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(2)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DiabetesQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(3)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const PCOSQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(4)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CholesterolQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(5)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BloodPressureQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(6)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HealthQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(7)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const underweightscreen()),
      );
    } else if (_selectedAnswers.contains(8)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DigestiveQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(9)) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AllergicIssuesQuestionnaireScreen()),
      );
    } else if (_selectedAnswers.contains(10) && _otherInput.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Your input: $_otherInput')),
      );
    } else if (_selectedAnswers.isNotEmpty || _selectedButtonAnswer != null) {
      widget.onContinue(); // Call the onContinue callback
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one answer.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Health Condition Preferences',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.black87), // Back button color
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Do you have any of the following health conditions?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                // Non-medical condition button
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: _selectedButtonAnswer == 0
                        ? Colors.black12
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _selectedButtonAnswer == 0
                          ? Colors.black87
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ListTile(
                    title: const Text(
                      'Non-medical condition',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    onTap: () => _selectButtonAnswer(0),
                  ),
                ),

                const SizedBox(height: 20),

                // Health conditions checkboxes
                ...List.generate(10, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: _selectedAnswers.contains(index + 1)
                          ? Colors.black12
                          : Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _selectedAnswers.contains(index + 1)
                            ? Colors.black87
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        [
                          'Thyroid',
                          'Diabetes / Pre-Diabetes',
                          'PCOD/PCOS',
                          'Cholesterol',
                          'Blood Pressure',
                          'Obesity',
                          'Under Weight',
                          'Digestive Issues',
                          'Allergic Issues',
                          'Others',
                        ][index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      onTap: _selectedButtonAnswer == null
                          ? () => _toggleCheckboxAnswer(index + 1)
                          : null,
                    ),
                  );
                }),

                // Other input field
                if (_selectedAnswers.contains(10))
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Please specify your condition:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          onChanged: (value) {
                            setState(() {
                              _otherInput = value;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Colors.black87),
                            ),
                            filled: true,
                            fillColor: Colors.grey.withOpacity(0.1),
                            hintText: 'Enter your condition',
                            hintStyle: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),

                const SizedBox(height: 30),

                // Continue button with animation
                Center(
                  child: ScaleTransition(
                    scale: _buttonScaleAnimation,
                    child: ElevatedButton(
                      onPressed: () {
                        _animationController.forward().then((_) {
                          _animationController.reverse();
                          _submitAnswer();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 5,
                        shadowColor: Colors.black.withOpacity(0.3),
                      ),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
