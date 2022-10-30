import 'dart:convert';

import 'package:babuapk/utils/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:babuapk/models/ticket_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../utils/helper_function.dart';

class TicketPage extends StatefulWidget {
  const TicketPage({super.key});

  @override
  State<TicketPage> createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  TicketModel ticketModel = TicketModel();

  Future<TicketModel> getTicketApi() async {
    final response = await http.get(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms'),
        headers: {'MOBILE_NUMBER': '01717956094'});
    var data = jsonDecode(response.body);
    print(data);

    if (response.statusCode == 200) {
      TicketModel ticketModel = TicketModel.fromJson(data);
      print(ticketModel.items!.length);
      return ticketModel;
    } else {
      return ticketModel;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    getTicketApi();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Tickets'),
        backgroundColor: const Color(0xffff8c1a),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getTicketApi(),
              builder: (context, AsyncSnapshot<TicketModel> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text('Loading'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.items!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: size.height / 3.5,
                          width: double.infinity,
                          child: Card(
                            // child: Text(snapshot.data!.count.toString()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        CircleAvatar(
                                          radius: 27,
                                          backgroundColor: Color(0xff95e3fb),
                                          child: Image.asset(
                                            'images/logo.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text('This is your Entry Ticket',
                                                  style: txtH1),
                                              Text(
                                                'Order ID: ${snapshot.data!.items![index].pk.toString()}',
                                                style: txtH2,
                                              ),
                                              Text(
                                                'Ticket Price: ${snapshot.data!.items![index].total.toString()}',
                                                style: txtH3,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 30),
                                                    backgroundColor:
                                                        Color(0xffff8c1a)),
                                                onPressed: () {},
                                                child: Text('Active'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 24,
                                          backgroundColor: Color(0xffff526c),
                                          child: Image.asset(
                                            'images/icon.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Purchase ',
                                        style: txtH4,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
