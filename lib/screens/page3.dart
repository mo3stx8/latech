import 'package:latech/screens/introScreen.dart';
import 'package:latech/screens/page2.dart';
import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF0001FC),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: AlignmentDirectional.center,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 230,
                ),
                child: Image.asset(
                  "assets/images/Illustration.png",
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 110, bottom: 20),
                child: Text(
                  "The bes tech market",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.circle, size: 10, color: Colors.grey),
                  SizedBox(width: 4),
                  Icon(Icons.circle,
                      size: 10,
                      color: const Color.fromARGB(255, 250, 250, 252)),
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
                    //يفتح الصفحه الي بعدها ويخلي هاذي شغال في الخلفيه
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Page2()),
                    // );
                    //يفتح الصفحه الي بعدها ويغلق الصفحه الحاليه
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => IntroScreen()),
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
