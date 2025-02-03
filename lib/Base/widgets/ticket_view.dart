import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ticket_project/Base/res/styles/app_styles.dart';
import 'package:ticket_project/Base/utils/all_json.dart';
import 'package:ticket_project/Base/widgets/app_column_text_layout.dart';
import 'package:ticket_project/Base/widgets/app_layoutbuilder_widget.dart';
import 'package:ticket_project/Base/widgets/big_circle.dart';
import 'package:ticket_project/Base/widgets/big_dot.dart';
import 'package:ticket_project/Base/widgets/text_style_fourth.dart';
import 'package:ticket_project/Base/widgets/text_style_third.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool wholeScreen;
  final bool? isColor;
  const TicketView({super.key, required this.ticket, this.wholeScreen = false, this.isColor });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      height: 180,
      child: Container(
        margin: EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null ? AppStyles.ticketBlue : AppStyles.ticketWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular((21)),
                      topRight: Radius.circular(21))),
              child: Column(
                children: [
                  // show departure and destination with icons first line
                  Row(
                    children: [
                      TextStyleThird(
                        text: ticket["from"]["code"], isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      BigDot(isColor: isColor,),
                      Expanded(
                          child: Stack(
                        children: [
                          const SizedBox(
                            height: 24,
                            child: AppLayoutbuilderWidget(
                              randomDivider: 6,
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                                angle: 1.57,
                                child: Icon(
                                  Icons.local_airport_rounded,
                                  color: isColor == null ? Colors.white : AppStyles.planesecondColor,
                                )),
                          )
                        ],
                      )),
                      BigDot(isColor: isColor,),
                      Expanded(child: Container()),
                      TextStyleThird(
                        text: ticket["to"]["code"],
                        isColor: isColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  // show departure and destinations name with time
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["from"]["name"],
                          isColor: isColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      TextStyleFourth(
                        text: ticket["flying_time"],
                        isColor: isColor,
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 100,
                        child: TextStyleFourth(
                          text: ticket["to"]["name"],
                          align: TextAlign.end,
                          isColor: isColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              // height: 20,
              color: isColor == null ? AppStyles.ticketOrange : AppStyles.ticketWhite,
              child: Row(
                children: [
                  BigCircle(
                      isRight: false,
                      isColor : isColor,
                  ),
                  Expanded(
                      child: AppLayoutbuilderWidget(
                    randomDivider: 16,
                    width: 6,
                        isColor: isColor,
                  )),
                  BigCircle(
                      isRight: true,
                      isColor: isColor,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: isColor == null ? AppStyles.ticketOrange : AppStyles.ticketWhite,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular((isColor == null ? 21 : 0)),
                      bottomRight: Radius.circular(isColor == null ? 21 : 0))),
              child: Column(
                children: [
                  // show departure and destination with icons first line
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnTextLayout(
                        topText: ticket["date"],
                        bottomText: "Date",
                        alignment: CrossAxisAlignment.start,
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        topText: ticket["departure_time"],
                        bottomText: "Departure Time",
                        alignment: CrossAxisAlignment.center,
                        isColor: isColor,
                      ),
                      AppColumnTextLayout(
                        topText: ticket["number"].toString(),
                        bottomText: "Number",
                        alignment: CrossAxisAlignment.end,
                        isColor: isColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
