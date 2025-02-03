import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_project/Base/res/media.dart';
import 'package:ticket_project/Base/res/styles/app_styles.dart';
import 'package:ticket_project/Base/utils/all_json.dart';
import 'package:ticket_project/Base/widgets/app_column_text_layout.dart';
import 'package:ticket_project/Base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_project/Base/widgets/ticket_positioned_circle.dart';
import 'package:ticket_project/Base/widgets/ticket_view.dart';
import 'package:ticket_project/screens/search/widgets/app_ticket_tabs.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {

  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      print("Passed Index ${args["index"]}");
      ticketIndex = args["index"];
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgcolor,
      appBar: AppBar(
        title: Text("Tickets"),
        backgroundColor: AppStyles.bgcolor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              // const SizedBox(height: 40,),
              // Text("Tickets", style: AppStyles.headLineStyle1,),
              // const SizedBox(height: 20,),
              const AppTicketTabs(
                firstTab: "Upcoming",
                secondTab: "Previous",
              ),
              const SizedBox(height: 20,),
              // White and Black Ticket
              Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TicketView(ticket: ticketList[ticketIndex], isColor: true,)
              ),
              const SizedBox(height: 1,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                color: AppStyles.ticketWhite,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "Flutter DB",
                          bottomText: "Passenger",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "5221 36869",
                          bottomText: "Passport",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const AppLayoutbuilderWidget(randomDivider: 15, width: 15, isColor: false,),
                    const SizedBox(height: 20,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "2465 658494046865",
                          bottomText: "Number of E-Ticket",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "B46859",
                          bottomText: "Booking Code",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const AppLayoutbuilderWidget(randomDivider: 15, width: 15, isColor: false,),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                             Row(
                               children: [
                                 Image.asset(AppMedia.visaCard, scale: 11,),
                                 Text(" *** 2462", style: AppStyles.headLineStyle3,)
                               ],
                             ),
                            const SizedBox(height: 5,),
                            Text("Payment Method", style: AppStyles.headLineStyle4,)
                          ],
                        ),
                        const AppColumnTextLayout(
                          topText: "\$299.99",
                          bottomText: "Price",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 1,),
              // Bottom of the ticket detail section
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: AppStyles.ticketWhite,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(21),
                    bottomLeft: Radius.circular(21)
                  )
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BarcodeWidget(
                      height: 75,
                      barcode: Barcode.code128(),
                      data: 'https://www.codeforces.com',
                      drawText: false,
                      color: AppStyles.textColor,
                      width: double.infinity,
                    )
                  ),
                ),
              ),
              SizedBox(height: 20,),
              // Colourful Ticket
              Container(
                  padding: const EdgeInsets.only(left: 16),
                  child: TicketView(ticket: ticketList[ticketIndex],)
              ),
            ],
          ),
          TicketPositionedCircle(pos: true,),
          TicketPositionedCircle(pos: null,),
        ],
      ),
    );
  }
}
