import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'api.dart';

class FindFriends extends StatefulWidget {
  const FindFriends({Key? key}) : super(key: key);

  @override
  _FindFriendsState createState() => _FindFriendsState();
}

class _FindFriendsState extends State<FindFriends> {

  int? i;
  bool isRequest = false;
  List<User> users = [];

  Future<void> usersAll() async {
    users = [];
    List<User> newMer = await API.getUsers();
    print(newMer.length);
    if(newMer.isNotEmpty){
      users = newMer;
    }
    setState(() {});
  }

  @override
  void initState() {
    usersAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading:
          const Icon(Icons.chevron_left, color: Colors.black, size: 40),
          title: Text("Save Card",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                    color: Color(0xFF3E3F68),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    height: 1.2),
              )),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.close, color: Colors.grey, size: 40),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 0, left: 20, right: 26),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: users.length,
            itemBuilder: (context, index) {
              bool checked = index == i;
              return Container(
                margin:
                const EdgeInsets.only(top: 5, right: 5, bottom: 26),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(users[index].url!),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          users[index].firstname! + " " + users[index].lastname!,
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          )
                        ),
                        Text(
                            users[index].email!,
                            style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            )
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: (){

                      },
                      child: index == 4
                          ? _buildButton(0, 0, 10, "Follow", index)
                          : _buildButton(0, 4, 6, "Unfollow", index),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      double dx, double dy, double br, String string, int index) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: Offset(dx, dy),
              blurRadius: br)
        ],
        color: Colors.grey,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [1,1],
            colors: [
              index == 4 ? Colors.transparent : Colors.blue,
              Colors.blue,
            ]),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        decoration: BoxDecoration(
          color: Colors.black,
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0.4),
                Colors.white.withOpacity(0.08),
              ],
              stops: const [0, 1]
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
            string,
            style: GoogleFonts.josefinSans(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            )
        ),
      ),
    );
  }
}
