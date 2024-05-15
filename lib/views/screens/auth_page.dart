import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/main_button.dart';
import 'bottom_navbar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey =GlobalKey<FormState>();
  final _emailController=TextEditingController();
  final _passController=TextEditingController();
  String _isLogin='login';
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 60 ,
              horizontal: 32),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text( _isLogin =='login'? "Login" : "Sign up" ,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontFamily: 'Metropolis2',
                  ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (val)=> /*anonymous function*/
                      val!.isEmpty ? 'Please enter your email': null/*if not
                       empty , don't do anything*/
                    ,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontFamily: 'Metropolis3',
                          fontWeight: FontWeight.w500
                      ),
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                          fontFamily: 'Metropolis3',
                          fontWeight: FontWeight.w500,
                        color: Colors.grey
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: _passController,
                    validator: (val) => /*anonymous function*/
                      val!.isEmpty ? 'Please enter your password': null /*if
                       not empty , don't do anything*/
                    ,
                    decoration: const InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                        fontFamily: 'Metropolis3',
                        fontWeight: FontWeight.w500
                    ),
                        hintText: 'Enter your password',
                      hintStyle: TextStyle(
                          fontFamily: 'Metropolis3',
                          fontWeight: FontWeight.w500,
                        color: Colors.grey
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if(_isLogin=='login')
                    InkWell(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("forget your password?",style: TextStyle(
                                fontFamily: 'Metropolis3',
                                fontWeight: FontWeight.w500
                            ),),
                            Icon(
                              Icons.arrow_right_alt_sharp ,
                              color: Theme.of(context).primaryColor,
                            )
                          ],
                        ),
                        onTap: () {
              
                        },
                      ),
                  const SizedBox(
                    height:24 ,
                  ),
                  MainButton(
                      text: _isLogin=='login'? 'Login' :'Sign up',
                      onTap: (){
                        if(_formKey.currentState!.validate()){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder:(context) =>const BottomNavbar
                                ()));
                        }
                      }
                  ),
                  const SizedBox(height: 16,),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          if(_isLogin=='login'){
                            _isLogin='register';
                          }else{
                            _isLogin='login' ;
                          }
                        });
                      },
                      child:Text(_isLogin=='login'?
                      'Don\'t have an account?Register'
                      :'Have an account? Login' ,style: const TextStyle(
                          fontFamily: 'Metropolis3',
                          fontWeight: FontWeight.w500
                        ),)
                    ),
                  ),
                  // const Spacer(),
                  const SizedBox(
                    height: 80,
                  ),
                   Align(
                     alignment: Alignment.center,
                     child: Text(
                       _isLogin=='login'?'Or Login with'
                       :'Or Register with',
                      style:Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontFamily: 'Metropolis3',
                        fontWeight: FontWeight.w500
                      ) ,),
                   ),
                   const SizedBox(height: 16,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 64,
                          width: 92,
                        decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(24),
                          color: Colors.white ,
                          boxShadow: const [
                            BoxShadow(
                             color: Colors.black26,
                              offset: Offset(
                                0.0,
                                1.0,
                              ),
                                blurRadius: 8.0,
                                spreadRadius: 0.0
                            ),
                          ]
                        ),
                        // child:Image.asset('assetsEcommerce/google.png') ,
                      ),
                      const SizedBox(width: 16),
                      Container(
                        height: 64,
                        width: 92,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0
                              ),
                            ]
                        ),
                        // child:Image.asset('assetsEcommerce/facebook.png') ,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
