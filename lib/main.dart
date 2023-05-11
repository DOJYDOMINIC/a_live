
import 'package:a_live/views/pageonename.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'control/controllar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProviderOne(),)
      ],
      child: MaterialApp(
        home: PageOne(),
      ),
    );
  }
}
