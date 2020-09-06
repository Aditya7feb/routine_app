import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/subject.dart';
import '../models/items.dart';
import '../widgets/itemtile.dart';

class WeekDayScreen extends StatefulWidget {
  static const routeName = '/week-day-screen';

  @override
  _WeekDayScreenState createState() => _WeekDayScreenState();
}

class _WeekDayScreenState extends State<WeekDayScreen> {
  final List<String> weekDays = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  int currentTab = 0;
  bool isEmpty;
  String currentDay;
  @override
  Widget build(BuildContext context) {



    

     currentDay = ModalRoute.of(context).settings.arguments;
    currentTab = weekDays.indexWhere((element) => element == currentDay);
    List<Item> currentElements =
        Provider.of<Items>(context).getDayItems(currentDay);
     isEmpty=currentElements.isEmpty;
    
    void changeCurrentDay(int index){
      setState(() {
        
      currentDay=weekDays[index];
      currentElements =
        Provider.of<Items>(context,listen: false).getDayItems(currentDay);
        isEmpty=currentElements.isEmpty;
        print(isEmpty);
         print(currentTab);
              print(currentDay);
      });
    }

    void switchEmpty(){
      setState(() {
        
      isEmpty?isEmpty=false:isEmpty=true;
      });
    }

    return DefaultTabController(
     // initialIndex: currentTab,
      length: weekDays.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Timetable', style: GoogleFonts.zillaSlab()),
          backgroundColor: Color.fromRGBO(0, 01, 19, 1),
          centerTitle: true,
          bottom: TabBar(
            onTap: (index) {
             
              currentTab = index;
              changeCurrentDay(index);
              //switchEmpty();
                print(isEmpty);
              
             
            },
            isScrollable: true,
            tabs: [
              Text(weekDays[0]),
              Text(weekDays[1]),
              Text(weekDays[2]),
              Text(weekDays[3]),
              Text(weekDays[4]),
              Text(weekDays[5]),
            ],
          ),
        ),
        body: isEmpty? Center(child:Text('empty day')): Center(
          child:Text('nino')
        )
        // ListView.builder(
        //   itemBuilder: (ctx, i) {
        //     return ItemTile();
        //   },
        //   itemCount: currentElements.length,
        // ),
      ),
    );
  }
}
