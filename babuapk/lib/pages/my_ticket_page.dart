import 'dart:convert';

import 'package:babuapk/models/info_model.dart';
import 'package:babuapk/utils/constants.dart';
import 'package:babuapk/utils/txt_style.dart';
import 'package:babuapk/widgets/custom_ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/info_model.dart';
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
              Icons.arrow_back,
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
                    child: Column(
                      children: [
                        TicketWidget(
                            width: double.infinity,
                            height: 200,
                            child: Text('d'),
                            area: 20,
                            curveSize: 20),
                      ],
                    ),
                    height: size.height * 0.55,
                    decoration: BoxDecoration(color: Color(0xfffff1de)),
                  ),
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
                                        style: txt16grey,
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
                                        style: txt16grey,
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
                                        style: txt16grey,
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
                                        style: txt16grey,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        snapshot.data!.items![0].tp.toString() +
                                            dollarSymbol,
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
