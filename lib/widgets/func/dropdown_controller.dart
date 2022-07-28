import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_collection/model/func/quote.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class DropdownController extends GetxController {
  final items = <QuoteModel>[].obs;
  final sort = "All".obs;

  @override
  void onInit() {
    super.onInit();

    _loadItems("All");
  }

  _loadItems(String value) async {
    items.clear();

    final snapshot = await FirebaseFirestore.instance
      .collection("quotes")
      .withConverter<QuoteModel>(
        fromFirestore: (doc, _) => QuoteModel.fromJson({"id": doc.id, ...?doc.data()}), 
        toFirestore: (data, _) => data.toJson(),
      ).get();

    items.addAll(snapshot.docs.map((e) => e.data()));


    List<String> categoryId = [];
    
    for(var e in items) {
      if(e.author == value) {
        categoryId.add(e.author!);
      }
    }

    if(value != "All") {
      items.removeWhere((e) => !categoryId.contains(e.author));
      items.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    }

    log(items.length.toString());
  }

  resort(String value) {
    sort.value = value;
    _loadItems(value);
  }
}

class TabCategory {
  final String text;
  final int value;

  TabCategory({
    required this.text,
    required this.value,
  });
}