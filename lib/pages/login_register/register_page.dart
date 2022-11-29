import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobile_cart/pages/login_register/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final formKey = GlobalKey<FormState>();
  bool obscureText1 = true;
  bool obscureText2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to MobileCart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value){
                    if(value! == ''){
                      return 'Please enter Firstname';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter Fullname',
                    labelText: 'Fullname',
                      border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value! == ''){
                      return 'Please enter Mobile number';
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your Mobile number',
                    labelText: 'Mobile number',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  validator: (value) => EmailValidator.validate(value!) ? null : 'Please enter valid email',
                  decoration: const InputDecoration(
                    hintText: 'Enter your Email',
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20,),

                Stack(
                    alignment: const Alignment(0, 0),
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value! == ''){
                          return 'Please enter Password';
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: obscureText1,
                    ),
                    Positioned(
                        right: 15,
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText1 = !obscureText1;
                              });
                            },
                          icon: Icon(Icons.remove_red_eye)),
                    ),
                  ]
                ),

                const SizedBox(height: 20,),

                Stack(
                  alignment: const Alignment(0, 0),
                  children: [
                    TextFormField(
                      validator: (value){
                        if(value! == ''){
                          return 'Please enter Correct Password';
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Confirm Password',
                        labelText: 'Confirm Password',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: obscureText2,
                    ),
                    Positioned(
                        right: 15,
                        child: IconButton(
                            onPressed: (){
                              setState(() {
                                obscureText2 = !obscureText2;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye)),
                    ),
                  ]
                ),

                const SizedBox(height: 30,),
                // Register button here:
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                      print('Done');
                    }
                    else{
                      print('Enter correct values');
                    }
                  },
                  child: const Text('Register', style: TextStyle(
                      fontSize: 15
                  ),),),
                ),
                SizedBox(height: 10,),
                const Text('or', style: TextStyle(
                  fontSize: 20
                ),),
                const SizedBox(height: 10,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text('Sign in', style: TextStyle(
                      fontSize: 15
                    ),),
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
