import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:intl/intl.dart';

class ItemBottomSheet extends StatefulWidget {
  @override
  _ItemBottomSheetState createState() => _ItemBottomSheetState();
}

class _ItemBottomSheetState extends State<ItemBottomSheet> {
  

  TimeOfDay _time = TimeOfDay.now();
  TimeOfDay _time2 = TimeOfDay.now();
  DateTime _startTime = DateTime.now();
  String _startTimeString = '';
  DateTime _endTime = DateTime.now();
  String _endTimeString = '';

  

  void getStartTime(DateTime time) {
    setState(() {
      _startTime = time;
      _startTimeString = DateFormat.jm().format(_startTime);
    });
  }

  void onTimeChanged(TimeOfDay newtime) {
    setState(() {
      _time = newtime;
    });
  }

  void onEndTimeChanged(TimeOfDay newtime) {
    setState(() {
      _time2 = newtime;
    });
  }

  void getEndTime(DateTime time2) {
    setState(() {
      _endTime = time2;
      _endTimeString = DateFormat.jm().format(_endTime);
    });
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: device.height * 0.015),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Add To Timetable',
                style: GoogleFonts.arvo(
                  fontSize: 20,
                  wordSpacing: 3,
                ),
              ),
              FloatingActionButton(
                elevation: 5,
                onPressed: () {},
                child: Icon(Icons.check),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Class',
                style: GoogleFonts.roboto(fontSize: 20),
              )
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Starts At',
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    showPicker(
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        is24HrFormat: false,
                        onChangeDateTime: (DateTime time) {
                          getStartTime(time);
                        }),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey)),
                  width: device.width * 0.5,
                  child: Text(
                    '$_startTimeString',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                'Ends At',
                style: GoogleFonts.roboto(fontSize: 20),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    showPicker(
                        context: context,
                        value: _time2,
                        onChange: onEndTimeChanged,
                        is24HrFormat: false,
                        onChangeDateTime: (DateTime time) {
                          getEndTime(time);
                        }),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: Colors.grey)),
                  width: device.width * 0.5,
                  child: Text(
                    '$_endTimeString',
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}