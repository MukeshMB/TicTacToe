import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.blue[900],
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: AssetImage('assets/images/flutter.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Container(
                          height: 100,
                          width: 100,
                          child: Image(
                            image: AssetImage('assets/images/dart.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    ' Developer info - ',
                    style: TextStyle(color: Colors.amber, fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          'MUKESH BHARTI',
                          style: TextStyle(
                              color: Colors.pink[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'N.I.T. JALANDHAR (CSE)',
                          style: TextStyle(
                              color: Colors.pink[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'mukeshb.cs.20@nitj.ac.in',
                          style: TextStyle(
                              color: Colors.pink[900],
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'TicTacToe v1.1.0 is a n*n single and multiplayer game developed using flutter dart.',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/');
          },
          child: Icon(
            Icons.arrow_back,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
