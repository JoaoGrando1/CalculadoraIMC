import 'package:flutter/material.dart';

void main() {
  runApp(CalculadoraIMC());
}

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CALCULADORA IMC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.blue,
          primarySwatch: Colors.blue,
        ),
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
  double _peso = 0;
  double _altura = 0;

  double _result = 0;

  String _tabela = '';

  void _calcularIMC() {
    setState(() {
      _result = (_peso / (_altura * _altura)) * 10000;

      if (_result < 18.5) {
        _tabela = 'Baixo Peso';
      } else if (_result > 40 && _result < 44.9) {
        _tabela = 'Peso Normal.';
      } else if (_result > 45 && _result < 49.9) {
        _tabela = 'Sobrepeso';
      } else if (_result > 50 && _result < 54.9) {
        _tabela = 'Obesidade grau 1.';
      } else if (_result > 55 && _result < 59.9) {
        _tabela = 'Obesidade grau 2. ';
      } else {
        _tabela = 'Cuidado';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calcule seu IMC',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (Kg):'),
              onChanged: (value) {
                _peso = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 30.0),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (cm):'),
              onChanged: (value) {
                _altura = double.tryParse(value) ?? 0;
              },
            ),
            SizedBox(height: 30.0),
            ElevatedButton(
              onPressed: _calcularIMC,
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 2.0),
            Text(
              'Resultado: ${_result.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              _tabela,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
