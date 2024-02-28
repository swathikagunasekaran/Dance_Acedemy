import 'package:flutter/material.dart';
import 'package:sknk/location.dart';
import 'package:sknk/navbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isPassVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: const Text('Profile', style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ), onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => NavBar()),
            );
          },
          ),
          centerTitle: true,
          // actions: [
          //   IconButton(
          //     onPressed: () {},
          //     icon: const Icon(Icons.settings),
          //     color: Colors.black,)
          // ],
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ListView(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(width: 4, color: Colors.white),
                              boxShadow: [
                                BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                )
                              ],
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/profile_pic.png'),
                              )
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color: Colors.blue,
                                ),
                                color: Colors.blue,
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.white,
                              )

                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,),
                  buildTextField("Full Name" , "Enter your name" , false),
                  buildTextField("Email Id" , "provide email id" , false),
                  buildTextField("Password" , "*********" , true),
                  buildTextField("Address" ,"Enter your location please" , false),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: (){},
                        child: Text(
                          "Cancel" ,
                          style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black,
                        ),
                        ),
                        style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 50),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push((context) , MaterialPageRoute(builder: (context) => Location() ),);
                        },

                        child: Text("Save" , style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.blue,
                        )
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20), ),
                        ),
                      )
                    ],
                  )
                ],
              )
          ),
        )
    );
  }
  Widget buildTextField(String labelText, String placeholder, bool password) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: password ? isPassVisible : false,
        decoration: InputDecoration(
          suffixIcon: password
              ? IconButton(
            icon: Icon(
              isPassVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.grey,
            ),
            onPressed: () {
              setState(() {
                isPassVisible = !isPassVisible;
              });
            },
          )
              : null,
          contentPadding: const EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}


