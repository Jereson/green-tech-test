import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:green_tech_app/views/widgets/app_bar.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Transaction Screen'),
      body: Center(
        child: Text('No Transaction yet'),
      ),
    );
  }
}
