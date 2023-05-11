
import 'package:a_live/control/controllar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UpdateUserScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();

  void _handleUpdateUser(BuildContext context) {
    final userProvider = Provider.of<ProviderOne>(context, listen: false);
    final int userId = 1; // Set the user ID here

    final String newEmail = _emailController.text;
    final String newFirstName = _firstNameController.text;
    final String newLastName = _lastNameController.text;
    final String newAvatar = _avatarController.text;

    userProvider.updateUser(userId, newEmail, newFirstName, newLastName, newAvatar)
        .then((response) {
      if (response.statusCode == 200) {
        // Handle success
        print('User updated successfully');
      } else {
        // Handle failure
        print('User update failed');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Update'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              controller: _avatarController,
              decoration: InputDecoration(
                labelText: 'Avatar',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _handleUpdateUser(context),
              child: Text('Update User'),
            ),
          ],
        ),
      ),
    );
  }
}