import 'package:dio/dio.dart';
import 'package:section25/data/models/contacts_model.dart';

class ContactAPI {
  // getContact digunakan untuk mengambil data dari server
  // dengan metode REST API
  // dan mengubah data tersebut kedlaam bentuk class Contact

  static Future<List<Contact>> getContact() async {
    final response = await Dio().get(
        "https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts");

    List<Contact> contacts = (response.data as List)
        .map((e) => Contact(id: e['id'], name: e['name'], phone: e['phone']))
        .toList();

    return contacts;
  }
}