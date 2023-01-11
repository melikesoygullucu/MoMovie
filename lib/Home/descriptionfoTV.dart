import "package:flutter/material.dart";

import '../Utils/fonts.dart';

class DescriptionforTV extends StatefulWidget {
  final String? name;
  final String? description;
  final String? vote;
  final String? bannerurl;

  DescriptionforTV({
    required this.name,
    required this.bannerurl,
    required this.description,
    required this.vote,
  });

  @override
  State<DescriptionforTV> createState() => _DescriptionforTVState();
}

class _DescriptionforTVState extends State<DescriptionforTV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      widget.bannerurl ?? " ?? defaultImageUrl",
                      fit: BoxFit.cover,
                    ),
                  )),
                  Positioned(
                      bottom: 10,
                      child: modified_text(
                          text: 'Avarage Rating: ' + widget.vote.toString(),
                          color: Colors.white,
                          size: 18))
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: widget.name.toString(), color: Colors.white, size: 18),
            ),
            Row(
              children: [
                Flexible(
                  child: Container(
                    child: modified_text(
                        text: widget.description ?? "?? defaultdescription",
                        color: Colors.white,
                        size: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
