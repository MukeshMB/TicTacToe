import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'global.dart';

class TicTac extends StatefulWidget {
  @override
  _TicTacState createState() => _TicTacState();
}

class _TicTacState extends State<TicTac> {
  var s = new List.filled(n * n, '');
  int to = 1;
  int sx = 0;
  int win = 0;
  String ch = '';
  int hard = 0;
  int mulx = 0;

  int change() {
    double rep = 0;
    Timer.periodic(Duration(microseconds: 180), (timer) {
      rep += 0.05;
      sx = ~sx;
      setState(() {});
      if (rep > 5) {
        if (s[(n / 2).toInt() * n + (n / 2).toInt()] == '') {
          s[(n / 2).toInt() * n + (n / 2).toInt()] = 'X';
          setState(() {});
        } else if (s[(n / 2).toInt() * n + (n / 2).toInt()] == 'O' &&
            hard == 2 &&
            (s[n - 1] == 'O' ||
                s[n * (n - 1)] == 'O' ||
                s[n * (n - 1) + n - 1] == 'O')) {
          if (s[n - 1] == '') {
            s[n - 1] = 'X';
          } else if (s[n * (n - 1)] == '') {
            s[n * (n - 1)] = 'X';
          } else if (s[n * (n - 1) + n - 1] == '') {
            s[n * (n - 1) + n - 1] = 'X';
          }
        } else if (s[(n / 2).toInt() * n + (n / 2).toInt()] == 'X' &&
            hard == 2 &&
            ((s[n - 1] == 'O' && s[n * (n - 1)] == 'O') ||
                (s[n * (n - 1)] == 'O' &&
                    s[n * (n / 2).toInt() + n - 1] == 'O') ||
                (s[n * (n - 1) + (n / 2).toInt()] == 'O' && s[n - 1] == 'O') ||
                (s[n * (n - 1) + (n / 2).toInt()] == 'O' &&
                    s[n * (n / 2).toInt() + n - 1] == 'O'))) {
          if (s[n - 1] == 'O' && s[n * (n - 1)] == 'O') {
            s[n - 2] = 'X';
          } else if (s[n * (n - 1) + (n / 2).toInt()] == 'O' &&
              s[n * (n / 2).toInt() + n - 1] == 'O') {
            s[n * (n - 1) + n - 1] = 'X';
          } else if (s[n * (n - 1) + (n / 2).toInt()] == 'O' &&
              s[n - 1] == 'O') {
            s[n * n - 1] = 'X';
          } else if (s[n * (n - 1)] == 'O' &&
              s[n * (n / 2).toInt() + n - 1] == 'O') {
            s[n * n - 1] = 'X';
          }
        } else {
          int test = 0;
          pos = -1;
          max = -1;
          for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
              if (s[i * n + j] == '') {
                if (safeXO(i, j)) {
                  s[i * n + j] = 'X';

                  setState(() {});
                  max = -1;
                  test = 1;
                  break;
                }
              }
            }
            if (test == 1) {
              break;
            }
          }
          if (test == 0) {
            if (!victory()) {
              s[pos] = 'X';
            }
          }
        }

        setState(() {});
        to = 1;
        sx = 0;
        timer.cancel();
      }
    });
    return 1;
  }

  bool victory() {
    int c = 0;
    while (c < n) {
      int x = 0, o = 0;
      for (int i = 0; i < n; i++) {
        if (s[i * n + c] == 'X') {
          x++;
        } else if (s[i * n + c] == 'O') {
          o++;
        } else {
          break;
        }
        if (x != 0 && o != 0) {
          break;
        }
      }

      if (x == n) {
        win = 1;
        ch = 'X';
        setState(() {});
        return true;
      } else if (o == n) {
        win = 1;
        ch = 'O';
        setState(() {});
        return true;
      }
      c++;
    }

    c = 0;
    while (c < n) {
      int x = 0, o = 0;
      for (int i = 0; i < n; i++) {
        if (s[n * c + i] == 'X') {
          x++;
        } else if (s[n * c + i] == 'O') {
          o++;
        } else {
          break;
        }
        if (x != 0 && o != 0) {
          break;
        }
      }

      if (x == n) {
        win = 1;
        ch = 'X';
        setState(() {});
        return true;
      } else if (o == n) {
        win = 1;
        ch = 'O';
        setState(() {});
        return true;
      }
      c++;
    }

    int x = 0, o = 0;
    for (int i = 0, j = 0; i < n; i++, j++) {
      if (s[i * n + j] == 'X') {
        x++;
      } else if (s[i * n + j] == 'O') {
        o++;
      } else {
        break;
      }
    }
    if (x == n) {
      win = 1;
      ch = 'X';
      setState(() {});
      return true;
    } else if (o == n) {
      win = 1;
      ch = 'O';
      setState(() {});
      return true;
    }

    x = 0;
    o = 0;
    for (int i = n - 1, j = 0; j < n; i--, j++) {
      if (s[i * n + j] == 'X') {
        x++;
      } else if (s[i * n + j] == 'O') {
        o++;
      } else {
        break;
      }
    }
    if (x == n) {
      win = 1;
      ch = 'X';
      setState(() {});
      return true;
    } else if (o == n) {
      win = 1;
      ch = 'O';
      setState(() {});
      return true;
    }
    int count = 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        if (s[i * n + j] == '') {
          count++;
        }
      }
    }
    if (count == 0) {
      to = 1;
      sx = 0;
      win = 2;
      setState(() {});
      return true;
    }

    return false;
  }

  bool safeXO(int r, int c) {
    int o = 0, x = 0;
    for (int i = 0; i < n; i++) {
      if (s[r * n + i] == 'O') {
        o++;
      } else if (s[r * n + i] == 'X') {
        x++;
      }
      if (o > 0 && x > 0) {
        x = -1;
        break;
      }
    }
    if (x == n - 1) {
      return true;
    } else if (o == n - 1) {
      pos = n * r + c;
      max = n;
    }

    if (x > max) {
      pos = n * r + c;
      max = x;
    }

    o = 0;
    x = 0;
    for (int i = 0; i < n; i++) {
      if (s[i * n + c] == 'O') {
        o++;
      } else if (s[n * i + c] == 'X') {
        x++;
      }
      if (o > 0 && x > 0) {
        x = -1;
        break;
      }
    }
    if (x == n - 1) {
      return true;
    } else if (o == n - 1) {
      pos = r * n + c;
      max = n;
    }
    if (x > max) {
      pos = r * n + c;
      max = x;
    }

    o = 0;
    x = 0;
    if (r == c) {
      for (int i = 0, j = 0; i < n && j < n; i++, j++) {
        if (s[i * n + j] == 'O') {
          o++;
        } else if (s[i * n + i] == 'X') {
          x++;
        }
        if (o > 0 && x > 0) {
          x = -1;
          break;
        }
      }
    }
    if (x == n - 1) {
      return true;
    } else if (o == n - 1) {
      pos = r * n + c;
      max = n;
    }
    if (x > max) {
      pos = r * n + c;
      max = x;
    }

    o = 0;
    x = 0;
    if (r + c == n - 1) {
      for (int i = n - 1, j = 0; i >= 0 && j < n; i--, j++) {
        if (s[i * n + j] == 'O') {
          o++;
        } else if (s[i * n + j] == 'X') {
          x++;
        }
        if (o > 0 && x > 0) {
          x = -1;
          break;
        }
      }
    }
    if (x == n - 1) {
      return true;
    } else if (o == n - 1) {
      pos = r * n + c;
      max = n;
    }
    if (x > max) {
      pos = r * n + c;
      max = x;
    }
    return false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: GridView.builder(
                  itemCount: n * n,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: n),
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.all(2),
                      child: GestureDetector(
                        onTap: () {
                          if (!victory()) {
                            if (mul != 2) {
                              if (s[index] == '' && to == 1) {
                                s[index] = 'O';
                                hard++;
                                to = 0;
                                sx = 1;
                                setState(() {});
                                if (!victory()) {
                                  change();
                                }
                                setState(() {});
                              }
                            } else {
                              if (mulx == 0) {
                                if (s[index] == '') {
                                  s[index] = 'O';
                                  mulx = 1;
                                  to = 0;
                                  sx = 1;
                                  setState(() {});
                                }
                              } else {
                                if (!victory() && s[index] == '') {
                                  s[index] = 'X';
                                  mulx = 0;
                                  sx = 0;
                                  to = 1;
                                  setState(() {});
                                }
                              }
                            }
                          }
                        },
                        child: Container(
                          color: Colors.black,
                          child: Center(
                            child: Text(
                              s.elementAt(index).toString(),
                              textScaleFactor: 20 / n,
                              style: TextStyle(
                                  color: s[index].toString() == 'X'
                                      ? Colors.red[800]
                                      : Colors.blue[700]),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blueGrey[900],
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Icon(
                                Icons.face,
                                color:
                                    to == 1 ? Colors.blue[700] : Colors.white,
                                size: 80,
                              ),
                            ),
                            Container(
                              child: Text(
                                ' O',
                                style: TextStyle(
                                    color: to == 1
                                        ? Colors.blue[800]
                                        : Colors.white,
                                    fontSize: 55),
                              ),
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Container(
                              child: Text(
                                'X',
                                style: TextStyle(
                                    color: to == 0
                                        ? Colors.red[800]
                                        : Colors.white,
                                    fontSize: 50),
                              ),
                            ),
                            Container(
                              child: Icon(
                                mul == 2 ? Icons.face : Icons.phone_android,
                                color: sx == 1 ? Colors.red[900] : Colors.white,
                                size: 70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Center(
                      child: win == 1
                          ? Text(
                              '$ch won ',
                              style:
                                  TextStyle(color: Colors.amber, fontSize: 50),
                            )
                          : win == 2
                              ? Text(
                                  'Draw ',
                                  style: TextStyle(
                                      color: Colors.amber, fontSize: 50),
                                )
                              : Text(''),
                    ),
                    color: (win == 1) || (win == 2)
                        ? Colors.black
                        : Colors.transparent,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: (win == 1) || (win == 2)
          ? Container(
              height: 45,
              width: 45,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                splashColor: Colors.red[800],
                hoverColor: Colors.green[900],
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/tic');
                },
                child: Icon(
                  Icons.replay,
                  color: Colors.amber,
                  size: 40,
                ),
              ),
            )
          : Container(
              height: 45,
              width: 45,
              child: FloatingActionButton(
                backgroundColor: Colors.black,
                splashColor: Colors.pink[800],
                hoverColor: Colors.blue[900],
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Icon(
                  Icons.home,
                  color: Colors.blueGrey[100],
                  size: 40,
                ),
              ),
            ),
    );
  }
}
