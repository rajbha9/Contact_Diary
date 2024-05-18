import 'package:contact_diary/providar_data.dart';
import 'package:contact_diary/screen/call_log.dart';
import 'package:contact_diary/screen/detail_page.dart';
import 'package:contact_diary/screen/hide_page.dart';
import 'package:contact_diary/screen/homepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NewApp());
}

class NewApp extends StatelessWidget {
  const NewApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Providar_Data(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: (Provider.of<Providar_Data>(context).themedata)
            ? ThemeData.dark(useMaterial3: true)
            : ThemeData.light(useMaterial3: true),
        routes: {
          '/': (context) => Homapage(),
          'detail': (context) => DetailPage(),
          'hide':(context) => HidePage(),
          'calllog':(context) => Call_Log_Details()
        },
      ),
    );
  }
}
