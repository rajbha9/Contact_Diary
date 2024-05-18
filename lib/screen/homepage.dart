import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:provider/provider.dart';

import '../providar_data.dart';

class Homapage extends StatelessWidget {
  const Homapage({super.key});

  @override
  Widget build(BuildContext context) {
    var adddata = Provider.of<Providar_Data>(context);
    var adddataFalse = Provider.of<Providar_Data>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_rounded),
          ),
          IconButton(
            onPressed: () async {
              // LocalAuthentication localAuth = LocalAuthentication();
              // if (await localAuth.canCheckBiometrics &&
              //     await localAuth.isDeviceSupported()) {
              //   localAuth
              //       .authenticate(localizedReason: 'Unlock Hidden Contacts')
              //       .then(
              //     (value) {
              //       Navigator.of(context).pushNamed('hide');
              //     },
              //   );
              // }
              Navigator.of(context).pushNamed('hide');
            },
            icon: const Icon(Icons.lock),
          ),
          IconButton(
              onPressed: () {
                Provider.of<Providar_Data>(context, listen: false)
                    .changeThemeData();
              },
              icon: const Icon(Icons.change_circle))
        ],
        title: const Text(
          'Contacts',
          style: TextStyle(fontSize: 25),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return const Alert();
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(8),
        child: ListView(
            children: adddata.contacts.map(
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
                        adddataFalse.hidedata(e);
                      },
                      icon: Icon(Icons.remove_red_eye_outlined),
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

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    var adddata = Provider.of<Providar_Data>(context);
    var adddataFalse = Provider.of<Providar_Data>(context, listen: false);
    return AlertDialog(
      content: SizedBox(
        height: 450,
        width: 450,
        child: Stepper(
          currentStep: adddata.curentStep,
          controlsBuilder: (context, details) {
            if (adddata.curentStep == 0) {
              return Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      adddataFalse.nextstep();
                    },
                    child: const Text('Continue'),
                  ),
                ],
              );
            } else if (adddata.curentStep == 3) {
              return Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      adddata.curentStep = 0;
                      adddata.chakeFild();
                      Navigator.pop(context);
                    },
                    child: const Text('Finish'),
                  ),
                  TextButton(
                    onPressed: () {
                      adddataFalse.backstep();
                    },
                    child: const Text('Cancel'),
                  )
                ],
              );
            } else {
              return Column(
                children: [
                  FilledButton(
                    onPressed: () {
                      adddataFalse.nextstep();
                    },
                    child: const Text('Continue'),
                  ),
                  TextButton(
                    onPressed: () {
                      adddataFalse.backstep();
                    },
                    child: const Text('Cancel'),
                  )
                ],
              );
            }
          },
          steps: [
            Step(
              title: const Text('Photo'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (adddata.picImage == null)
                      ? CircleAvatar(
                          radius: 30,
                          child: FlutterLogo(),
                        )
                      : CircleAvatar(
                          radius: 30,
                          backgroundImage: FileImage(adddata.picImage!),
                        ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          adddataFalse.galleryimg();
                        },
                        mini: true,
                        child: const Icon(Icons.image),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          adddataFalse.cameraimg();
                        },
                        mini: true,
                        child: const Icon(Icons.camera),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Step(
              title: const Text('Name'),
              content: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add Name'),
                controller: adddata.NameController,
              ),
            ),
            Step(
              title: const Text('Phone Number '),
              content: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add Number'),
                controller: adddata.PhoneController,
                keyboardType: TextInputType.phone,
              ),
            ),
            Step(
              title: const Text('Email'),
              content: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add Name'),
                controller: adddata.EmailController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
