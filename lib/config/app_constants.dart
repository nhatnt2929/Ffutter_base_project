class AppConstants {
  const AppConstants._();

  static const int numberSecondDelayMatchind = 2;
  static const int maxLengthScanItem = 60;
  static const int timeoutLoading = 10;
}

class RegexValidations {
  const RegexValidations._();
  static const String haftWidth =
      r'^[a-z｡-ﾝﾞﾟA-Z0-9!"/$#%&()_<=>:[\]^;?@*+,.{`|}¥~ -]+$';
  static const String number = r'^(\d+)?\.?\d{0,2}';
}
