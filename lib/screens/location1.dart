import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/home_details.dart';

class LocationSet extends StatefulWidget {
  const LocationSet({Key? key}) : super(key: key);

  @override
  _LocationSetState createState() => _LocationSetState();
}

class _LocationSetState extends State<LocationSet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetails(),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color(0xFF5663FF),
            borderRadius: BorderRadius.circular(16)
          ),
          child: Text("Add",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: GoogleFonts.josefinSans(
                textStyle: const TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    height: 1.2),
              )),
        ),
      ),
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
      body: Column(
        children: [
          SizedBox(height: 90),
          Container(
            margin: const EdgeInsets.only(left: 40, right: 40),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 16, left: 0, right: 10),
                      child: Image(image: AssetImage("assets/images/photo2.jpg")),
                    ),
                    SizedBox(height: 10),
                    Text("Lauren Rochford",
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
                    Text("lauren@email.com",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              height: 1.2),
                        )),
                    const Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Friends",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2),
                                )),
                            Text("388",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                      color: Color(0xFF3E3F68),
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2),
                                )),
                          ],
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Member since",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2),
                                )),
                            Text("2016",
                                textAlign: TextAlign.left,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.josefinSans(
                                  textStyle: const TextStyle(
                                      color: Color(0xFF3E3F68),
                                      fontSize: 40,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2),
                                )),
                          ],
                        ),
                        const Spacer(),
                        const Image(image: AssetImage("assets/images/qr.png"), height: 50, width: 50),
                      ],
                    ),
                    SizedBox(height: 30)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
