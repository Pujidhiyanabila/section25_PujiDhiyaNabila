import 'package:flutter/material.dart';
import 'package:section25/data/models/contacts_model.dart';
import 'package:section25/data/services/contact_api.dart';

enum ContactState {
  none,
  loading,
  error,
}

class ContactViewModel with ChangeNotifier {
  ContactState _contactState = ContactState.none;
  ContactState get contactState => _contactState;

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  getAllContacts() async {
    changeState(ContactState.loading);
    try {
      final c = await ContactAPI.getContact();
      _contacts = c;
      changeState(ContactState.none);
    } catch (e) {
      changeState(ContactState.error);
    }
    notifyListeners();
  }

  editContact(int id, String nama, String phone) {
    final Contact tambah = contacts.firstWhere((element) => element.id == id);

    tambah.name = nama;
    tambah.phone = phone;
    notifyListeners();
  }

  addContact(int id, String nama, String phone) {
    _contacts.add(Contact(
      id: id,
      name: nama,
      phone: phone,
    ));
    notifyListeners();
  }

  changeState(ContactState contactState) {
    _contactState = contactState;
    notifyListeners();
  }
}
