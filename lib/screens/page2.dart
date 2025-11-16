import 'package:flutter/material.dart';
import 'package:latech/screens/page3.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0001FC),
        body: Container(
          alignment: AlignmentDirectional.center,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 80,
                ),
                child: Image.asset(
                  "assets/images/Illustration1.png",
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  "A lot of exclusives",
                  style: TextStyle(
                    fontSize: 25,
                    
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle,
                      size: 10,
                      color: const Color.fromARGB(255, 250, 250, 252)),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: MaterialButton(
                  height: 40,
                  minWidth: 100,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Page3()),
                    );
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
