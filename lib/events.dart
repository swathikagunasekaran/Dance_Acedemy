
import 'package:flutter/material.dart';
import 'package:sknk/navbar.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  List texts = [
    'Spring Carnival - ',
    'Art Expo - ',
    'Tech Innovations Summit - ',
    'Global Food Fest - ',
    'Fashion Extravaganza - ',
    'Fitness Challenge - ',
    'Mindful Meditation Retreat - ',
    'Science Fair - ',
    'Entrepreneurship Bootcamp - ',
    'Cultural Fusion Night - ',
  ];


  List places = [
    'Bangalore',
    'Chennai',
    'Hyderabad',
    'Mysuru',
    'Kochi',
    'Coimbatore',
    'Pondicherry',
    'Madurai',
    'Ooty',
    'Goa',
  ];

   void initState(){
     super.initState();
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) { setState(() {
       startAnimation = true;
     });
     });
   }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('EVENTS LIST' , style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 21,
        ),),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ), onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NavBar(),),
          );
        },
        ),
      ),
      backgroundColor: Colors.grey[400],
     body:SafeArea(
        child:SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
       padding: EdgeInsets.symmetric(
         horizontal: screenWidth/20,
       ),
       child: Column(
         children: [
           const SizedBox(height: 30,),
           GestureDetector(
             onTap: (){
               Future.delayed(const Duration(milliseconds: 500), (){
                 setState(() {
                   startAnimation = true;
                 });
               });
             },
           ),
           const SizedBox(height: 30,),
           ListView.builder(
             primary: false,
             shrinkWrap: true,
             itemCount: texts.length,
             itemBuilder: (context , index){
               return item(index);
           },
           ),
           const SizedBox(height: 30,),
         ],
       ),
     ),
     ),
    );
  }
  Widget item(int index){
    return AnimatedContainer(
      height: 55,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform: Matrix4.translationValues(startAnimation ? 0: screenWidth, 0, 0),
      width: screenWidth,
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth/20,

      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index+1}. ${texts[index]}   ",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w100,
            ),
            ),
          Expanded(
          child: Text(
            places[index] , style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w100,
            ),
          ),
          ),
        ],
      ),
    );
  }
}

