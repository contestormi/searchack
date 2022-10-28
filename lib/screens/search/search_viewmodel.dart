import 'package:flutter/material.dart';

class SearchViewModel with ChangeNotifier {
  bool isStrict = false;
  String title = '';
  String sponsorName = '';
  String companyOrganizer = '';
  String description = '';
  String address = '';
  int prizeFundAmount = -1;
  int startDate = 0;
  int endDate = 0;

  void changeIsStrict(bool value) {
    isStrict = value;
    notifyListeners();
  }

  void changeTitle(String value) {
    title = value;
    notifyListeners();
  }

  void changeSponsorName(String value) {
    sponsorName = value;
    notifyListeners();
  }

  void changeCompanyOrganizer(String value) {
    companyOrganizer = value;
    notifyListeners();
  }

  void changeDescription(String value) {
    description = value;
    notifyListeners();
  }

  void changeAddress(String value) {
    address = value;
    notifyListeners();
  }

  void changePrizeFundAmount(int value) {
    prizeFundAmount = value;
    notifyListeners();
  }

  void changeStartDate(int value) {
    startDate = value;
    notifyListeners();
  }

  void changeEndDate(int value) {
    endDate = value;
    notifyListeners();
  }

  void clear() {
    isStrict = false;
    title = '';
    sponsorName = '';
    companyOrganizer = '';
    description = '';
    address = '';
    prizeFundAmount = -1;
    startDate = 0;
    endDate = 0;
    notifyListeners();
  }
}
