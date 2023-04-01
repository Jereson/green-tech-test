import 'package:logger/logger.dart';

final logger = Logger();

const baseUrl = 'https://green-tech-group-three.onrender.com/api/v1';
const flutterwaveInitPaymentUrl   = 'https://api.paystack.co/transaction/initialize';

const flutterwaveTestKey ='sk_test_509502af41592489384d9225bfa6984aded7da3f';
const String serverErrorMessage =
    "Internal Server Error. Please try again later.";
const String networkErrorMessage =
    "Check your internet connection and try again";
const String unknonError = "Error occured try again later";
const String timeOutError = 'Timeout, please try again!';

const Duration dbTimeOut = Duration(seconds: 20);
