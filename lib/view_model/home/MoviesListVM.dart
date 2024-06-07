import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../repository/api_repository.dart';

class MoviesListVM extends ChangeNotifier {
  MoviesListVM({required this.apiRepository});
  final ApiRepository apiRepository;

//// --- API CALING FOR LISTING ALL VEHICLES

  // ApiResponse<ListallVehicles> listVehiclesStatus = ApiResponse.none();

  // void _setListVehiclesStatus(ApiResponse<ListallVehicles> status) {
  //   listVehiclesStatus = status;
  //   notifyListeners();
  // }

  // List<VehicleDetails?> _vehicleList = [];
  // List<VehicleDetails?> get vehicleList => _vehicleList;

  // List<VehicleDetails?> _filteredVehicleList = [];
  // List<VehicleDetails?> get filteredVehicleList => _filteredVehicleList;

  // void getFilteredList(String query) {
  //   _filteredVehicleList = _vehicleList
  //       .where((element) => (element?.vehicleRegNo ?? '')
  //           .toLowerCase()
  //           .startsWith(query.toLowerCase()))
  //       .toList();

  //   notifyListeners();
  // }

  // Future<void> getListAllCars() async {
  //   dynamic driverId =
  //       await SharedPrefsUtil.getString(SharedPrefsUtil.driverId);
  //   _setListVehiclesStatus(ApiResponse.loading());
  //   try {
  //     final result =
  //         await apiRepository.getListAllCars(id: int.parse(driverId));

  //     if (result?.success == AppUtil.apiSuccess) {
  //       _vehicleList = result?.vehicleDetails ?? [];
  //       _filteredVehicleList = result?.vehicleDetails ?? [];

  //       _setListVehiclesStatus(ApiResponse.completed(result));

  //       return;
  //     }
  //     _setListVehiclesStatus(ApiResponse.error(result?.message.toString()));
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     _setListVehiclesStatus(ApiResponse.error(e.toString()));
  //   }
  // }
}
