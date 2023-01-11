import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class modified_text extends StatelessWidget {
  //const modified_text({Key? key}) : super(key: key);
  final String text;
  final Color color;
  final double size;

  modified_text({required this.text, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.anton(color: color, fontSize: size),
    );
  }
}
