import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketlist/components/header_custom.dart';
import 'package:marketlist/components/list_item.dart';
import 'package:marketlist/controllers/market_controller.dart';
import 'package:marketlist/models/product.dart';

class Home extends StatelessWidget {
  final TextEditingController _textController = new TextEditingController();
  final marketController = new MarketController();

  Home() {
    this.marketController.getProducts();
  }

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
                        Observer(builder: (_) {
                          return Text(
                            '${marketController.products.length ?? 0} ',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w300,
                            ),
                          );
                        }),
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
                        Observer(builder: (_) {
                          return Text(
                            '${this.marketController.checkedCount}',
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w300,
                            ),
                          );
                        }),
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
                child: Observer(
                  builder: (_) {
                    return ListView.builder(
                      itemCount: marketController.products.length + 1,
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
                                    controller: this._textController,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (this._textController.text != '') {
                                      FocusScope.of(context).requestFocus(
                                        FocusNode(),
                                      );
                                      String name = this._textController.text;
                                      marketController.saveProduct(name);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20.0,
                                    ),
                                    child: Icon(
                                      Icons.save,
                                      size: 28.0,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                        Product item =
                            this.marketController.products[index - 1];
                        return ListItem(
                          index: index - 1,
                          title: item.getName(),
                          checked: item.getStatus(),
                          marketController: this.marketController,
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
