import 'package:flutter/material.dart';
import '../../size.dart';
import '../models/ferm.dart';

class PriceItemWidget extends StatelessWidget {
  final PriceItem item;

  const PriceItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: h(100, context),
        width: w(350, context),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            SizedBox(width: w(10, context)),
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