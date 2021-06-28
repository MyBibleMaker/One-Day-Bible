import 'package:flutter/cupertino.dart';

class Provider with ChangeNotifier {
  String storyTitle;
  String storyValue;
  // ignore: non_constant_identifier_names
  void StoryData(Map args) {
    storyTitle = args["title"];
    storyValue = args["value"];
    print(storyTitle);
    notifyListeners();
  }
}
