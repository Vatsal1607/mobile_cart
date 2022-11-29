import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_cart/pages/login_register/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset("assets/images/hey.png",
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 20,),
                const Text('Welcome',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28
                  ),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter Username",
                          labelText: "Username",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Username cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          // name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password cannot be empty";
                          }
                          else if(value.length < 6){
                            return "Password length should be atleast 6";
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Don't have an account?   "),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterPage()),
                              );
                            },
                            child: const Text('Register',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.indigoAccent
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40,),
                      ElevatedButton(onPressed: (){
                        // Navigator.pushNamed(context, MyRoutes.homeRoute);
                        if(formKey.currentState!.validate()){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const RegisterPage()),
                          );
                        } else {
                          print('Please Enter valid details');
                        }
                      }, child: Text('Login'),
                        style: TextButton.styleFrom(minimumSize: Size(130, 40)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

