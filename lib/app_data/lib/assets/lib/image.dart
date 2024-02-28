import 'package:flutter/material.dart';

class ImageCollection {
  final String _defaultPath = 'assets/';

  String _name(String name) => _defaultPath + name;

  // Example

  Image trezor({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/trezor.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image welcome({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('images/welcome.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image buy({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('icons/buy.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image receive({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('icons/receive.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image send({double? width, double? height, BoxFit? fit}) => Image.asset(
        _name('icons/send.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );

  Image crypto({String? value, double? width, double? height, BoxFit? fit}) =>
      Image.asset(
        _name('crypto/$value.png'),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
}
