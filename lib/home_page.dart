import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/result.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Height controller declaration
  TextEditingController heightController = TextEditingController();
  // Weight controller
  TextEditingController weightController = TextEditingController();

  // Initial values
  String weight = " ";
  String height = " ";
  String bmi = " ";

  // Variable to track selected gender
  String? selectedGender;

  // Function for BMI calculation and navigation
  void buttonPressed() {
    height = heightController.text;
    weight = weightController.text;

    // Check for empty fields before parsing
    if (weight.isEmpty || height.isEmpty) {
      Fluttertoast.showToast(msg: "Enter height and weight");
      return; // Stop execution if fields are empty
    }

    double h = double.tryParse(height) ?? 0;
    double w = double.tryParse(weight) ?? 0;

    // Height cannot be zero
    if (h == 0) {
      Fluttertoast.showToast(msg: "Height cannot be zero");
      return;
    }

    h = h / 100; // Convert height cm to meter

    // Calculate BMI
    double bmi = w / (h * h);

    // Determine BMI category
    String bmiMessage;
    if (bmi < 18.5) {
      bmiMessage = "You are underweight";
    } else if (bmi >= 18.5 && bmi <= 25.5) {
      bmiMessage = "You are healthy";
    } else {
      bmiMessage = "You are overweight";
    }

    // Navigate to Result page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Result(bmi: bmi.toStringAsFixed(2), bmi_message: bmiMessage),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("BMI CALCULATOR", style: GoogleFonts.b612Mono(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.teal
          ),),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = "Female"; // Update selected gender
                            });
                          },
                          child: Card(
                            elevation: 14,
                            color: Colors.grey,
                            margin: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF6C9F9F),
                              ),
                              child: Stack( // Use Stack to overlay the checkmark
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.female_outlined,
                                        size: 110,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Female",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (selectedGender == "Female") // Show checkmark if selected
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedGender = "Male"; // Update selected gender
                            });
                          },
                          child: Card(
                            elevation: 14,
                            color: Colors.grey,
                            margin: EdgeInsets.all(10),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFF6C9F9F),
                              ),
                              child: Stack( // Use Stack to overlay the checkmark
                                alignment: Alignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.male_outlined,
                                        size: 110,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (selectedGender == "Male") // Show checkmark if selected
                                    Positioned(
                                      top: 10,
                                      right: 10,
                                      child: Icon(
                                        Icons.check_circle,
                                        color: Colors.black,
                                        size: 40,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),



            // Height input field
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                // Height controller
                controller: heightController,
                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade800, width: 3.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),

                  border: OutlineInputBorder(),
                  labelText: "Height",
                  hintText: "Enter your height(cm)",
                  prefixIcon: Icon(Icons.height_outlined),
                ),
              ),
            ),



            // Weight input field
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                // Weight controller
                controller: weightController,
                decoration: InputDecoration(

                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.teal.shade800, width: 3.0),
                    borderRadius: BorderRadius.circular(50.0),
                  ),


                  border: OutlineInputBorder(),
                  labelText: "Weight",
                  hintText: "Enter your weight(kg)",
                  prefixIcon: Icon(Icons.line_weight),
                ),
              ),
            ),


            // Submit button
            SizedBox(
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  buttonPressed();
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

