import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/find_friend.dart';

class HomeDetails extends StatefulWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  _HomeDetailsState createState() => _HomeDetailsState();
}

class _HomeDetailsState extends State<HomeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading:
          InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.chevron_left, color: Colors.black, size: 40)),
          title: Text("Ongoing Event",
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
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.share, color: Colors.grey, size: 30),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: SvgPicture.asset('assets/images/pin.svg', color: Colors.grey, height: 25),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset("assets/images/photo2.jpg"),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Image.asset("assets/images/check.png", height: 30, width: 30),
                      SizedBox(width: 10),
                      Text("+91 212-673-3754",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.josefinSans(
                            textStyle: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                height: 1.2),
                          )),
                      SizedBox(width: 10),
                      Image.asset("assets/images/direction.png", height: 30, width: 30),
                      SizedBox(width: 10),
                      Text("Direction",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.josefinSans(
                            textStyle: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                height: 1.2),
                          )),
                    ],
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 90,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(top: 12, left: 12),
                          child: Text(
                              "Happy Bones",
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                    color: Color(0xFF3E3F68),
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2),
                              )
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12, left: 12),
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                              "Paid",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    height: 1.2),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12, left: 12),
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF848DFF),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: Text(
                              "1.2 km",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.josefinSans(
                                textStyle: const TextStyle(
                                    color: Color(0xFFFFFFFF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    height: 1.2),
                              )),
                        )
                      ]),
                  Container(
                    alignment: Alignment.bottomLeft,
                    margin: EdgeInsets.only(top: 12, left: 12),
                    child: Text(
                        "394 Broome St, New York, NY 10013, USA",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                              color: Color(0xFF8A98BA),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 1.2),
                        )
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(top: 0, left: 12),
              child: Text(
                  "Active Now",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.2),
                  )
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.only(top: 4, left: 12),
              child: Text(
                  "9:30 am to 11:00 am",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        color: Color(0xFF8A98BA),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.2),
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 12),
              child: Text(
                  "Navigation",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        color: Color(0xFF3E3F68),
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        height: 1.2),
                  )
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FindFriends(),
                  ),
                );
              },
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  color: const Color(0xFF5663FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black.withOpacity(0.1))
                ),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GridTile(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.calendar_today_outlined),
                            Text('Hello'),
                          ],
                        ),
                      ), //just for testing, will fill with image later
                    );
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 12),
              child: Text(
                  "Description",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        color: Color(0xFF3E3F68),
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        height: 1.2),
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16, left: 12, bottom: 20),
              child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: GoogleFonts.josefinSans(
                    textStyle: const TextStyle(
                        color: Color(0xFF3E3F68),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        height: 1.2),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
