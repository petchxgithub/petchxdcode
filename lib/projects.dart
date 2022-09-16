import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petchxdecode/const.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: bg,
        elevation: 0,
        title: Text(
          "Projects",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProjectCards(
                      image: "assets/images/jobday.png",
                      name: "Jobday",
                      description: "Ios and Android",
                      link:
                          "https://apps.apple.com/th/app/job-day/id1573934242",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ProjectCards(
                      image: "assets/images/promptpay.png",
                      name: "Promptpay",
                      description: "Web Application",
                      link: "https://panuphong.com/app/promptpay/#/",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProjectCards(
                      image: "assets/images/petchx.png",
                      name: "Petchx V.1",
                      description: "Web Application",
                      link: "https://panuphong.com/petch/#/",
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ProjectCards(
                      image: "assets/images/petchx.png",
                      name: "Petchx V.2",
                      description: "Web Application",
                      link: "https://panuphong.com/petchx/#/",
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ProjectCards(
                      image: "assets/images/triptopluto.png",
                      name: "Trip to Pluto",
                      description: "Web Application",
                      link: "https://panuphong.com/triptopluto/#/",
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

class ProjectCards extends StatelessWidget {
  String image;
  String name;
  String description;
  String link;
  ProjectCards({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
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
              name,
              style: GoogleFonts.sora(color: Colors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            Text(
              description,
              style: GoogleFonts.sora(color: grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
