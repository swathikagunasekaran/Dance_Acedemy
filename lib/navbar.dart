import 'package:flutter/material.dart';
import 'package:sknk/profile.dart';
import 'package:sknk/location.dart';
import 'package:sknk/classscheduled.dart';
import 'package:sknk/events.dart';
import 'package:sknk/loginpage.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:Container(
        color: Colors.grey[400],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Swathika G' , style:
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w100,
              ),
              ),
              accountEmail: const Text('swathikagunasekaran55@gmail.com',
                style:
                TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child:  ClipOval(child: Image.asset('assets/images/profile_pic.png',),),
              ),
              decoration:const BoxDecoration(
                color: Colors.black,
              ),
            ),
            ListTile(

              leading:const  Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap:(){
                Navigator.push(context ,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.location_city),
              title: const Text('Branch'),
              onTap:(){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Location(),
                  ),
                );
              },
            ),
            ListTile(
              leading:const  Icon(Icons.schedule),
              title: const Text('Class Schedule'),
              onTap:(){
                   Navigator.push(context ,
                   MaterialPageRoute(builder: (context) => const ClassScheduled(),),);
              },
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              onTap:(){
                Navigator.push(context ,
                  MaterialPageRoute(builder: (context) => const Events(),),);
              },
            ),
            // ListTile(
            //   leading: const Icon(Icons.feedback),
            //   title: const Text('Feedback'),
            //   onTap:(){
            //     // Navigator.push(context ,
            //     //   MaterialPageRoute(builder: (context) => ,),);
            //   },
            // ),
            ListTile(
              leading:const  Icon(Icons.logout),
              title: const Text('Logout'),
              onTap:(){
                  Navigator.push(context ,
                    MaterialPageRoute(builder: (context) => Home(),),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
