import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/model/userlist_data_model.dart';
import 'package:provider_api/provider/userlist_data_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserDataModel? userDataModel;
  @override
  void initState() {
    getList(context);
    super.initState();
  }

  Future<void> getList(BuildContext context) async {
    userDataModel =
        await Provider.of<UserListDataProvider>(context, listen: false)
            .getdata(context);

    if (!mounted) return;
    print(userDataModel);

    Provider.of<UserListDataProvider>(context, listen: false)
        .setModelData(userDataModel!);
    if (userDataModel != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: userDataModel!.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(userDataModel!.data![index].name.toString()),
              );
            }));
  }
}
