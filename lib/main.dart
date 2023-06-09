import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/home.dart';
import 'package:provider_api/provider/userlist_data_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserListDataProvider(),
        )
      ],
      child: MaterialApp(home: Home()),
    );
  }
}
