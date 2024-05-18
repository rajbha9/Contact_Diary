import 'package:flutter/material.dart';

class Call_Log_Details extends StatefulWidget {
  const Call_Log_Details({super.key});

  @override
  State<Call_Log_Details> createState() => _Call_Log_DetailsState();
}

class _Call_Log_DetailsState extends State<Call_Log_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Call log Details"),
      ),
      body: Center(
          child: Text(
            "No Call logs",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          )),
    );
  }
}
