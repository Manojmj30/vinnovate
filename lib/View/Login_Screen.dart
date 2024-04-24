

import 'package:flutter/material.dart';

import '../Constants.dart';
import 'CoursesList_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    var height = size.height;
    return Scaffold(
      backgroundColor: AppConstant.Primarycolor,
      appBar: AppBar(
        backgroundColor: AppConstant.Primarycolor,
        leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
          onPressed: (){},
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height:10),
            Center(
              child: Container(
              height:height*0.70,
              width:height*0.50,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                    //BoxShadow
                    ],
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15,0,10,0),
                  child: Column(
                    children: [
                      const SizedBox(height:20),
                    Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppConstant.Primarycolor, // Background color
                    ),
                    child: Center(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/icons/loginImage.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                      const SizedBox(height:5),
                    const Text('Log in',style:TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 20)),
                      const SizedBox(height:5),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height:10),
                              const Text('Email',style:TextStyle(color: Color(0xff131313),fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: height*0.08,
                                width: height*0.46,
                                child: TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter email address';
                                    }
                                    if (value.length > 6 &&
                                        !value.isValidEmail()) {
                                      return 'Please enter valid email address';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                              Icons.email_outlined,
                                              color: Color(0xffb2b4b5)),
                                      hintText: 'Email',
                                      hintStyle: const TextStyle(color: Color(0xffb2b4b5),fontWeight: FontWeight.normal),
                                      fillColor: AppConstant.Primarycolor,
                                      filled: true,
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color:AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color:Colors.red),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8))),
                                ),
                              ),
                              const SizedBox(height:20),
                              const Text('Password',style:TextStyle(color: Color(0xff131313),fontWeight: FontWeight.w400)),
                              SizedBox(
                                height: height*0.08,
                                width: height*0.46,
                                child: TextFormField(
                                  controller: passwordController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    if (value.length > 8 &&
                                        !value.isValidPassword()) {
                                      return 'Password should contain atleast one uppercase, \none special character,one number minimum 8 characters and not exceeded 12 characters';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                          Icons.lock_outline_rounded,
                                          color: Color(0xffb2b4b5)),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          passwordVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: const Color(0xffb2b4b5),
                                        ),
                                        onPressed: () {
                                          setState(
                                                () {
                                              passwordVisible =
                                              !passwordVisible;
                                            },
                                          );
                                        },
                                      ),
                                      hintText: 'password',
                                      hintStyle: const TextStyle(color: Color(0xffb2b4b5),fontWeight: FontWeight.normal),
                                      fillColor: AppConstant.Primarycolor,
                                      filled: true,
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color:AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      errorBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color:Colors.red),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8)),
                                      border: OutlineInputBorder(
                                          borderSide:
                                          const BorderSide(color: AppConstant.Primarycolor),
                                          borderRadius:
                                          BorderRadius.circular(8))),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0,5,10,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Forget password?',style:TextStyle(color: Color(0xff929292))),
                          ],
                        ),
                      ),
                      const SizedBox(height:20),
                      InkWell(
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => const ProductList(),));
                          //loginUser(emailController.text,passwordController.text);

                        },
                        child: Container(
                            height: height*0.07,
                          width:height*0.50,
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xffec5252),
                          ),
                          child: const Center(child: Text('Log In',style:TextStyle(color: AppConstant.whiteColor))),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height:15),
        RichText(
             text: const TextSpan(
               children: <TextSpan>[
                 TextSpan(
                    text: 'Do not have an account?',
                     style: TextStyle(color:Color(0xff8a8c8d) )),
                TextSpan(text: ' Sign up', style: TextStyle(color: Colors.black))
               ],
             ),),
          ],

                ),
    ),
        );
  }
}
