import 'package:neyasischallenge/products/enums/service_enum.dart';

extension ServiceEndpointExtension on ServicePathEndpointEnum {
  String get value {
    switch (this) {
      case ServicePathEndpointEnum.users:
        return '/users/';
      default:
        return '';
    }
  }
}
