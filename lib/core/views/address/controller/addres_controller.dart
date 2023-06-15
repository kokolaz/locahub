import 'package:get/get.dart';
import 'package:locahub/core/models/address_model.dart';
import 'package:locahub/core/services/network_services/address_service.dart';

class AddressController extends GetxController {
  var addresses = <AddressModel>[].obs;
  final AddressService addressService = AddressService();
  // Future<AddressModel> fetchAddresses(String token, {int? userId}) async {
  //   try {
  //     print(userId);
  //     print(token);
  //     final address =
  //         await addressService.getAlamatbyUserID(token, userId: userId);
  //     return address;
  //   } catch (e) {
  //     print(e.toString());
  //     throw Exception('Failed to fetch address');
  //   }
  // }
}
