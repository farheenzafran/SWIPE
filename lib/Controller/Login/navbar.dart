//
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeapp/Controller/Account/AddAccount1.dart';
import 'package:swipeapp/Controller/Account/AddAccountSuccessful3.dart';
import 'package:swipeapp/Controller/Plan/AddNewPlan2.dart';
import 'package:swipeapp/Controller/Dashboard.dart';
import 'package:swipeapp/Controller/Account/ManageAccount2.dart';
import 'package:swipeapp/Controller/Plan/PlanAccount1.dart';
import 'package:swipeapp/Controller/Spend/Spend.dart';
// const Dashboard(),
// const  Spend(),
// const  PlanAccount(),
// const  AddAccount()
import 'package:flutter/material.dart';

import '../PlaidData/Chart.dart';

class  navbar extends StatefulWidget {
  @override
  _navState createState() => _navState();
}

class _navState extends State<navbar> {
  late int _currentIndex;
  late List<Widget> _children;
  @override
  void initState() {
    _currentIndex = 0;
    _children = [
       Dashboard(),
        Spend(text: '', text2: 0,),
        PlanAccount1(),
        AddAccount1()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          activeColor: Color(0xFFA781D3),
          inactiveColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
              backgroundColor:  const Color(0xF5F7F6FA),
          icon:
              ImageIcon(
                AssetImage("asset/images/home2.png"),
                size: 30,
                //color: Color(0xFF3A5A98),
              ),
              label:'Home',
            ),
            BottomNavigationBarItem(
              icon:
              ImageIcon(
                AssetImage("asset/images/pbox.png"),
                size: 30,
               // color: Color(0xFF3A5A98),

              ),              label: 'Spend',
            ),
            BottomNavigationBarItem(
              icon:
              ImageIcon(
                AssetImage("asset/images/pmoney.png"),
                size: 30,
               // color: Color(0xFF3A5A98),

              ),              label: 'Plan',
            ),
            BottomNavigationBarItem(
              icon:
              ImageIcon(
                AssetImage("asset/images/paccount.png"),
                size: 30,

              ),
              label: 'Account',
            )

          ],
        ),

        tabBuilder: ( context,  index) {
          switch(index){
            case 0:
              return CupertinoTabView(builder: (context)
                  {return CupertinoPageScaffold(child: Dashboard(),);
          });

    case 1:
    return CupertinoTabView(builder: (context)
    {return CupertinoPageScaffold(child: Spend(text: '', text2: 0,),);
    });

    case 2:
    return CupertinoTabView(builder: (context)
    {return CupertinoPageScaffold(child: PlanAccount1(),);
    });

    case 3:
    return CupertinoTabView(builder: (context)
    {return CupertinoPageScaffold(child: AddAccount1(),);
    });
            default:
              return CupertinoTabView(builder: (context)
              {return CupertinoPageScaffold(child: Dashboard(),);
              });
                  }
    },


          // return CupertinoTabView(
          //   builder: (BuildContext context) {
          //     return SafeArea(
          //       top: false,
          //       bottom: false,
          //       child: CupertinoApp(
          //         home: CupertinoPageScaffold(
          //           resizeToAvoidBottomInset: false,
          //           child: _children[_currentIndex],
          //         ),
          //       ),
          //     );
          //   },
          // );
       // }
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

}
//--------------------------
//   late int _currentIndex;
//   late List<Widget> _children;
//
//   @override
//   void initState() {
//     _currentIndex = 0;
//     _children = [
//       _getBodyWidget(),
//       Dashboard(),
//       Spend(),
//       PlanAccount(),
//       AddAccount(),
//       ManageAccount()
//     ];
//     super.initState();
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//   bool shouldShowDetails = true;
//   Widget _getBodyWidget() {
//     switch (_currentIndex) {
//       case 0:
//         return shouldShowDetails ? ManageAccount() : AddAccount();
//       case 1:
//         return AddAccountSuccessful();
//       default:
//         return AddAccount();
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//       return CustomNavigationBar(
//    // Center(
//    //        child: _children.elementAt(_currentIndex),
//    //      ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed, // Fixed
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               backgroundColor:  const Color(0xF5F7F6FA),
//           icon:
//               ImageIcon(
//                 AssetImage("asset/images/home2.png"),
//                 size: 30,
//                 //color: Color(0xFF3A5A98),
//               ),
//               label:'Home',
//             ),
//             BottomNavigationBarItem(
//               icon:
//               ImageIcon(
//                 AssetImage("asset/images/pbox.png"),
//                 size: 30,
//                // color: Color(0xFF3A5A98),
//
//               ),              label: 'Spend',
//             ),
//             BottomNavigationBarItem(
//               icon:
//               ImageIcon(
//                 AssetImage("asset/images/pmoney.png"),
//                 size: 30,
//                // color: Color(0xFF3A5A98),
//
//               ),              label: 'Plan',
//             ),
//             BottomNavigationBarItem(
//               icon:
//               ImageIcon(
//                 AssetImage("asset/images/paccount.png"),
//                 size: 30,
//                 //color: Color(0xFF3A5A98),
//
//               ),              label: 'Account',
//             ),
//           ],
//           currentIndex: _currentIndex,
//           selectedItemColor: Color(0xFFA781D3),
//           unselectedItemColor: Colors.grey,
//           onTap: _onItemTapped,
//         ),
//
//
//       );
//
//   }
//
//
// }
//
//
