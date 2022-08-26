// import 'package:flutter/material.dart';
// import 'package:swipeapp/Controller/AddAccount.dart';
// import 'package:swipeapp/Controller/AddNewPlan.dart';
// import 'package:swipeapp/Controller/Dashboard.dart';
// import 'package:swipeapp/Controller/PlanAccount.dart';
// import 'package:swipeapp/Controller/Spend.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,
//       home: navbar(),
//
//     );
//   }
// }
//
// class navbar extends StatefulWidget {
//   const navbar({Key? key}) : super(key: key);
//
//   @override
//   _MyPageState createState() => _MyPageState();
//
// }
//
// class _MyPageState extends State<navbar> {
//   late List<Widget> _pages;
//   late Widget _page1;
//   late Widget _page2;
//   late Widget _page3;
//   late Widget _page4;
//   late Widget _currentPage;
//   late TabController _tabController;
//   int _selectedScreenIndex = 0;
//   // final List _screens = [
//   //   {"screen": const Dashboard(), },
//   //   {"screen": const Spend(), },
//   //   {"screen": const PlanAccount(), },
//   //   {"screen": const AddAccount(), },
//   // ];
//
//   void _selectScreen(int index) {
//     setState(() {
//       _selectedScreenIndex = index;
//       _currentPage = _pages[index];
//
//     });
//   }
//   @override
//   void initState() {
//     super.initState();
//     _page1 = const Dashboard();
//     _page2 = const Spend();
//     _page3 = const PlanAccount();
//     _page4 = AddAccount(changePage: _selectedScreenIndex);
//     _pages = [_page1, _page2, _page3,_page4];
//     _selectedScreenIndex = 0;
//     _currentPage = _page1;
//
//   }
//
//   void _handleTabSelection() {
//     setState(() {
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//         //  backgroundColor: const Color(0xffECDCFF)
//
//       body:  _currentPage,//_screens[_selectedScreenIndex]["screen"],
//       // bottomNavigationBar: BottomNavigationBar(
//       //   backgroundColor: Colors.yellowAccent,
//       //   showSelectedLabels: false, showUnselectedLabels: false,
//       //   currentIndex: _selectedScreenIndex,
//       //   onTap: _selectScreen,
//       //  // fixedColor:   _tabController.index == 0? Colors.black: Colors.grey),
//       // //  backgroundColor: Colors.yellow,
//       //   items: const [
//       //     BottomNavigationBarItem(icon: Icon(Icons.home_work,
//       //       ), label: "Home"),
//       //     BottomNavigationBarItem(icon: Icon(Icons.monitor_heart_rounded,), label: "Spend"),
//       //     BottomNavigationBarItem(icon: Icon(Icons.party_mode_rounded,), label: 'Plan'),
//       //     BottomNavigationBarItem(icon: Icon(Icons.person,), label: 'Profile'),
//       //
//       //   ],
//       // ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedScreenIndex,
//         onTap: _selectScreen,
//         unselectedItemColor: Colors.grey,
//         selectedItemColor:   Color(0xFFA781D3),
//         showUnselectedLabels: true,
//         items: [
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(Icons.monitor_heart),
//             label: 'Spend',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(Icons.pages_sharp),
//             label: 'Plan',
//           ),
//           BottomNavigationBarItem(
//             backgroundColor: Colors.white,
//             icon: Icon(Icons.person_pin_rounded),
//             label: 'Profile',
//           )
//
//         ],
//       ),
//       drawer: Drawer(
//         child: Container(
//           margin: const EdgeInsets.only(top: 20.0),
//           child: Column(
//             children: <Widget>[
//               _navigationItemListTitle(page1, 0),
//               _navigationItemListTitle(page2, 1),
//               _navigationItemListTitle(page3, 2),
//               _navigationItemListTitle(page4, 2),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// Widget _navigationItemListTitle(String title, int index) {
//   return ListTile(
//     title: Text(
//       '$title Page',
//       style: TextStyle(color: Colors.blue[400], fontSize: 22.0),
//     ),
//     onTap: () {
//       Navigator.pop(context);
//       _changeTab(index);
//     },
//   );
// }
// }