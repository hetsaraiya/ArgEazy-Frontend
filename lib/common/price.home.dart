import 'models/ferm.dart';
import 'widget/ferm.dart';
import 'package:flutter/material.dart';


const List<Map<String, dynamic>> demoJson = [
  {"name": "Adani", "description": "View all the prices"},
  {"name": "Adani", "description": "View all the prices"},
  {"name": "Adani", "description": "View all the prices"},
  {"name": "Adani", "description": "View all the prices"},
  {"name": "Adani", "description": "View all the prices"},
];

class PricesPage extends StatefulWidget {
  const PricesPage({super.key});

  @override
  State<PricesPage> createState() => _PricesPageState();
}

class _PricesPageState extends State<PricesPage> {
  final List<PriceItem> items = demoJson.map((json) => PriceItem.fromJson(json)).toList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 50),
            ...items.map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: PriceItemWidget(item: item),
            )),
          ],
        ),
      ),
    );
  }
}