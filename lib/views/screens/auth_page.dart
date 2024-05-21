import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/main_button.dart';
import '../widgets/text_form_field.dart';
import 'bottom_navbar.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String _isLogin = 'login';
  bool showPassword = false;
  String? email;
  String? pass;
  bool isLoading = false;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    /*if we select sign with google and then cancel it , it will return null
    value .So we did this check to not return exception*/
    if(googleUser==null){
      return;
    }

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const
    BottomNavbar()));
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 90),
                    child: Text(
                      _isLogin == 'login' ? "Login" : "Sign up",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontFamily: 'Montserrat bold',
                          ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
                    label: 'Email',
                    hint: 'Enter your Email',
                    error: 'Please enter your email',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                      controller: _passController,
                      label: 'Password',
                      hint: 'Enter your password',
                      error: 'Please enter your password',
                    showPassword: showPassword,
                    suffixIcon: InkWell(
                        onTap: (){
                          if(showPassword==false){
                            showPassword=true;
                          }
                          else{
                            showPassword=false;
                          }
                          showPassword=showPassword;
                          setState(() {

                          });
                        },
                        child:showPassword? const Icon(Icons.visibility_off)
                            :const Icon(Icons.visibility)
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (_isLogin == 'login')
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text(
                            "forget your password?",
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: 'Metropolis thin',
                                fontWeight: FontWeight.w900),
                          ),
                          Icon(
                            Icons.arrow_right_alt_sharp,
                            color: Theme.of(context).primaryColor,
                          )
                        ],
                      ),
                      onTap: () {},
                    ),
                  const SizedBox(
                    height: 24,
                  ),
                  MainButton(
                      text: _isLogin == 'login' ? 'Login' : 'Sign up',
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          isLoading = true;
                          setState(() {});
                          if (_isLogin == 'login') {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailController.text,
                                      password: _passController.text);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavbar()));
                            } on FirebaseAuthException catch (e) {
                              print(e.code.toString());
                              if (e.code == 'user-not-found') {
                                AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.rightSlide,
                                    title: 'Error',
                                    desc: 'No user found for that email.',
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () {},
                                    ).show();
                              } else if (e.code == 'wrong-password') {
                                AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: 'Wrong password provided for that user.',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                                ).show();
                              }else {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Error',
                                  desc: '${e.code.toString()}',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              }
                            }
                          } else {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passController.text,
                              );
                              // if Sign up created successfully
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavbar()));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Error',
                                  desc: 'The password provided is too weak.',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              } else if (e.code == 'email-already-in-use') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  animType: AnimType.rightSlide,
                                  title: 'Error',
                                  desc: 'The account already exists for that email.',
                                  btnCancelOnPress: () {},
                                  btnOkOnPress: () {},
                                ).show();
                              }
                            } catch (e) {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                animType: AnimType.rightSlide,
                                title: 'Error',
                                desc: '${e}',
                                btnCancelOnPress: () {},
                                btnOkOnPress: () {},
                              ).show();
                            }
                          }
                          isLoading = false;
                          setState(() {});
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            if (_isLogin == 'login') {
                              _isLogin = 'register';
                              _emailController.clear();
                              _passController.clear();
                            } else {
                              _isLogin = 'login';
                              _emailController.clear();
                              _passController.clear();
                            }
                          });
                        },
                        child: Text(
                          _isLogin == 'login'
                              ? 'Don\'t have an account?Register'
                              : 'Have an account? Login',
                          style: const TextStyle(
                              fontFamily: 'Metropolis thin',
                              fontSize: 14,
                              fontWeight: FontWeight.w900),
                        )),
                  ),
                  // const Spacer(),
                  const SizedBox(
                    height: 80,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      _isLogin == 'login'
                          ? 'Or Login with'
                          : 'Or Register with',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontFamily: 'Metropolis thin',
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          height: 70,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              color: Theme.of(context).primaryColorDark
                              // Colors.white
                              ,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                    blurRadius: 8.0,
                                    spreadRadius: 0),
                              ]),
                          child: Image.asset('assets_NewsApp/google.png'),
                        ),
                        onTap: (){
                          signInWithGoogle();
                        },
                      ),
                      const SizedBox(width: 16),
                      Container(
                        height: 70,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color:  Theme.of(context).primaryColorDark
                            // Colors.white
                            ,
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(
                                    0.0,
                                    1.0,
                                  ),
                                  blurRadius: 8.0,
                                  spreadRadius: 0.0),
                            ]),
                        child: Image.asset('assets_NewsApp/facebook.png'),
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