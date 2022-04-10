import 'dart:math';
import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:calendar_timeline/calendar_timeline.dart';


class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {


  List<DateTime>? _periodoViagem;

  DateTime? selectedDate;
  DateTime? _selectedDate;

  void _resetSelectedDate() {
    _selectedDate = DateTime(2022,05,17);
  }


  @override
  void initState() {
    _carregarPeriodoViagem();
    _resetSelectedDate();
    setState(() {
      selectedDate = DateTime(2022,05,17);
      _selectedDate = DateTime(2022,05,17);
    });
    super.initState();
  }

  void _carregarPeriodoViagem(){
    _periodoViagem = [
      DateTime(2022,05,17),
      DateTime(2022,05,18),
      DateTime(2022,05,19),
      DateTime(2022,05,20),
      DateTime(2022,05,21),
      DateTime(2022,05,22),
      DateTime(2022,05,23),
      DateTime(2022,05,24),
      DateTime(2022,05,25),
      DateTime(2022,05,26)

    ];
  }

  bool _isExpanded = false;


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CalendarTimeline(
              showYears: false,
              initialDate: _selectedDate!,
              firstDate: DateTime(2022,05,17),
              lastDate: DateTime(2022,05,26),
              onDateSelected: (date) {
                setState(() {
                  _selectedDate = date;
                });
              },
              leftMargin: 20,
              monthColor: Colors.teal[200],
              dayColor: Colors.teal[200],
              dayNameColor: Color(0xFF333A47),
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'en',
            ),
            Card(
              margin: EdgeInsets.only(top: 5,bottom: 5),
              color: Color(0xfffafafa),
              elevation: 5,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("USD 14,86",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
                    Text("BRL 60,00",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black54),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5),
            Center(child: Text('Selected date is $_selectedDate', style: TextStyle(color: Colors.red))),
            Card(
              color: Colors.green,
              elevation: 10,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: EdgeInsets.only(
                    top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
                child: ExpansionTile(
                  onExpansionChanged: (status){
                    setState(() {
                      _isExpanded = status;
                    });
                  },
                  trailing:
                  FaIcon(
                    _isExpanded?FontAwesomeIcons.angleUp:
                    FontAwesomeIcons.angleDown,
                    color: Colors.white,
                  ),
                  title: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(right: 30),
                            child: FaIcon(FontAwesomeIcons.utensils,color: Colors.white,),
                          ),
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Alimentação",style: TextStyle(color: Colors.white),),
                              Text("USD 14,86",style: TextStyle(color: Colors.white)),
                            ],
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 30),
                            child: FaIcon(FontAwesomeIcons.piggyBank,size: 15,color: Colors.white),
                          ),
                          Text("USD 15,00 Disponível",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                          Text(" (50%)",style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ],
                  ),
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 70,top: 10,bottom: 10),
                          child: Text("Coca Cola",style: TextStyle(color: Colors.white),)
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 55,top: 10,bottom: 10),
                          child: Text("USD 6,86",style: TextStyle(color: Colors.white))
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 70,top: 10,bottom: 10),
                            child: Text("Lanche",style: TextStyle(color: Colors.white),)
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 55,top: 10,bottom: 10),
                            child: Text("USD 8,00",style: TextStyle(color: Colors.white))
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
