import 'dart:convert';

import 'package:babuapk/pages/my_ticket_page.dart';
import 'package:babuapk/utils/txt_style.dart';
import 'package:flutter/material.dart';
import 'package:babuapk/models/ticket_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../utils/helper_function.dart';

class TicketPage extends StatefulWidget {
  static const String routeName = '/';
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
        leading: Icon(Icons.arrow_back),
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
                            elevation: 5,
                            // child: Text(snapshot.data!.count.toString()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Color(0xff4DB84D), width: 2),
                                    bottom: BorderSide(
                                        color: Color(0xffFF0000), width: 2),
                                    left: BorderSide(
                                        color: Color(0xffFE9738), width: 2),
                                    right: BorderSide(
                                        color: Color(0xff00AEEF), width: 2),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
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
                                              backgroundColor:
                                                  Color(0xff95e3fb),
                                              child: Image.asset(
                                                'images/logo.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                      'This is your Entry Ticket',
                                                      style: txtH1),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Order ID: ${snapshot.data!.items![index].pk.toString()}',
                                                    style: txtH2,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Ticket Price: ${snapshot.data!.items![index].total.toString()}',
                                                    style: txtH3,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        30),
                                                            backgroundColor:
                                                                Color(
                                                                    0xffff8c1a)),
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                        context,
                                                        MyTicketPage.routeName,
                                                        arguments: snapshot
                                                            .data!
                                                            .items![index],
                                                      );
                                                    },
                                                    child: Text(
                                                      'Active',
                                                      style: txtBtn,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            CircleAvatar(
                                              radius: 24,
                                              backgroundColor:
                                                  Color(0xffff526c),
                                              child: Image.asset(
                                                'images/icon.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Purchase Date ${snapshot.data!.items![index].sellDate.toString()}',
                                            style: txtH4,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Details',
                                                style: TextStyle(
                                                    color: Color(0xffF7931E)),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                    color: Color(0xffF7931E),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Icon(
                                                  size: 20,
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
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
