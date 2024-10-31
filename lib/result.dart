
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Result extends StatefulWidget {

  final String bmi, bmi_message;

  const Result({super.key, required this.bmi, required this.bmi_message});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF466161)),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFCDDCDC),
              ),
              child: Center(
                child: Text(
                  widget.bmi,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.acme(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
            Text(widget.bmi_message,style: GoogleFonts.cabin(
              fontSize: 40,
              fontWeight: FontWeight.w400
            ),)
          ],

        ),
      ),

    );
  }
}
