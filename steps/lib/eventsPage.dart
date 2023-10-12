import 'package:flutter/material.dart';
import 'package:steps/loginPage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//Code for events page

class eventsPage extends StatefulWidget {
  const eventsPage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<eventsPage> createState() => _eventsPageState();
}

class _eventsPageState extends State<eventsPage> {
  final List<String> eventNames = [
    'Life Lessons With Top G',
    'Quantum Computing...What\'s that??',
    'Ludo Championship',
    'AI Girlfriends: An undiscovered phenomenon'
  ];
  final List<bool> bookings = [false, false, false, false];
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Book Your Seats"),
        ),
        body: SafeArea(
          child: ListView.builder(
              itemCount: eventNames.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  loginPage(title: "Log In Page")));
                    },
                    child: Text("LogOut"),
                  );
                } else {
                  bool isBooked = bookings[index - 1];
                  return Card(
                    color: Color.fromRGBO(246, 244, 235, 1),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 12, top: 5),
                              child: Image.network(
                                "https://images.unsplash.com/photo-1508515053963-70c7cc39dfb5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2960&q=80",
                                height: 150,
                                width: 150,
                              ),
                            ),
                            Flexible(
                                child: Text(
                              eventNames[index - 1],
                              softWrap: true,
                              maxLines: 2,
                            )),
                          ],
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (!isBooked) {
                                print("You're Booked!!");
                                bookings[index - 1] = true;
                              } else {
                                print("QR Screen");
                                //Backend Connection for storing ticket info and fetching a qr

                              }
                            });
                          },
                          child: Text(isBooked ? "View Ticket" : "Book Seat"),
                        ),
                      ],
                    ),
                  );
                }
              }),
        ));
  }
}
