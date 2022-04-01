// ignore_for_file: deprecated_member_use, file_names, unused_import, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Database {
  final dref = FirebaseDatabase.instance.ref();
  void setData(
      String name,
      double topicCategory,
      double topicOne,
      double topicTwo,
      double topicThree,
      double topicFour,
      double topicFive,
      double topicSix,
      double topicSeven) {
    dref
        .child(
      FirebaseAuth.instance.currentUser!.uid.toString(),
    )
        .set({
      'topicCategory': topicCategory,
      'topicOne': topicOne,
      'topicTwo': topicTwo,
      'topicThree': topicThree,
      'topicFour': topicFour,
      'topicFive': topicFive,
      'topicSix': topicSix,
      'topicSeven': topicSeven,
    });
    showData();
  }

  showData() {
    final dref = FirebaseDatabase.instance.ref();

    dref
        .child(FirebaseAuth.instance.currentUser!.uid.toString())
        .child("topicCategory")
        .once()
        .then((snapshot) {
      topicCategory = snapshot.snapshot.value as int;
    });
    dref
        .child(FirebaseAuth.instance.currentUser!.uid.toString())
        .child("topicOne")
        .once()
        .then((snapshot) {
      topicOne = snapshot.snapshot.value as int;
    });
    dref
        .child(FirebaseAuth.instance.currentUser!.uid.toString())
        .child("topicOne")
        .once()
        .then((snapshot) {
      topicTwo = snapshot.snapshot.value as int;
    });
  }
}

var topicCategory = 0;
var topicOne = 0;
var topicTwo = 0;
double monday = 50;
double tuesday = 50;
double wednesday = 50;
double thursday = 50;
double friday = 50;
double saturday = 50;
double sunday = 50;

void setchart(mon, tue, wen, thu, fri, sat, sun) {
  if (DateFormat('EEEE').format(DateTime.now()).toString() == 'Monday') {
    monday *= mon;
    if (monday < 0) {
      monday = 5;
    } else if (monday > 95) {
      monday = 95;
    }
  } else if (DateFormat('EEEE').format(DateTime.now()).toString() ==
      'Tuesday') {
    tuesday *= tue;
    if (tuesday < 0) {
      tuesday = 5;
    } else if (tuesday > 95) {
      tuesday = 95;
    }
  } else if (DateFormat('EEEE').format(DateTime.now()).toString() ==
      'Wednesday') {
    wednesday *= wen;
    if (wednesday < 0) {
      wednesday = 5;
    } else if (wednesday > 95) {
      wednesday = 95;
    }
  } else if (DateFormat('EEEE').format(DateTime.now()).toString() ==
      'Thursday') {
    thursday *= thu;
    if (thursday < 0) {
      thursday = 5;
    } else if (thursday > 95) {
      thursday = 95;
    }
  } else if (DateFormat('EEEE').format(DateTime.now()).toString() == 'Friday') {
    friday *= fri;
    if (friday < 0) {
      friday = 5;
    } else if (friday > 95) {
      friday = 95;
    }
  } else if (DateFormat('EEEE').format(DateTime.now()).toString() ==
      'Saturday') {
    saturday *= sat;
    if (saturday < 5) {
      saturday = 0;
    } else if (saturday > 95) {
      saturday = 95;
    }
  } else if (DateFormat('EEEE').format(DateTime.now()).toString() == 'Sunday') {
    sunday *= sun;
    if (sunday < 0) {
      sunday = 5;
    } else if (sunday > 95) {
      sunday = 95;
    }
  }
}
