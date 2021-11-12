import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int count = 3;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 400,
              width: 500,
              color: Colors.transparent,
              child: Image(
                image: AssetImage('assets/images/tic-tac-toe.png'),
                fit: BoxFit.contain,
              ),
            ),
            IconButton(
              onPressed: () {
                count++;
                setState(() {});
              },
              icon: Icon(Icons.plus_one),
              iconSize: 50,
              color: Colors.blue,
              focusColor: Colors.blue,
              splashColor: Colors.green,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    mul = 1;
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Icon(
                      Icons.phone_android_outlined,
                      size: 70,
                      color: mul == 1 ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "size $count",
                    style: TextStyle(
                        color: Colors.teal,
                        fontSize: 35,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    mul = 2;
                    setState(() {});
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Icon(
                      Icons.face,
                      size: 70,
                      color: mul == 2 ? Colors.blue : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: () {
                if (count > 3) {
                  count--;
                  setState(() {});
                }
              },
              icon: Icon(Icons.exposure_minus_1),
              iconSize: 50,
              color: Colors.blue,
              splashColor: Colors.green,
            ),
            IconButton(
              onPressed: () {
                n = count;
                setState(() {});
                Navigator.pushNamed(context, '/tic');
              },
              icon: Icon(Icons.play_arrow),
              iconSize: 100,
              color: Colors.red,
              focusColor: Colors.blue,
              splashColor: Colors.green,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 40,
        width: 40,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/info');
          },
          child: Icon(
            Icons.info,
            color: Colors.black,
            size: 40,
          ),
        ),
      ),
    );
  }
}
