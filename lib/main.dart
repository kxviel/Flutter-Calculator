import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = '0', _output = '0', numb, op = '';
  double num1 = 0.0, num2 = 0.0;

  buttonPressed(numb) {
    if (numb == 'AC') {
      _output = '0';
      op = '0';
      num1 = 0.0;
      num2 = 0.0;
    } else if (numb == '+' || numb == '-' || numb == '/' || numb == '*') {
      num1 = double.parse(output);
      op = numb;
      _output = ' ';
    } else if (numb == '.') {
      if (_output.contains('.')) {
        print('Decimal Already Used');
      } else {
        _output = _output + numb;
      }
    } else if (numb == '=') {
      num2 = double.parse(output);

      if (op == "+") {
        _output = (num1 + num2).toString();
      }
      if (op == "-") {
        _output = (num1 - num2).toString();
      }
      if (op == "*") {
        _output = (num1 * num2).toString();
      }
      if (op == "/") {
        _output = (num1 / num2).toString();
      }
      if (op == 'mod') {
        _output = (num1 % num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      op = '';
    } else {
      _output = _output + numb;
    }
    print(_output);

    setState(() {
      output = double.parse(_output).toString();
    });
  }

  numberButtons(numb) {
    return NeumorphicButton(
      onPressed: () {
        buttonPressed(numb);
      },
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.circle(),
      ),
      padding: const EdgeInsets.all(28.0),
      child: Text('$numb',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      theme: NeumorphicThemeData(),
      home: Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        appBar: NeumorphicAppBar(
          leading: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Image.asset('images/leading.png'),
          ),
          color: Colors.red[100],
          title: Container(
              child: Text('C A L C U L A T O R', textAlign: TextAlign.center)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Neumorphic(
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Container(
                          child: Text(
                            output,
                            textAlign: TextAlign.end,
                            style: TextStyle(fontSize: 28.0),
                          ),
                          height: 114.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Row(),
              SizedBox(
                height: 28.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [numberButtons('AC'), numberButtons('mod')],
              ),
              SizedBox(
                height: 14.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                numberButtons('1'),
                numberButtons('2'),
                numberButtons('3'),
                numberButtons('+')
              ]),
              SizedBox(
                height: 14.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                numberButtons('4'),
                numberButtons('5'),
                numberButtons('6'),
                numberButtons('-')
              ]),
              SizedBox(
                height: 14.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                numberButtons('7'),
                numberButtons('8'),
                numberButtons('9'),
                numberButtons('*')
              ]),
              SizedBox(
                height: 14.0,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                numberButtons('.'),
                numberButtons('0'),
                numberButtons('/'),
                numberButtons('=')
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
