import 'package:babuapk/pages/my_ticket_page.dart';
import 'package:flutter/material.dart';

import 'pages/ticket_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: TicketPage.routeName,
      routes: {
        TicketPage.routeName: (context) => TicketPage(),
        MyTicketPage.routeName: (context) => MyTicketPage()
      },
    );
  }
}
