import 'package:a_live/control/controllar.dart';
import 'package:a_live/views/bodypage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Page'),
        centerTitle: true,
      ),
      body: Consumer<ProviderOne>(
        builder: (context, provider, child) {
          if (provider.data.isEmpty) {
            provider.fetchData();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.data.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>BodyPage(
                      firstName: provider.data[index]['first_name'],
                      email: provider.data[index]['email'],
                    ),));
                  },
                  child: ListTile(
                    title: Text(provider.data[index]['first_name'].toString()),
                    subtitle: Text(provider.data[index]['email'].toString()),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
