import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petchxdecode/const.dart';

class Dcoder extends StatelessWidget {
  const Dcoder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: Text(
          "Dcode",
          style: GoogleFonts.sora(color: Colors.black, fontSize: 16),
        ),
        leading: BackButton(color: Colors.black),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 230,
                  width: 230,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.circle(),
                        depth: 4,
                        lightSource: LightSource.topLeft,
                        surfaceIntensity: 0,
                        shadowDarkColor: shadowDark,
                        shadowLightColor: Colors.white,
                        color: bg),
                    child: Image.asset('assets/images/dcoder.png'),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  width: 300,
                  child: Text(
                    "I want to be a part of D*CODE  research laboratory member because I am interesting in developing a mobile application (Ios, Android and Web Application). I like every part of developing like Ux/Ui designing, Front-end, Back-end and more. However, I think that D*CODE can give me a lot of experience and I am ready to learn new thing. Finally, in my opinion, the courses that the university provided is boring because everything is in the box, I just want to create something big on my own and D*CODE is for me.",
                    style: GoogleFonts.sora(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
