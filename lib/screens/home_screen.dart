
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'location1.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<String> images = [
    "assets/images/image1.png",
    "assets/images/img2.png",
    "assets/images/img3.png",
    "assets/images/img4.png",
    "assets/images/img5.png",
    "assets/images/img6.png",
    "assets/images/img7.png",
  ];
  late TabController _tabController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(0, 0),
                    blurRadius: 10)
              ]),
          child: TabBar(
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            indicator: const BoxDecoration(),
            tabs: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LocationSet(),
                    ),
                  );
                },
                child: Tab(
                    child: Icon(Icons.home_filled, color: currentIndex == 0
                        ? const Color(0xFF5663FF)
                        : Colors.black)),
              ),
              Tab(
                  child: SvgPicture.asset("assets/images/pin.svg", height: 20, width: 20, color: currentIndex == 1
                      ? const Color(0xFF5663FF)
                      : Colors.black)),
              Tab(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF5663FF),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  )),
              Tab(
                  child: Icon(Icons.notifications_none_outlined, color: currentIndex == 3
                      ? const Color(0xFF5663FF)
                      : Colors.black)),
              Tab(
                  child: Icon(Icons.perm_identity, color: currentIndex == 4
                      ? const Color(0xFF5663FF)
                      : Colors.black)),
            ],
            controller: _tabController,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset('assets/images/delete.svg', height: 20, width: 20),
                    const SizedBox(width: 10),
                    SvgPicture.asset('assets/images/settings.svg', height: 20, width: 20),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 350,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: smallCard()),
                    );
                  },
                ),
              ),
              _buildCategory(),
              _buildNetwork()
            ],
          ),
        ),
      ),
    );
  }

  Widget smallCard() {
    var width = MediaQuery.of(context).size.width * 0.95;
    var height = width * 0.3;
    return Container(
        height: height + 50,
        width: width,
        child: Stack(
          children: <Widget>[
            Positioned.fill(
                child: Image.asset('assets/images/photo2.jpg', height: height+40, width: width, fit: BoxFit.cover, filterQuality: FilterQuality.high)
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  height: 110,
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 12, left: 12),
                              child: Text(
                                "Pune Meetup",
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
                            ),
                            Container(
                              width: 100,
                              margin: const EdgeInsets.only(top: 12, left: 12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white)
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 40,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white)
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                          'assets/images/photo2.jpg'
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white)
                                      ),
                                      child: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/photo2.jpg'
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white)
                                    ),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          'assets/images/photo2.jpg'
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]),
                      Container(
                        alignment: Alignment.bottomLeft,
                        margin: EdgeInsets.only(top: 6, left: 12),
                        child: Text(
                            "Bhau Institute, Shivajinagar, Pune",
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
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  Widget _buildCategory(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 12),
                child: Text(
                    "Category",
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
              Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 12),
                child: Text(
                    "See all (9)",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                          color: Color(0xFF3E3F68),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          height: 1.2),
                    )
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.topCenter,
                        image: AssetImage("assets/images/photo2.jpg")
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                        "Meetup",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.2),
                        )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage("assets/images/photo2.jpg")
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                        "StartUp",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.2),
                        )
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, top: 20),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.topCenter,
                          image: AssetImage("assets/images/photo2.jpg")
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Text(
                        "College",
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.josefinSans(
                          textStyle: const TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.2),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNetwork(){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 12),
                child: Text(
                    "My Network",
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
              Spacer(),
              Container(
                margin: const EdgeInsets.only(top: 20, right: 12),
                child: Text(
                    "See all (56)",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                          color: Color(0xFF3E3F68),
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          height: 1.2),
                    )
                ),
              ),
            ],
          ),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index){
                return Container(
                  margin: const EdgeInsets.only(left: 20, top: 20),
                  height: 50,
                  width: 50,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        images[index]
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
