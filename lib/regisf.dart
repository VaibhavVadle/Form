
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class regisf extends StatefulWidget {
  @override
  _regisfState createState() => _regisfState();
}

class _regisfState extends State<regisf> {

  final _myFormKey = GlobalKey<FormState>();
  final fname = new TextEditingController();
  final lname = new TextEditingController();
  final address = new TextEditingController();
  final Mno = new TextEditingController();
  final _password = new TextEditingController();
  final _confirmPassword = new TextEditingController();
  final emailController = new TextEditingController();

  bool visible = false ;
  Future openDialog()=> showDialog(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(25.0),
        child: AlertDialog(
          title: Text('Form saved succesfully',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),),
        ),
      ),
  );
  Future closeDialog()=> showDialog(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(25.0),
      child: AlertDialog(
        title: Text('Form is invlaid',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
          ),),
      ),
    ),
  );

  Future apiCall() async {
    // Showing CircularProgressIndicator using State.

    // Getting value from Controller
    String Firstname = fname.text;
    String Lastname = lname.text;
    String Email = emailController.text;
    String Address = address.text;
    String Mobile = Mno.text;
    String Password = _password.text;
    String ConfirmPassword = _confirmPassword.text;

    // API URL
    var url = Uri.parse('http://2b98-2402-8100-3020-a2c-2973-cfcb-fca6-30a1.ngrok.io/adduser');

    // Store all data with Param Name.
    var data ={
      "Firstname":Firstname,
      "Lastname":Lastname,
      "Emailaddress":Email,
      "Address":Address,
      "Mobile":Mobile,
      "Password":Password,
      "ConfirmPassword":ConfirmPassword
    };
    // Starting api Call with data.
    var response = await http.post(url, body: data);


    var message = jsonDecode(response.body);

    print("datta="+data.toString());
    // Getting Server response into variable.


  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Form'),
        centerTitle: true,
        backgroundColor: Colors.grey[600],
      ),
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),

        child: SingleChildScrollView(
          reverse: true,
          child: Form(
            key: _myFormKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TextFormField(
                    decoration: InputDecoration(


                      labelText: "First Name",
                      hintText: "Enter your First name",
                    ),

                    controller: fname,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: lname,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      labelText: "Last Name",
                      hintText: "Enter your Last name",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: emailController,

                    keyboardType: TextInputType.emailAddress,
                    validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Enter a valid email address'
                        : null,
                    decoration: InputDecoration(
                      labelText: "Email address",
                      hintText: "Enter your email address",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: address,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Address",
                      hintText: "Enter your address",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: Mno,

                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Mobile number';
                      }
                      if (value.length != 10) {
                        return 'Mobile number should be of 10 digits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Mobile number",
                      hintText: "Enter your Mobile number",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: _password,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Create Password",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    controller: _confirmPassword,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter Confirm Password';
                      }
                      if (value != _password.text) {
                        return 'Please enter same Password';
                      }
                      return null;
                    },


                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter your Confirm Password",
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  child: Text('Submit'),

                    onPressed: (){
                      if (_myFormKey.currentState!.validate()) {
                        apiCall();
                        openDialog();
                      }
                      else{
                        closeDialog();
                      }

                    }
                ),

              ],
            ),

          ),
        ),


      ),

    );

  }
}
