// import 'package:flutter/material.dart';
// import 'package:my_flutter_web_project/utills/dimensions.dart';
// import 'package:my_flutter_web_project/widgets/custom_button.dart';
// import 'package:my_flutter_web_project/widgets/custom_textfield.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     MySize().init(context);
//     return Scaffold(
//       backgroundColor: Colors.white, // Light background color
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.all(MySize.size30),
//           child: Card(
//             elevation: 10, // Adding a shadow effect
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15), // Rounded corners
//             ),
//             child: Container(
//               width: MySize.size700, // Set a fixed width for the container
//               padding:
//                   EdgeInsets.all(MySize.size40), // Padding around the content
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   FlutterLogo(
//                     size: MySize.size100,
//                   ),
//                   SizedBox(height: MySize.size40), // Increased spacing
//                   Text(
//                     'Welcome to My Flutter Web Bidding Project',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: MySize.size24, // Smaller font size for heading
//                       fontWeight: FontWeight.w600, // Slightly bolder text
//                       color: Colors.black87, // Dark text color for readability
//                     ),
//                   ),
//                   SizedBox(height: MySize.size40), // Increased spacing

//                   // Username text field
//                   SizedBox(
//                     width: MySize.size700,
//                     child: const CustomTextField(
//                       hint: "Enter User Name",
//                       borderRadius: 25,
//                     ),
//                   ),
//                   SizedBox(
//                       height: MySize.size20), // Reduced height between fields

//                   // Password text field
//                   SizedBox(
//                     width: MySize.size700,
//                     child: const CustomTextField(
//                       hint: "Enter the password",
//                       borderRadius: 25,
//                       obscureText: true,
//                     ),
//                   ),
//                   SizedBox(height: MySize.size30), // Spacing before the button

//                   // Login button
//                   SizedBox(
//                     width: MySize.size700,
//                     height: MySize.size50,
//                     child: CustomButton(
//                       label: 'Login',
//                       onPressed: () {
//                         // Add your login functionality here
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_flutter_web_project/features/login/controller.dart';
// import 'package:my_flutter_web_project/utills/dimensions.dart';
// import 'package:my_flutter_web_project/widgets/custom_button.dart';
// import 'package:my_flutter_web_project/widgets/custom_textfield.dart';
// // ignore: depend_on_referenced_packages
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginViewState createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   late SharedPreferences prefs;

//   @override
//   void initState() {
//     super.initState();
//     initSharedPreferences();
//   }

//   void initSharedPreferences() async {
//     prefs = await SharedPreferences.getInstance();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _submitForm(BuildContext context) async {
//     if (_formKey.currentState!.validate()) {
//       final userViewModel = Provider.of<UserController>(context, listen: false);
//       final email = _emailController.text;
//       final password = _passwordController.text;

//       // Attempt to login
//       final user = await userViewModel.loginUser(email, password);

//       if (user != null) {
//         // ignore: use_build_context_synchronously
//         Navigator.pushNamed(context, '/');
//       } else {
//         // ignore: use_build_context_synchronously
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(userViewModel.errorMessage ?? 'Login failed')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     MySize().init(context);

//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Consumer<UserController>(
//             builder: (context, userViewModel, child) {
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(height: MySize.size100),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: MySize.size100,
//                         width: MySize.size100,
//                         child: const FlutterLogo(),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: MySize.size50),
//                   Text(
//                     "Sign in to your account",
//                     style: GoogleFonts.mulish(
//                       fontWeight: FontWeight.bold,
//                       fontSize: MySize.size30,
//                     ),
//                   ),
//                   SizedBox(height: MySize.size30),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: MySize.size40),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Email",
//                           style: GoogleFonts.mulish(fontSize: MySize.size20),
//                         ),
//                         SizedBox(height: MySize.size10),
//                         CustomTextField(
//                           controller: _emailController,
//                           hint: "Enter your Email Address",
//                           backgroundColor: Colors.grey[200],
//                           borderRadius: 15.0,
//                           borderColor: Colors.blue,
//                           borderWidth: 0,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter your email";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: MySize.size25),
//                         Text(
//                           "Password",
//                           style: GoogleFonts.mulish(fontSize: MySize.size20),
//                         ),
//                         SizedBox(height: MySize.size10),
//                         CustomTextField(
//                           controller: _passwordController,
//                           obscureText: true,
//                           hint: "Enter your Password",
//                           backgroundColor: Colors.grey[200],
//                           borderRadius: 15.0,
//                           borderColor: Colors.blue,
//                           borderWidth: 0,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return "Please enter your password";
//                             } else if (value.length < 6) {
//                               return "Password must be at least 6 characters long";
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: MySize.size30),
//                         if (userViewModel
//                             .isLoading) // Show progress indicator while loading
//                           const Center(
//                             child: CircularProgressIndicator(
//                               color: Colors.green,
//                             ),
//                           )
//                         else
//                           CustomButton(
//                             padding:
//                                 EdgeInsets.symmetric(vertical: MySize.size20),
//                             label: "Login", // Changed to 'Login'
//                             onPressed: () => _submitForm(context),
//                             backgroundColor: Colors.green,
//                             borderColor: Colors.green,
//                             borderRadius: 12.0,
//                             borderWidth: 2.0,
//                             textStyle: GoogleFonts.mulish(
//                                 color: Colors.white,
//                                 fontSize: MySize.size15,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: MySize.size30),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Do Not Have an Account?",
//                         style: GoogleFonts.mulish(
//                           fontSize: MySize.size17,
//                         ),
//                       ),
//                       SizedBox(width: MySize.size10),
//                       InkWell(
//                         onTap: () {
//                           context.goNamed("signup");
//                         },
//                         child: Text(
//                           "Sign Up",
//                           style: GoogleFonts.mulish(
//                               fontWeight: FontWeight.bold,
//                               fontSize: MySize.size17,
//                               color: Colors.green),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_web_project/features/login/controller.dart';
import 'package:my_flutter_web_project/utills/dimensions.dart';
import 'package:my_flutter_web_project/widgets/custom_button.dart';
import 'package:my_flutter_web_project/widgets/custom_textfield.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final userViewModel = Provider.of<UserController>(context, listen: false);
      final email = _emailController.text;
      final password = _passwordController.text;

      // Attempt to login
      final user = await userViewModel.loginUser(email, password);

      if (user != null) {
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/');
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(userViewModel.errorMessage ?? 'Login failed')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    MySize().init(context);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.blueGrey[50],
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MySize.size20),
              padding: EdgeInsets.all(MySize.size30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              width: double.infinity,
              constraints: const BoxConstraints(maxWidth: 400),
              child: Form(
                key: _formKey,
                child: Consumer<UserController>(
                  builder: (context, userViewModel, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: MySize.size20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MySize.size80,
                              width: MySize.size80,
                              child: const FlutterLogo(),
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.size30),
                        Text(
                          "Sign in to your account",
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.bold,
                            fontSize: MySize.size24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: MySize.size20),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: MySize.size10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Username",
                                style: GoogleFonts.mulish(
                                  fontSize: MySize.size16,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: MySize.size8),
                              CustomTextField(
                                controller: _emailController,
                                hint: "Enter your User Name",
                                backgroundColor: Colors.grey[200],
                                borderRadius: 12.0,
                                borderColor: Colors.blue,
                                borderWidth: 1,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your username";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: MySize.size20),
                              Text(
                                "Password",
                                style: GoogleFonts.mulish(
                                  fontSize: MySize.size16,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: MySize.size8),
                              CustomTextField(
                                controller: _passwordController,
                                obscureText: true,
                                hint: "Enter your Password",
                                backgroundColor: Colors.grey[200],
                                borderRadius: 12.0,
                                borderColor: Colors.blue,
                                borderWidth: 1,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your password";
                                  } else if (value.length < 6) {
                                    return "Password must be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: MySize.size30),
                              if (userViewModel.isLoading)
                                const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.green,
                                  ),
                                )
                              else
                                CustomButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: MySize.size18),
                                  label: "Login",
                                  onPressed: () => _submitForm(context),
                                  backgroundColor: Colors.green,
                                  borderColor: Colors.green,
                                  borderRadius: 12.0,
                                  borderWidth: 2.0,
                                  textStyle: GoogleFonts.mulish(
                                    color: Colors.white,
                                    fontSize: MySize.size15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        SizedBox(height: MySize.size20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Do Not Have an Account?",
                              style: GoogleFonts.mulish(
                                fontSize: MySize.size16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: MySize.size8),
                            InkWell(
                              onTap: () {
                                context.goNamed("signup");
                              },
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.bold,
                                    fontSize: MySize.size16,
                                    color: Colors.green),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MySize.size30),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
