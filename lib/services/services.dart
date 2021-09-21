class MyServices {
  static Future<String> getImage() async {
    await Future.delayed(Duration(seconds: 5));
    return "assets/images/business.jpg";
  }
}
