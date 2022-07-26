import 'package:flutter/material.dart';
import 'package:ima_web/constants/constants.dart';
import 'package:ima_web/componets/vscroll.dart';
import 'package:ima_web/wrapper/completed_pgm_wrapper.dart';

class Completedpgmviewer extends StatelessWidget {
  Completedpgmviewer({Key? key}) : super(key: key);
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 15,
                  color: secondbg.withOpacity(0.20),
                ),
              ],
              color: primarybg),
          child: ScrollConfiguration(
            behavior: Vscroll(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Completedpgmwrapper(),
            ),
          ),
        ),
      ),
    );
  }
}
