import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 2/2,
            children: [
              GestureDetector(
                onTap: ()
                {
            
                },
                child: Card(
                  elevation: 14,
                  color: Colors.grey,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF6C9F9F)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female_outlined,
                        size: 150,
                        color: Colors.white,),
                
                
                        Text("Female", style: TextStyle(
                          color: Colors.white, fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()
                {
            
                },
                child: Card(
                  elevation: 14,
                  color: Colors.grey,
                  margin: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF6C9F9F)),
                    child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male_outlined,
                          size: 150,
                          color: Colors.white,),
            
            
                        Text("Male", style: TextStyle(
                          color: Colors.white, fontSize: 20,
                          fontWeight: FontWeight.w200,
                        ),)
                      ],
                    ),
                  ),
                ),
              ),
            
              
            ],),
          ),
        ],
      ),
    );
  }
}
