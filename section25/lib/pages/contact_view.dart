import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section25/pages/add_contact.dart';
import 'package:section25/providers/contact_view_model.dart';

class ContactView extends StatefulWidget {
  const ContactView({ Key? key }) : super(key: key);

  static const String route = '/contact';

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  static const String route = '/contact';
  @override
  initState() {
    Provider.of<ContactViewModel>(context, listen: false).getAllContacts();
    super.initState();
  }

  Widget body() {
    final modelView = Provider.of<ContactViewModel>(context);
    if (modelView.contactState == ContactState.loading) {
      return CircularProgressIndicator();
    } else if (modelView.contactState == ContactState.none) {
      return ListView.builder(
        itemCount: modelView.contacts.length,
        itemBuilder: (context, index) {
          final contact = modelView.contacts[index];
          return InkWell(
            onTap: () {
              Map<String, dynamic> data = {
                "id": contact.id,
                "name": contact.name,
                "phone": contact.phone,
              };
              Navigator.pushNamed(context, AddContact.route, arguments: data);
            },
            child: ListTile(
              title: Text(contact.name.toString()),
              subtitle: Text(contact.phone.toString()),
            ),
          );
        },
      );
    } else {
      return const Text("Coba lagi!");
    }
  }

  @override
  Widget build(BuildContext context) {
    // pada bagian Build gunakan ViewModel, ambil data contacts, tampilkan pada listview

    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddContact.route);
        },
        child: const Icon(Icons.add),
      ),
      body: Center(child: body()),
    );
  }
}