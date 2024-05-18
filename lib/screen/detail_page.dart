import 'package:contact_diary/modalClass.dart';
import 'package:contact_diary/providar_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    contact contectdata = ModalRoute.of(context)!.settings.arguments as contact;
    var adddata = Provider.of<Providar_Data>(context);
    var adddataFalse = Provider.of<Providar_Data>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Details"),
        actions: [
          IconButton(
            onPressed: () {
              adddataFalse.NameController.text = contectdata.name;
              adddataFalse.EmailController.text = contectdata.email;
              adddataFalse.PhoneController.text = contectdata.number;
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Edit Contact"),
                    actions: [
                      OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel")),
                      ElevatedButton(
                          onPressed: () {
                            adddataFalse.updateContact(
                                contectdata,
                                adddataFalse.NameController.text,
                                adddataFalse.PhoneController.text,
                                adddataFalse.EmailController.text);
                            Navigator.pop(context);
                          },
                          child: const Text("Done")),
                    ],
                    content: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Name"),
                          TextField(
                            controller: adddataFalse.NameController,
                            keyboardType: TextInputType.text,
                          ),
                          const SizedBox(height: 10),
                          const Text("Contact"),
                          TextField(
                            maxLength: 10,
                            keyboardType: TextInputType.phone,
                            controller: adddataFalse.PhoneController,
                          ),
                          const Text("Email"),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            controller: adddataFalse.EmailController,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.ios_share_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://t4.ftcdn.net/jpg/05/11/55/91/360_F_511559113_UTxNAE1EP40z1qZ8hIzGNrB0LwqwjruK.jpg'),
                      maxRadius: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          contectdata.name,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(contectdata.email),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            contectdata.number,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            child: IconButton(
                                onPressed: () async {
                                  final Uri url =
                                      Uri.parse('tel:${contectdata.number}');
                                  await launchUrl(url);
                                },
                                icon: const Icon(
                                  Icons.call_outlined,
                                )),
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.video_call_outlined,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          CircleAvatar(
                            child: IconButton(
                              onPressed: () async {
                                final Uri url =
                                    Uri.parse('sms:${contectdata.number}');
                                await launchUrl(url);
                              },
                              icon: const Icon(
                                Icons.messenger_outline_outlined,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text(
                            "Call logs",
                            style: TextStyle(fontSize: 18),
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('calllog');
                              },
                              icon: const Icon(Icons.keyboard_arrow_right)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('Select_Group');
                        },
                        child: const Text(
                          "Not in groups",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const Text(
                        "Groups",
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: 160,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 20),
                                    const Text(
                                      "Ringtone",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 1,
                                      color: Colors.white10,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Default rintone",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      height: 0.1,
                                      width: 320,
                                      color: Colors.white70,
                                    ),
                                    const SizedBox(height: 10),
                                    const Text(
                                      "phone ringtone",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Default ringtone",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      const Text(
                        "Ringtone",
                      ),
                      const SizedBox(height: 50),
                      InkWell(
                        onTap: () {
                          adddata.deletecontact(contectdata);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Delete Contact",
                          style: TextStyle(fontSize: 18, color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
