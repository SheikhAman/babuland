import 'dart:convert';

import 'package:babuapk/models/info_model.dart';
import 'package:babuapk/utils/constants.dart';
import 'package:babuapk/utils/custom_line.dart';
import 'package:babuapk/utils/txt_style.dart';
import 'package:babuapk/widgets/custom_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/info_model.dart';
import 'package:gradient_borders/gradient_borders.dart';
import '../models/ticket_model.dart' as ticket;

class MyTicketPage extends StatefulWidget {
  static const String routeName = '/my_ticket';

  const MyTicketPage({super.key});

  @override
  State<MyTicketPage> createState() => _MyTicketPageState();
}

class _MyTicketPageState extends State<MyTicketPage> {
  ticket.Item? args;
  @override
  void didChangeDependencies() {
    args = ModalRoute.of(context)!.settings.arguments as ticket.Item;
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  InfoModel infoModel = InfoModel();
  Future<InfoModel> getMyTicketApi() async {
    final response = await http.get(
        Uri.parse('http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt'),
        headers: {'ORDER_ID': args!.pk.toString()});
    var data = jsonDecode(response.body);
    print(data);

    if (response.statusCode == 200) {
      InfoModel infoModel = InfoModel.fromJson(data);
      print(infoModel.items!.length);
      print(infoModel);
      return infoModel;
    } else {
      return infoModel;
    }
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xffF7931E),
            )),
        centerTitle: true,
        title: const Text(
          'My Tickets',
          style: TextStyle(color: Color(0xffF7931E)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: getMyTicketApi(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Container(
                    height: size.height * 0.55,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color(0xfffff1de),
                          ]),
                    ),
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),

                          ///TicketWidget
                          child: TicketWidget(
                            width: double.infinity,
                            height: size.height / 3.5,
                            area: 120,

                            ///move round left/right
                            curveSize: 18,

                            ///increase decrease round shape size
                            child: Container(
                              decoration:
                                  BoxDecoration(color: Color(0xfff7eca6)),
                              width: double.infinity,
                              height: size.height / 3.5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xff4DB84D), width: 3),
                                      left: BorderSide(
                                          color: Color(0xfff7931e), width: 3),
                                      right: BorderSide(
                                          color: Color(0xff00AEEF), width: 3),
                                      bottom: BorderSide(
                                          color: Color(0xfff00d79), width: 3),
                                    ),
                                  ),

                                  ///Changes
                                  child: Stack(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15,
                                                  top: 8,
                                                  bottom: 8),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                      'images/logo.png'),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Text(
                                                    'Uttara',
                                                    style: txt15Black,
                                                  ),
                                                  CustomLiene(),
                                                  Text(
                                                    'Wari',
                                                    style: txt15Black,
                                                  ),
                                                  CustomLiene(),
                                                  Text(
                                                    'Badda',
                                                    style: txt15Black,
                                                  ),
                                                  CustomLiene(),
                                                  Text(
                                                    'Mirpur',
                                                    style: txt15Black,
                                                  ),
                                                  CustomLiene(),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0,
                                                  right: 15,
                                                  top: 8,
                                                  bottom: 8),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'Child Ticket',
                                                    style: txtMid,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    'SL NO: ${snapshot.data!.items![0].tslmsFk}',
                                                    style: txt15grey,
                                                  ),
                                                  SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    'Quantity: ${snapshot.data!.items![0].qty}',
                                                    style: txt17red,
                                                  ),
                                                  ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor:
                                                            Color(0xff5eb646),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))),
                                                    onPressed: () {},
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 8.0),
                                                      child: Text(
                                                          'Price: ${snapshot.data!.items![0].mrp}$takaSymbol'),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),

                                      ///Changes
                                      Positioned.fill(
                                        right: 100,
                                        child: Column(
                                          children: List.generate(15, (index) {
                                            return Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Container(
                                                  height: 10,
                                                  width: 4,
                                                  color: Color(0XFFf2f2f2),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // end part
                  Expanded(
                    child: Container(
                      color: Color(0xffffffff),
                      height: size.height * 0.5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 3,
                          ),
                          Container(
                            height: 4,
                            width: size.width / 3,
                            decoration: BoxDecoration(
                              color: Color(0xfff7931e),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10),
                                right: Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Scan QR code to avail ticket',
                            style: txtLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order ID',
                                        style: txt15grey,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        snapshot.data!.items![0].pk.toString(),
                                        style: txt16Orange,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Ticket Purchase Date',
                                        style: txt15grey,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        args!.sellDate.toString(),
                                        style: txt16Orange,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Ticket Expire Date',
                                        style: txt15grey,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'None',
                                        style: txt16Orange,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        'Ticket Price',
                                        style: txt15grey,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${snapshot.data!.items![0].mrp}$takaSymbol',
                                        style: txt16Orange,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Image.asset(
                                    'images/qr.png',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 4,
                            width: size.width / 2,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10),
                                right: Radius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          }),
    );
  }
}
