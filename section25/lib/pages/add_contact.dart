import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:section25/providers/contact_view_model.dart';

class AddContact extends StatefulWidget {
  AddContact({Key? key}) : super(key: key);

  static const String route = '/addContact';

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController inputNama = TextEditingController();
  TextEditingController inputHp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    bool isEdit = data == null ? false : true;
    if (isEdit) {
      inputNama.text = data["name"];
      inputHp.text = data["phone"];
    }

    final modelView = Provider.of<ContactViewModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextFormField(
              // untuk pasang variabel yang akan digunakan
              controller: inputNama,
              decoration: const InputDecoration(
                label: Text("Nama"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            TextFormField(
                controller: inputHp,
                decoration: const InputDecoration(
                  label: Text("Nomor HP"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]),
            ElevatedButton(
              onPressed: () {
                if (isEdit) {
                  modelView.editContact(
                      data["id"], inputNama.text, inputHp.text);
                } else {
                  modelView.addContact(
                      DateTime.now().millisecond, inputNama.text, inputHp.text);
                }

                Navigator.pop(context);
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
