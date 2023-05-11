
import 'package:a_live/views/loginpage.dart';
import 'package:a_live/views/updatepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../control/controllar.dart';

class PageOne extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController secondname = TextEditingController();
  final TextEditingController mail = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var providerone = Provider.of<ProviderOne>(context,listen: false);
    var snackbar = ScaffoldMessenger.of(context).showSnackBar;
    return Scaffold(
      appBar: AppBar(
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                  hintText: 'First Name',
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))),
            ),
            TextField(
              controller: secondname,
              decoration: InputDecoration(
                  hintText: 'Last Name',
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))),

            ),
            TextField(
              controller: mail,
              decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(borderSide: BorderSide(color:Colors.black))),

            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  String email = mail.text;
                  String first = name.text;
                  String last = secondname.text;

                  String? nameError = providerone.validateName(first);
                  String? secondNameError = providerone.validateSecondName(last);
                  String? emailError = providerone.validateEmail(email);

                  if (nameError == null && secondNameError == null && emailError == null) {
                    // If all inputs are valid, make the POST request
                    providerone.postData(first, last, email).then((_) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>DataDisplayPage() ,));
                      snackbar(
                        SnackBar(
                          content: Text('POST request successful'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }).catchError((error) {
                      snackbar(
                        SnackBar(
                          content: Text(error.toString()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    });
                  } else {
                    // Display validation error messages using SnackBar
                    String? errorMessage = nameError ?? secondNameError ?? emailError;
                    snackbar(
                      SnackBar(
                        content: Text(errorMessage!),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ),
            // DropDown(),
            // ElevatedButton(onPressed: (){
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => DataDisplayPage(),));
            // }, child: Text('pagetwo'))
          ],
        ),
      ),
    );
  }
}
