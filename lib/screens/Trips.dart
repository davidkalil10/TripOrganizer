import 'package:flutter/material.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  State<Trips> createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text("Tela Viagens"),
        ),
      ),
    );
  }
}
