import 'package:flutter/material.dart';
import 'package:sknk/location.dart';
import 'package:sknk/components/square_tile.dart';

final _fromkey = GlobalKey<FormState>();

class Home extends StatelessWidget {
  final Function()? onTap;

  String? validateEmail(String? email){
    if(email == null || email.isEmpty){
      return 'Email cannot be empty';
    }
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if(!isEmailValid){
      return 'Please enter a valid email';
    }
    return null;
  }

  Home({super.key , this.onTap} );
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child:Form(
              key: _fromkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50,),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50,),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25,),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                  hintText: 'username',
                 enabledBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                 ),
                 keyboardType: TextInputType.emailAddress,
                 validator: validateEmail,
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                  hintText: 'password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  obscureText: true,
                  validator: (password) => password!.length < 3 ? 'please enter valid password' : null ,
                ),
                const SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25,),

                // MyButton(onTap: signUserIn),
            GestureDetector(
              onTap: (){
                if(_fromkey.currentState!.validate()){
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Location()),
                  );
                }
              },
              child: Container(
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:Center(
                    child: InkWell(
                      onTap: () {
                        if (_fromkey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Location()),
                          );
                        }
                      },
                      child: const Text(
                        'Sign in' ,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    )
                ),
              ),
            ),
                const SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                 const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    SquareTile(imagePath: 'assets/images/google.png'),
                    SizedBox(width: 10,),
                    SquareTile(imagePath: 'assets/images/microsoft.png'),
                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4,),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
            ),
          ),
        ),
      ),
    );
  }
}
