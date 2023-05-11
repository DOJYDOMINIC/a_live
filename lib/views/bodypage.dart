import 'package:a_live/control/controllar.dart';
import 'package:a_live/views/updatepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyPage extends StatelessWidget {
  final String firstName;
  final String email;

  const BodyPage({Key? key, required this.firstName, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderOne>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateUserScreen(),));
          }, icon: Icon(Icons.browser_updated_sharp))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(firstName),
            Text(email)
          ],
        ),
      ),
    );
  }
}
