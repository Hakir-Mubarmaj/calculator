import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void clear(String text) {
    setState(() {
      _expression = '';
      _result = '';
    });
  }

  void backspace() {
    if (_expression.isNotEmpty) {
      setState(() {
        _expression = _expression.substring(0, _expression.length - 1);
      });
    }
  }

  void evaluate(String text) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(_expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() => _result = eval.toString());
    } catch (e) {
      setState(() => _result = 'Error');
    }
  }

  Widget calcButton(String text, Color color, Color textColor, {int flex = 1, Function()? onPressed}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 50.0),
          ),
          child: text == '<' ? Icon(Icons.backspace_outlined) : Text(text, style: TextStyle(fontSize: 24)),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget calcButton2(String text, Color color, Color textColor, {int flex = 1, Function()? onPressed}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 48.0, horizontal: 40.0),
          ),
          child: Text(text, style: TextStyle(fontSize: 24)),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget calcButton3(String text, Color color, Color textColor, {int flex = 1, Function()? onPressed}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
          ),
          child: Text(text, style: TextStyle(fontSize: 24)),
          onPressed: onPressed,
        ),
      ),
    );
  }
  Widget calcButton4(String text, Color color, Color textColor, {int flex = 1, Function()? onPressed}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 34.0),
          ),
          child: text == '<' ? Icon(Icons.backspace) : Text(text, style: TextStyle(fontSize: 24)),
          onPressed: onPressed,
        ),
      ),
    );
  }

   Widget calcButton5(String text, Color color, Color textColor, {int flex = 1, Function()? onPressed}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 31.0),
          ),
          child: Text(text, style: TextStyle(fontSize: 24)),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget calcButton6(String text, Color color, Color textColor, {int flex = 1, Function()? onPressed}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 35.0),
          ),
          child: Text(text, style: TextStyle(fontSize: 24)),
          onPressed: onPressed,
        ),
      ),
    );
  }

  Widget calcButton0(String text, Color color, Color textColor, {int flex = 1, Function()? onPressed}) {
    return Flexible(
      flex: flex,
      fit: FlexFit.loose,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            onPrimary: textColor, // Text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 100.0),
          ),
          child: text == '<' ? Icon(Icons.backspace) : Text(text, style: TextStyle(fontSize: 24)),
          onPressed: onPressed,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    Color operationColor = isDarkMode ? Colors.lightBlue : Color.fromARGB(255, 188, 234, 255);
    Color equalsColor = isDarkMode ? Colors.blue[800]! : Color.fromARGB(255, 117, 181, 255);
    Color numberColor = isDarkMode ? const Color.fromARGB(255, 47, 47, 47) : Color.fromARGB(255, 246, 254, 255);
    Color textColor = isDarkMode ? Color.fromARGB(255, 35, 219, 251) : Color.fromARGB(255, 255, 255, 255);
    Color textColor1 = isDarkMode ? Color.fromARGB(255, 179, 179, 179) : Color.fromARGB(255, 185, 185, 185);
    Color textColor2 = isDarkMode ? Color.fromARGB(255, 255, 255, 255) : Color.fromARGB(255, 94, 77, 255);
    Color numberColo = isDarkMode ? Color.fromARGB(255, 148, 148, 148) : Color.fromARGB(255, 246, 254, 255);

    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.centerRight,
                  child: Text(_expression, style: TextStyle(fontSize: 24)),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  alignment: Alignment.centerRight,
                  child: Text(_result, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    calcButton3('e', numberColor, textColor, onPressed: () => numClick('e')),
                    calcButton3('u', numberColor, textColor, onPressed: () => numClick('u')),
                    calcButton6('sin', numberColor, textColor, onPressed: () => numClick('sin(')),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcButton4('Ac', numberColo, textColor1, onPressed: () => clear('AC')),
                    calcButton('<', numberColo, textColor1, onPressed: () => backspace()),
                    calcButton('/', operationColor, textColor2, onPressed: () => numClick('/')),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcButton('7', numberColor, textColor, onPressed: () => numClick('7')),
                    calcButton('8', numberColor, textColor, onPressed: () => numClick('8')),
                    calcButton('9', numberColor, textColor, onPressed: () => numClick('9')),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcButton('4', numberColor, textColor, onPressed: () => numClick('4')),
                    calcButton('5', numberColor, textColor, onPressed: () => numClick('5')),
                    calcButton('6', numberColor, textColor, onPressed: () => numClick('6')),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcButton('1', numberColor, textColor, onPressed: () => numClick('1')),
                    calcButton('2', numberColor, textColor, onPressed: () => numClick('2')),
                    calcButton('3', numberColor, textColor, onPressed: () => numClick('3')),
                  ],
                ),
                Row(
                  children: <Widget>[
                    calcButton0('0', numberColor, textColor, flex: 2, onPressed: () => numClick('0')),
                    calcButton('.', numberColor, textColor, onPressed: () => numClick('.')),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                calcButton5('deg', numberColor, textColor, onPressed: () => numClick('deg')),
                calcButton('*', operationColor, textColor2, onPressed: () => numClick('*')),
                calcButton('-', operationColor, textColor2, onPressed: () => numClick('-')),
                calcButton2('+', operationColor, textColor2, onPressed: () => numClick('+')),
                calcButton2('=', equalsColor, textColor, onPressed: () => evaluate('=')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
