import 'package:flutter/material.dart';
import 'package:marketlist/components/header_custom.dart';
import 'package:marketlist/components/list_item.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List elements = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              HeaderCustom(),
              Container(
                margin: const EdgeInsets.only(bottom: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Added',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          'Bought',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: this.elements.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 15.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Product name',
                                ),
                                style: TextStyle(
                                  fontSize: 21.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: Icon(
                                Icons.save,
                                size: 28.0,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListItem(
                      index: index,
                      title: 'Product',
                      checked: (index / 2 == 1) ? false : true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
