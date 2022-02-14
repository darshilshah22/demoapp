import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/home_screen.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({Key? key}) : super(key: key);

  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  int color = 0xFF5663FF;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Text(
                'Hi Jeet,\nWelcome to \nGathrr!',
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                    height: 1.2,
                    fontSize: 60,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF5663FF)
                  )
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 40, top: 60),
              child: Text(
                  'Please turn on your GPS to find out better events suggestions\nnear you.',
                  style: GoogleFonts.josefinSans(
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          color: Color(color)
                      )
                  )
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 36, right: 36, top: 60, bottom: 30),
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Color(color),
                ),
                child: Text(
                    'Turn On GPS',
                    style: GoogleFonts.josefinSans(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFFFFFF)
                        )
                    )
                ),
              ),
            ),
          ],
        )));
  }
}
