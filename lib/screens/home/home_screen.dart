import 'dart:ui';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticket_project/Base/res/media.dart';
import 'package:ticket_project/Base/res/styles/app_styles.dart';
import 'package:ticket_project/Base/utils/all_json.dart';
import 'package:ticket_project/Base/utils/app_routes.dart';
import 'package:ticket_project/Base/widgets/app_double_text.dart';
import 'package:ticket_project/Base/widgets/ticket_view.dart';
import 'package:ticket_project/screens/home/widgets/hotel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgcolor,
      body: ListView(
        children: [
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good Morning", style: AppStyles.headLineStyle3),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Book Tickets", style: AppStyles.headLineStyle1),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage(AppMedia.logo)),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF4F6FD),
                  ),
                  child: const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      Text("Search")
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                AppDoubleText(
                    bigText: "Upcoming Flights", smallText: "View all",
                    func:  () => Navigator.pushNamed(context, AppRoutes.allTickets),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child: Row(
                      children: ticketList.take(2).map((singleTicket) => TicketView(ticket: singleTicket)
                      ).toList(),
                    )
                ),
                const SizedBox(height: 40),
                AppDoubleText(
                    bigText: "Hotels", smallText: "View all",
                    func:  (){

                    },
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                    child: Row(
                      children: hotelList.take(3).map((singleHotel) => Hotel(hotel: singleHotel)
                      ).toList(),
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}