import 'package:flutter/material.dart';
import 'package:tiktok_app/controller/auth_controller.dart';
import 'package:tiktok_app/view/widgets/glitch.dart';
import 'package:tiktok_app/view/widgets/text_input.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _setPasswordController = new TextEditingController();
  TextEditingController _confirmPasswordController =
      new TextEditingController();
  TextEditingController _usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 80),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlithEffect(
                child: const Text("Welcome to TikTok",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 30)),
              ),
              SizedBox(height: 25),
              InkWell(
                onTap: () {
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://st3.depositphotos.com/9998432/13335/v/600/depositphotos_133352156-stock-illustration-default-placeholder-profile-icon.jpg'),
                      radius: 60,
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(Icons.edit,
                                size: 20, color: Colors.black)))
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _emailController,
                    myIcon: Icons.email,
                    myLabelText: "Email"),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _setPasswordController,
                    myIcon: Icons.lock,
                    myLabelText: "Set Password",
                    toHide: true),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _confirmPasswordController,
                    myIcon: Icons.lock,
                    myLabelText: "Confirm Password",
                    toHide: true),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                    controller: _usernameController,
                    myIcon: Icons.person,
                    myLabelText: "Username"),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    AuthController.instance.signUp(
                        _usernameController.text,
                        _emailController.text,
                        _setPasswordController.text,
                        AuthController.instance.proimg);
                  },
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: Text("Sign Up")))
            ],
          ),
        ),
      ),
    );
  }
}
