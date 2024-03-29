import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section25/pages/add_contact.dart';
import 'package:section25/pages/base_view.dart';
import 'package:section25/pages/contact_view.dart';
import 'package:section25/providers/contact_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ContactViewModel(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          BaseView.route: (context) => const BaseView(),
          //ContactView.route:(context) => const ContactView(),
          // AddContact.route:(context) => AddContact(),
        },
        initialRoute: BaseView.route,
      ),
    );
  }
}