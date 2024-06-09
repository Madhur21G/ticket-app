import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_project/Base/res/styles/app_styles.dart';
import 'package:ticket_project/Base/utils/all_json.dart';
import 'package:ticket_project/Base/widgets/ticket_view.dart';
import 'package:ticket_project/screens/search/widgets/app_ticket_tabs.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgcolor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const SizedBox(height: 40,),
          Text("Tickets", style: AppStyles.headLineStyle1,),
          const SizedBox(height: 20,),
          const AppTicketTabs(
            firstTab: "Upcoming",
            secondTab: "Previous",
          ),
          const SizedBox(height: 20,),
          Container(
              padding: const EdgeInsets.only(left: 16),
              child: TicketView(ticket: ticketList[0], isColor: true,)
          ),
        ],
      ),
    );
  }
}
