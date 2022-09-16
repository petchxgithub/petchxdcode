import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petchxdecode/const.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: Text(
          "About Me",
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
                  height: 150,
                  width: 320,
                  child: NeumorphicButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () {},
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(20),
                      ),
                      depth: 4,
                      lightSource: LightSource.topLeft,
                      surfaceIntensity: 0,
                      shadowDarkColor: shadowDark,
                      shadowLightColor: Colors.white,
                      color: bg,
                    ),
                    child: Image.asset('assets/images/bg.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Instagram(),
                    SizedBox(
                      width: 20,
                    ),
                    Birthday(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Schools(
                      image: "assets/images/pichayasuksa.png",
                      school: "Pichayasuksa School",
                      years: "2007 - 2015",
                      link: "https://www.pichaya.ac.th",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Schools(
                      image: "assets/images/stPauls.png",
                      school: "St.Paul's School",
                      years: "2015 - 2021",
                      link: "https://stpaulsdarjeeling.edu.in",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Schools(
                      image: "assets/images/abac.png",
                      school: "Assumption University",
                      years: "2007 - 2015",
                      link: "https://www.au.edu",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Skills(
                      image: "assets/images/flutter.png",
                      name: "Flutter",
                      link: "https://flutter.dev",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Skills(
                      image: "assets/images/figma.png",
                      name: "Figma",
                      link: "https://www.figma.com",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      height: 150,
                      width: 150,
                    )
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  String image;
  String name;
  String link;
  Skills({
    Key? key,
    required this.image,
    required this.name,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: NeumorphicButton(
        padding: EdgeInsets.all(0),
        onPressed: () async {
          await launchUrl(Uri.parse(link));
        },
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(10),
          ),
          depth: 4,
          lightSource: LightSource.topLeft,
          surfaceIntensity: 0,
          shadowDarkColor: shadowDark,
          shadowLightColor: Colors.white,
          color: bg,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              width: 12,
            ),
            Text(
              name,
              style: GoogleFonts.sora(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class Schools extends StatelessWidget {
  String image = "";
  String school = "";
  String years = "";
  String link = "";
  Schools({
    Key? key,
    required this.image,
    required this.school,
    required this.years,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: NeumorphicButton(
        onPressed: () async {
          await launchUrl(Uri.parse(link));
        },
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(10),
          ),
          depth: 4,
          lightSource: LightSource.topLeft,
          surfaceIntensity: 0,
          shadowDarkColor: shadowDark,
          shadowLightColor: Colors.white,
          color: bg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image),
            SizedBox(
              height: 8,
            ),
            Text(
              school,
              style: GoogleFonts.sora(color: Colors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            Text(
              years,
              style: GoogleFonts.sora(color: grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class Birthday extends StatelessWidget {
  const Birthday({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: NeumorphicButton(
        onPressed: () {},
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(10),
          ),
          depth: 4,
          lightSource: LightSource.topLeft,
          surfaceIntensity: 0,
          shadowDarkColor: shadowDark,
          shadowLightColor: Colors.white,
          color: bg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FRIDAY",
                  style: GoogleFonts.sora(color: red, fontSize: 12),
                ),
                Text(
                  "2003",
                  style: GoogleFonts.sora(color: Colors.black, fontSize: 12),
                ),
              ],
            ),
            SizedBox(
              height: 3,
            ),
            Text(
              "24",
              style: GoogleFonts.sora(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Container(
                  height: 36,
                  width: 4,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  height: 36,
                  width: 100,
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(4),
                      ),
                      depth: -4,
                      lightSource: LightSource.topLeft,
                      surfaceIntensity: 0,
                      shadowDarkColor: shadowDark,
                      shadowLightColor: Colors.white,
                      color: bg,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "My Birthday!",
                          style: GoogleFonts.sora(
                              color: Colors.black, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Instagram extends StatelessWidget {
  const Instagram({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: NeumorphicButton(
        onPressed: () async {
          await launchUrl(Uri.parse('https://www.instagram.com/petchxig/'));
        },
        style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(
            BorderRadius.circular(10),
          ),
          depth: 4,
          lightSource: LightSource.topLeft,
          surfaceIntensity: 0,
          shadowDarkColor: shadowDark,
          shadowLightColor: Colors.white,
          color: bg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "profile",
              child: Container(
                height: 65,
                width: 65,
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
                  child: Image.asset('assets/images/ig.png'),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Instagram",
              style: GoogleFonts.sora(color: Colors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            Text(
              "Petchxig",
              style: GoogleFonts.sora(color: grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
