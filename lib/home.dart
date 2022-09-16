import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petchxdecode/aboutMe.dart';
import 'package:petchxdecode/const.dart';
import 'package:http/http.dart' as http;
import 'package:petchxdecode/dcode.dart';
import 'package:petchxdecode/projects.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Header(),
              SizedBox(
                height: 20,
              ),
              Spotify(),
              Buttons(),
              SizedBox(
                height: 50,
              ),
              // Icon(
              //   Icons.keyboard_arrow_down_outlined,
              //   size: 30,
              // )
            ],
          ),
        ),
      )),
    );
  }
}

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AboutMe()));
          },
          child: Hero(
            tag: "profile",
            child: Container(
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
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Panuphong Burakitphachai",
          style: GoogleFonts.sora(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        Text(
          "Application Developer",
          style: GoogleFonts.sora(fontSize: 12, color: grey),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: 300,
          child: Text(
            "My name is Panuphong Burakitphachai or Petch. I was born on  January 24, 2003. I studied my high school in St.Paul’s School in India. However, now I studying in Assumption University, Thailand.",
            style: GoogleFonts.sora(fontSize: 12),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class Spotify extends StatefulWidget {
  const Spotify({Key? key}) : super(key: key);

  @override
  State<Spotify> createState() => _SpotifyState();
}

class _SpotifyState extends State<Spotify> {
  String img = "";
  bool isSpotify = false;
  bool temp = true;
  Map spotify = {};

  Stream getSong() async* {
    yield* Stream.periodic(Duration(milliseconds: 1000), (_) {
      var data = getData();
      return data;
    });
  }

  Future getData() async {
    var url = Uri.parse('https://panuphong.com/spotify/get-current-track.php');
    var response = await http.get(url);

    if (response.body != "error" && response.body != "") {
      var result = json.decode(response.body);
      spotify = {
        'name': result["item"]['name'],
        'artist': List.generate(result["item"]["artists"].length ?? 0,
            (index) => result['item']['artists'][index]['name']).join(', '),
        'image': result["item"]['album']['images'][0]['url'] ?? "",
        'link': result['item']['external_urls']['spotify'] ?? "",
        'isPlaying': result['is_playing'] ?? false,
      };
      if (spotify['image'] != img) {
        setState(() {
          isSpotify = true;
          img = spotify['image'];
        });
      }
      if (spotify['isPlaying'] == false) {
        setState(() {
          isSpotify = false;
        });
      } else {
        if (this.mounted) {
          setState(() {
            isSpotify = true;
          });
        }
      }
    } else {
      setState(() {
        isSpotify = false;
      });
    }
    return spotify;
  }

  @override
  Widget build(BuildContext context) {
    return isSpotify == true
        ? Container(
            height: 75,
            width: 250,
            margin: EdgeInsets.only(bottom: 30),
            child: NeumorphicButton(
              onPressed: () async {
                await launchUrl(Uri.parse(spotify['link']));
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.concave,
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
                depth: 4,
                lightSource: LightSource.topLeft,
                surfaceIntensity: 0,
                shadowDarkColor: shadowDark,
                shadowLightColor: Colors.white,
                color: bg,
              ),
              child: Row(
                children: [
                  Container(
                    height: 52,
                    width: 52,
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.rect(),
                        depth: -4,
                        lightSource: LightSource.topLeft,
                        surfaceIntensity: 0,
                        shadowDarkColor: shadowDark,
                        shadowLightColor: Colors.white,
                        color: bg,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.network(
                          spotify['image'],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                        stream: getSong(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (img != "") {
                              return Container(
                                width: 140,
                                child: Text(
                                  "${spotify['name']} · ${spotify['artist']}",
                                  style: GoogleFonts.sora(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }
                          }
                          return Container();
                        },
                      ),
                      Text(
                        "Listening on Spotify",
                        style: GoogleFonts.sora(fontSize: 10, color: grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        : StreamBuilder(
            stream: getSong(),
            builder: (context, snapshot) {
              return Container();
            },
          );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 65,
              width: 65,
              child: NeumorphicButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => AboutMe()));
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 4,
                  lightSource: LightSource.topLeft,
                  surfaceIntensity: 0,
                  shadowDarkColor: shadowDark,
                  shadowLightColor: Colors.white,
                  color: bg,
                ),
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.diamond_outlined,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "About me",
              style: GoogleFonts.sora(fontSize: 12),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              height: 65,
              width: 65,
              child: NeumorphicButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Projects()));
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 4,
                  lightSource: LightSource.topLeft,
                  surfaceIntensity: 0,
                  shadowDarkColor: shadowDark,
                  shadowLightColor: Colors.white,
                  color: bg,
                ),
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.account_tree_outlined,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Projects",
              style: GoogleFonts.sora(fontSize: 12),
            )
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Container(
              height: 65,
              width: 65,
              child: NeumorphicButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => Dcoder()));
                },
                style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 4,
                  lightSource: LightSource.topLeft,
                  surfaceIntensity: 0,
                  shadowDarkColor: shadowDark,
                  shadowLightColor: Colors.white,
                  color: bg,
                ),
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  Icons.code_outlined,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Dcode",
              style: GoogleFonts.sora(fontSize: 12),
            )
          ],
        ),
      ],
    );
  }
}
