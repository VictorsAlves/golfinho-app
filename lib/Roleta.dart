import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class CassinoScreen extends StatefulWidget {
  @override
  _CassinoScreenState createState() => _CassinoScreenState();
}

class _CassinoScreenState extends State<CassinoScreen> {
  final List<String> _frutas = ['🍒', '🍇', '🍋', '🍊', '🍎', '🍉', '🍓', '🍍'];
  late String _resultado1;
  late String _resultado2;
  late String _resultado3;
  late bool _rodando;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _resultado1 = _frutas[0];
    _resultado2 = _frutas[1];
    _resultado3 = _frutas[2];
    _rodando = false;
  }

  void _iniciarJogo() {
    setState(() {
      _rodando = true;
      _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
        setState(() {
          _resultado1 = _frutas[Random().nextInt(_frutas.length)];
          _resultado2 = _frutas[Random().nextInt(_frutas.length)];
          _resultado3 = _frutas[Random().nextInt(_frutas.length)];
        });
      });
      Timer(Duration(seconds: 2), () {
        _pararJogo();
      });
    });
  }

  void _pararJogo() {
    setState(() {
      _rodando = false;
      _timer.cancel();
      _verificarGanhador();
    });
  }

  void _verificarGanhador() {
    if (_resultado1 == _resultado2 && _resultado2 == _resultado3) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Você ganhou!'),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Você perdeu! Tente novamente.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Golfinho'),
      ),
      body: Center(
          child: Container(
        color: Colors.white70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dolphin.png',
              height: 100,
              width: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  _resultado1,
                  style: const TextStyle(fontSize: 50),
                ),
                Text(
                  _resultado2,
                  style: const TextStyle(fontSize: 50),
                ),
                Text(
                  _resultado3,
                  style: const TextStyle(fontSize: 50),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _rodando ? null : _iniciarJogo,
              child: Text('Girar'),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
