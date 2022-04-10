import 'package:flutter/material.dart';
import 'package:trip_organizer/screens/Calendar.dart';
import 'package:trip_organizer/screens/Extract.dart';
import 'package:trip_organizer/screens/Settings.dart';
import 'package:trip_organizer/screens/Statistics.dart';
import 'package:trip_organizer/screens/Trips.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0; // Variável para controlar o índice das telas

  final List<Widget> _telas = [
    Calendar(),
    Extract(),
    Statistics(),
    Trips(),
    Settings()
  ];

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfffafafa),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Minha Viagem",style: TextStyle(color: Colors.black),),
            FaIcon(FontAwesomeIcons.solidCalendarDays,color: Colors.black,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: FaIcon(FontAwesomeIcons.plus,),
        onPressed: () { },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: const TextStyle(color: Colors.red),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black26,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: const [
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.calendar,),
              label: "Calendário",
              activeIcon: FaIcon(FontAwesomeIcons.solidCalendar),
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.listUl),
              label: "Timeline"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.chartColumn),
              label: "Estatísticas"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.suitcase),
              label: "Viagens"
          ),
          BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gear),
              label: "Configurações"
          ),
        ],
      ),

    );
  }
}

