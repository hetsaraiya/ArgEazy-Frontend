import 'package:flutter/material.dart';
import '../models/ferm.dart';

class PriceItemWidget extends StatelessWidget {
  final PriceItem item;

  const PriceItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 350,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Text(item.name),
            const Spacer(),
            Text(item.description),
            const Spacer(),
            const Icon(Icons.navigate_next_sharp),
          ],
        ),
      ),
    );
  }
}