
import 'package:studentapp/data/remote/network/BaseApiService.dart';

class ApiRepository {
  final BaseApiService apiService;

  ApiRepository(this.apiService);

  // Future<ClientDetails?> getClientDetails({
  //   required String? mobNo,
  // required String? clientName,
  // }) async {
  //   try {
  //     final response = await apiService.post(
  //       ApiEndPoints.addClientMaster,
  //       data: {
  //         "ClientName": clientName,
  //         "MobileNo": mobNo,
  //       },
  //     );
  //     return ClientDetails.fromJson(response);
  //   } catch (e) {
  //     debugPrint("Exception: $e");
  //     rethrow;
  //   }
  // }

  //   Future<UpdateCheckModel?> checkAppVersion() async {
  //   try {
  //     final response = await apiService.get(
  //       ApiEndPoints.updateCheck,
  //     );
  //     return UpdateCheckModel.fromJson(response);
  //   } catch (e) {
  //     debugPrint("Exception: $e");
  //     rethrow;
  //   }
  // }
}
