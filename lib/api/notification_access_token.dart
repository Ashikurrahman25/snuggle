import 'dart:developer';

import 'package:googleapis_auth/auth_io.dart';

class NotificationAccessToken {
  static String? _token;

  //to generate token only once for an app run
  static Future<String?> get getToken async => _token ?? await _getAccessToken();

  // to get admin bearer token
  static Future<String?> _getAccessToken() async {
    try {
      const fMessagingScope =
          'https://www.googleapis.com/auth/firebase.messaging';

      final client = await clientViaServiceAccount(
        // To get Admin Json File: Go to Firebase > Project Settings > Service Accounts
        // > Click on 'Generate new private key' Btn & Json file will be downloaded

        // Paste Your Generated Json File Content
        ServiceAccountCredentials.fromJson({
         "type": "service_account",
  "project_id": "ownchat-8ba71",
  "private_key_id": "c0780c7660729e5f603120d2b1ab07872d8644ab",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCUz/l9wc7Hu2l4\nF8sHdNHycsg+WHoO5amWqBWzvCObGGIOFVP2MJGmuVk5DUH16vN0zes3bC+k3q8P\ndw3sYPgJfpYuDdRDTSS3qCj0MiRv6F7s7A1jbn7189Pqlc7r2qdTt+FRcuDPE4zJ\nGdLxTUTD4pGzz6LAFuG6AT/oKu/6yuG48SzkKMWjc92jvulcBr+dYPq9YR6N+raD\nLcWB6TkD0WW3PSI75/gl5K/1wvxWSR4KM0n8HpsAFWPH/m6OupX4i/CU0oRIWml+\nICMMKIYFPNvltibsamKJIAwZpldog13+Yrvia7k/Z/qYpFwwvgIIlwZD26mgm+wh\nV7CFLgbrAgMBAAECggEAAjTqpQqXMjoIEIUAeJNVu6vSZq5G3RVbGZtTew9VUyrz\nj/Q8AwC/CthhHNSiqkQPfnzBOgNWL4fdKQm3FflteYKRioxKSKyKWK4whp0pvNPB\neJpFgTh1vy2cR7Rsqu2v9oYEXCyrwxZYoPDLl9LGrBrzgIBEkGb7y5d80Z4Kt07T\na7Lweai39BolISYqFgYWmN7pAbXP+65iW5gA5PdrSLRo617b0cm9dgUoqNuHg+gI\npQi1Y8rXGBZ/CHFm3ZaTn4fcQyTAQpQOzWx9JiRrmnZJQ9HffxMI0VxW05Aq+X1A\nGucXIjoHLKHVOzwn01R3W203pH2l8/9sZz0lj+jA1QKBgQDFvzJSzU7gViQJjePo\nDPcbcYnT9CHR5Ik+BWjWIRWKQ4uCvcwj1mUcLPPwjiWObbx1pCaWBe0aZIdQf26y\nP3qLlEXCZvAkRvXDGHpovc9PJzTZQQ9cQfFu34vAlOHKfPE15uxtNvNfp5pVy+cN\nMgtuwdwUPAEb2eZCC+o5BdrjrQKBgQDApnQ23/cEkIB0yBz5RNRiSIHhNizPJOPq\njsvf+eEB082D2ZUIPHIngVw4LaghnxYbAyFbik5rr0mkZlhWD7zCDgIvUdZqMSn7\nkwKyGwHeslUtKFM0T6DjZuSLd6+kf69qTSX0aLHNMSfQKIbwvQd6lkNsKJ3k7f3e\nEPrugSEn9wKBgQCmEJv1V39+/DhFYchcbs7yWBYUTng8aT0sPaS99oi9VV4KzNNr\n4TeGQuYVRXqasuNKtDDHWnC08mmEm4/d11tVbo5q5MGU5ZasYZki7wvzAAzsyitZ\nIfPcVZVqhF1eDDERQD2atkQKN5lvpc4Ckd1yBRGKWJ3hwssQ+iqX+qfI/QKBgGrV\n5GzqFxq46APbVfYGbaFzhFNYr9DQLHTPa9Bxyo4w3y/XYgaHPucZngKpjyvWBXRF\ncCJLuOGO+8/n0eUoJQ2Ypy2GvNl3GkkhZcVPpOHTE9lPG5VO83IohWWyof0fsi/J\nSNsZlECumd2eG/c1XQhmfE1m2Okz8i1MTVwm0DRRAoGAU3geG3zXE/w6bf48sxMZ\ngDa1cLRQsl6qnupDH0maLLsv45h/dOTW4xXNUBIzcIF+zPrJBpSBmjdSluMSRual\nUFB+v/KlQ1LnTBnN/9UEUFy5VdNN2DENbf1/kZcp8fYUX56Y+vedJGxD9C7ppGbT\nS1HipNx5DlEdJ/WlJXqQ+8o=\n-----END PRIVATE KEY-----\n",
  "client_email": "firebase-adminsdk-le70o@ownchat-8ba71.iam.gserviceaccount.com",
  "client_id": "101935186057411098173",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-le70o%40ownchat-8ba71.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
        }),
        [fMessagingScope],
      );

      _token = client.credentials.accessToken.data;

      return _token;
    } catch (e) {
      log('$e');
      return null;
    }
  }
}
