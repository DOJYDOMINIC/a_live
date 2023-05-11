import 'package:a_live/control/controllar.dart';
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
