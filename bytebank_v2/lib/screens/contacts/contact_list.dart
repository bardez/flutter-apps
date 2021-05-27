import 'package:flutter/material.dart';

import 'contact_form.dart';

class ContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contact")),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: Text(
                'Bardez',
                style: TextStyle(fontSize: 24),
              ),
              subtitle: Text('1000.00', style: TextStyle(fontSize: 16)),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => ContactForm()))
              .then((newContact) => debugPrint(newContact.toString()));
          ;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
