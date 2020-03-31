import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HeaderCustom extends StatelessWidget {
  final String weekday = DateFormat('EEEE').format(DateTime.now());
  final String dayMonth = DateFormat('d MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            weekday,
            style: TextStyle(
              fontSize: 33.0,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            ', $dayMonth',
            style: TextStyle(
              fontSize: 33.0,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
