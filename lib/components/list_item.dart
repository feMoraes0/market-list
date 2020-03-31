import 'package:flutter/material.dart';
import 'package:marketlist/controllers/market_controller.dart';

class ListItem extends StatelessWidget {
  final int index;
  final String title;
  final bool checked;
  final MarketController marketController;

  ListItem({
    Key key,
    this.index,
    this.title,
    this.checked,
    this.marketController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ListTile(
        leading: GestureDetector(
          onTap: () {
            this.marketController.markProduct(index);
          },
          child: Icon(
            (this.checked)
                ? Icons.check_circle_outline
                : Icons.radio_button_unchecked,
            size: 28.0,
            color: (this.checked) ? Colors.greenAccent : Colors.black87,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 21.0,
            color: (this.checked) ? Colors.grey[600] : Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        trailing: Icon(
          Icons.delete_outline,
          size: 28.0,
          color: (this.checked) ? Colors.black54 : Colors.black87,
        ),
      ),
    );
  }
}
