import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesProvider extends ChangeNotifier {
  List<String> categories = ["Residential", "Shop", "Office"];
  List<IconData> categoriesImagesLink = [
    Icons.room,
    FontAwesomeIcons.shop,
    Icons.local_post_office,
  ];
  String selectedCategory = "Residential";

  void changeCategory(int index) {
    selectedCategory = categories[index];
    notifyListeners();
  }
}
