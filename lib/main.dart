import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculate(),
    );
  }
}

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Mather',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Column(children: [
          Container(
            height: 200,
            width: 500,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(right: 35),
            child: AutoSizeText(
              maxLines: 1,
              minFontSize: 50,
              overflow: TextOverflow.clip,
              _text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 90,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 600,
                color: Colors.black,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonValue('AC', Colors.grey, Colors.black),
                          buttonValue('+/-', Colors.grey, Colors.black),
                          buttonValue('%', Colors.grey, Colors.black),
                          buttonValue(
                              '/',
                              const Color.fromARGB(255, 255, 160, 19),
                              Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonValue(
                              '7',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '8',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '9',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              'X',
                              const Color.fromARGB(255, 255, 160, 19),
                              Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonValue(
                              '4',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '5',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '6',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '-',
                              const Color.fromARGB(255, 255, 160, 19),
                              Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonValue(
                              '1',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '2',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '3',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '+',
                              const Color.fromARGB(255, 255, 160, 19),
                              Colors.white),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          zero(),
                          buttonValue(
                              '.',
                              const Color.fromARGB(255, 63, 63, 63),
                              Colors.white),
                          buttonValue(
                              '=',
                              const Color.fromARGB(255, 255, 160, 19),
                              Colors.white),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ]));
  }

  bool _isPressed = false;
  Widget buttonValue(String buttontext, Color buttonColor, Color numberColor) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTap: () {
          try {
            getValue(buttontext);
          } catch (e) {
            setState(() {
              _text = "Error";
            });
            decimal = false;
          }
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            clipBehavior: Clip.hardEdge,
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: _isPressed ? Colors.grey[300] : buttonColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(
                    color: numberColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 50),
              ),
            )),
      );
    });
  }

  Widget zero() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) => setState(() => _isPressed = false),
        onTap: () {
          if (_text == 'Error') {
            _text = '0';
          }
          _text = '${_text}0';
          if (decimal == false &&
              double.parse(_text) == double.parse(_text).round()) {
            setState(() {
              _text = double.parse(_text).round().toString();
            });
          } else {
            setState(() {
              _text = _text;
            });
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 90,
          width: 200,
          decoration: BoxDecoration(
            color: _isPressed
                ? Colors.grey[300]
                : const Color.fromARGB(255, 63, 63, 63),
            borderRadius: BorderRadius.circular(100),
          ),
          child: const Padding(
            padding: EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '0',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 50),
              ),
            ),
          ),
        ),
      );
    });
  }

  String display(double number) {
    return number.toString();
  }

  String _text = '0';
  double lastValue = 0;
  String operator = '';
  bool decimal = false;

  void updateText(String newText) {
    setState(() {
      _text = newText;
    });
  }

  void generateNumber(String buttontext, double totalValue) {
    String numberPressed = buttontext;
    if (totalValue == 0 && decimal == false) {
      numberPressed = buttontext;
    } else if (totalValue == totalValue.round() && decimal == false) {
      numberPressed = totalValue.round().toString() + buttontext;
    } else if (totalValue == totalValue.round() && decimal == true) {
      numberPressed = '$_text$buttontext';
    } else {
      numberPressed = _text + buttontext;
    }
    if (totalValue == totalValue.round()) {
      setState(() {
        _text = numberPressed;
      });
    } else {
      setState(() {
        _text = numberPressed;
      });
    }
  }

  void getValue(buttontext) {
    try {
      double.parse(buttontext);
      if (_text == "Error") {
        _text = '0';
        decimal = false;
      }
    } catch (e) {
      if (buttontext == 'AC') {
        _text = '0';
      }
    }
    if (!(decimal == true && buttontext == ".")) {
      double totalValue = double.parse(_text);
      bool skip = false;
      if (buttontext == 'AC') {
        operator = '';
        setState(() {
          _text = "0";
        });
      }
      if (buttontext == "+/-") {
        if (totalValue == totalValue.round()) {
          setState(() {
            _text = (-(double.parse(_text))).round().toString();
          });
        } else {
          setState(() {
            _text = (-(double.parse(_text))).toString();
          });
        }
      }
      if (buttontext == "%") {
        if (totalValue / 100 == ((double.parse(_text)) / 100).round()) {
          setState(() {
            _text = ((double.parse(_text)) / 100).round().toString();
          });
        } else {
          setState(() {
            _text = ((double.parse(_text)) / 100).toString();
          });
        }
      }
      if (buttontext == '=') {
        switch (operator) {
          case "/":
            totalValue = lastValue / totalValue;
          case "X":
            totalValue = totalValue * lastValue;
          case "-":
            totalValue = lastValue - totalValue;
          case "+":
            totalValue = totalValue + lastValue;
          case "=":
        }
        if (operator == '') {
          setState(() {
            _text = _text;
          });
        } else if (totalValue == totalValue.round()) {
          setState(() {
            _text = totalValue.round().toString();
          });
        } else {
          setState(() {
            _text = totalValue.toString();
          });
        }
      }
      try {
        int.parse(buttontext);
      } catch (e) {
        if (buttontext != "." &&
            buttontext != "AC" &&
            buttontext != "+/-" &&
            buttontext != "%" &&
            buttontext != "=") {
          operator = buttontext;
        }
        skip = true;
      }
      if (!skip) generateNumber(buttontext, totalValue);
      if (buttontext == '.') {
        setState(() {
          _text = '$_text.';
        });
        decimal = true;
      }
      if (skip) {
        if (buttontext != ".") {
          lastValue = totalValue;
        }
        if (buttontext != '=' &&
            buttontext != "+/-" &&
            buttontext != "%" &&
            buttontext != ".") {
          _text = '0';
        }
      }
      if (_text.contains(".")) {
        decimal = true;
      } else {
        decimal = false;
      }
      if (_text.length > 9) {
        setState(() {
          fixFormatting();
        });
      }
    }
  }

  void fixFormatting() {
    try {
      double number = double.parse(_text);
      _text = number.toStringAsExponential(5);
    } catch (e) {}
  }
}
