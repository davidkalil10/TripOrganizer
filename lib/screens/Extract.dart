import 'package:flutter/material.dart';

class Extract extends StatefulWidget {
  const Extract({Key? key}) : super(key: key);

  @override
  State<Extract> createState() => _ExtractState();
}

class _ExtractState extends State<Extract> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Tela Extrato"),
        ),
      ),
    );
  }
}
