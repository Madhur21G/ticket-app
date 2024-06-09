import 'package:flutter/material.dart';
import 'package:ticket_project/Base/bottom_nav_bar.dart';
import 'package:ticket_project/Base/utils/app_routes.dart';
import 'package:ticket_project/screens/home/all_tickets.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        AppRoutes.homePage:(context) => const BottomNavBar(),
        AppRoutes.allTickets:(context) => const AllTickets()
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.transparent, // Set the background color to transparent
//           elevation: 0, // Remove the shadow
//           iconTheme: IconThemeData(color: Colors.black), // Customize the icon color if needed
//           titleTextStyle: TextStyle(color: Colors.black, fontSize: 20), // Customize the title text style if needed
//         ),
//       ),
//       home: BottomNavBar(),
//     );
//   }
// }
