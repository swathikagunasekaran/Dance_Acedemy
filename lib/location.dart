 import 'package:flutter/material.dart';
import 'package:sknk/branchdetails.dart';
import 'package:sknk/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatelessWidget {
  Location({super.key});
  List imgData = [
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
    'assets/images/logo.png',
  ];
  List titles = [
    'CHENNAI',
    'CHIDAMBARAM',
    'COIMBATORE',
    'MAHABALIPURAM',
  ];
  var height , width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const NavBar(),
        appBar: AppBar(
          elevation: 0.0,
          title:const  Text('' , style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.black,
          ) ,
          ),
        ),
        backgroundColor: Colors.grey[400],
        body: SingleChildScrollView(

          child: Container(
            color: Colors.grey[400],
            width: width,
            child: Column(
              children :[
                Container(
                  decoration: const BoxDecoration(),
                  height: height * 0.3,
                  width: width,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                            top: 15,
                            left: 15,
                            right: 15,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  'Registration open for All the Branches',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  ),
                                ),
                                SizedBox(height:5),
                                Text(
                                  'Coimbatore,India',
                                  style: TextStyle(
                                    color: Colors.white54,
                                    fontSize: 16,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ]
                          ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )
                    ),
                    width: width,
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: imgData.length,
                        itemBuilder: (context ,index ){
                          return InkWell(
                            onTap: (){},
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                vertical: 8,
                                horizontal: 10,//20
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap:  (){
                                      Navigator.push((context) ,
                                        MaterialPageRoute(builder: (context) => const BranchDetails()),);
                                    },
                                    child: Image.asset(
                                      imgData[index],
                                      width: 50,
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                  Text(
                                    titles[index],
                                    style: GoogleFonts.dancingScript(textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                     ),
                                    ) ,
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

