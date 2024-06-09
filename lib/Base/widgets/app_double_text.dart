import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ticket_project/Base/res/styles/app_styles.dart';
import 'package:ticket_project/Base/utils/app_routes.dart';
import 'package:ticket_project/screens/home/all_tickets.dart';

class AppDoubleText extends StatelessWidget {
  const AppDoubleText({super.key, required this.bigText, required this.smallText, required this.func});
  final String bigText;
  final String smallText;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(bigText, style:AppStyles.headLineStyle2),
        InkWell(
          onTap: func,
          child:Text(smallText, style:AppStyles.textStyle.copyWith(
            color: AppStyles.primaryColor
          )) ,
        )
      ],
    );
  }
}
