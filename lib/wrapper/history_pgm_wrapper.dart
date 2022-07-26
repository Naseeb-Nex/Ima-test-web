import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ima_web/componets/history_pgm_card.dart';
import 'package:ima_web/constants/constants.dart';

// ignore: must_be_immutable
class Historypgmwrapper extends StatelessWidget {
  String? userid;
  Historypgmwrapper({Key? key, this.userid}) : super(key: key);
  final Stream<QuerySnapshot> studentsStream = FirebaseFirestore.instance
      .collection('history')
      .limit(50)
      .orderBy("docname", descending: true)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              width: double.infinity,
              color: white,
              child: const Center(
                child: CircularProgressIndicator(
                  color: cheryred,
                ),
              ),
            );
          }

          final List _allpgm = [];
          _allpgm.clear();
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            _allpgm.add(a);
            a['uid'] = document.id;
          }).toList();
          return Column(
            children: [
              const SizedBox(
                width: 30,
              ),
              for (var i = 0; i < _allpgm.length; i++) ...[
                Historypgmcard(
                  name: _allpgm[i]["name"],
                  address: _allpgm[i]["address"],
                  loc: _allpgm[i]["loc"],
                  pgm: _allpgm[i]["pgm"],
                  phn: _allpgm[i]["phn"],
                  type: _allpgm[i]["type"],
                  status: _allpgm[i]["status"],
                  upDate: _allpgm[i]["upDate"],
                  upTime: _allpgm[i]["upTime"],
                  techname: _allpgm[i]["techname"],
                  prospec: _allpgm[i]["prospec"],
                  instadate: _allpgm[i]["instadate"],
                  docname: _allpgm[i]["docname"],
                  ch: _allpgm[i]["ch"],
                  chrg: _allpgm[i]["chrg"],
                  collection: _allpgm[i]["collection"],
                  remark: _allpgm[i]["remarks"],
                )
              ]
            ],
          );
        });
  }
}
