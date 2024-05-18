import 'package:contact_diary/providar_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HidePage extends StatelessWidget {
  const HidePage({super.key});

  @override
  Widget build(BuildContext context) {
    var adddata = Provider.of<Providar_Data>(context);
    var adddataFalse = Provider.of<Providar_Data>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiden Contact'),
      ),
      body: Container(
        child: ListView(
            children: adddata.hidecontact.map(
          (e) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed('detail', arguments: e);
                },
                title: Text(e.name),
                leading: (e.imgpic == null)
                    ? CircleAvatar(
                        child: FlutterLogo(),
                      )
                    : CircleAvatar(
                        backgroundImage: FileImage(e.imgpic!),
                      ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        adddataFalse.deletecontact(e);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        adddataFalse.unhidedata(e);
                      },
                      icon: Icon(Icons.hide_source),
                    ),
                  ],
                ),
                subtitle: Text(e.number),
              ),
            );
          },
        ).toList()),
      ),
    );
  }
}
