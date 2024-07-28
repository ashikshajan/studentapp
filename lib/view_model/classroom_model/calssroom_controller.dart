import 'package:flutter/foundation.dart';
import 'package:studentapp/data/remote/response/api_response.dart';

import 'package:studentapp/models/class_det_response_model.dart';
import 'package:studentapp/models/class_response_model.dart';

import '../../repository/api_repository.dart';

class CalssroomController extends ChangeNotifier {
  CalssroomController({required this.apiRepository});
  final ApiRepository apiRepository;

//// --- API CALING FOR LISTING ALL callsrooms

  ApiResponse<ClassresponseModel> listClassroomStatus = ApiResponse.none();

  void _setListClassroomStatus(ApiResponse<ClassresponseModel> status) {
    listClassroomStatus = status;
    notifyListeners();
  }

  List<Classrooms?> _allClsRoomList = [];
  List<Classrooms?> get allClsRoomList => _allClsRoomList;

  Future<void> getListAllClasses() async {
    _setListClassroomStatus(ApiResponse.loading());
    try {
      final result = await apiRepository.getClassRooms();

      _allClsRoomList = result?.classrooms ?? [];

      _setListClassroomStatus(ApiResponse.completed(result));

      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _setListClassroomStatus(ApiResponse.error(e.toString()));
    }
  }

// calss room details controller

  ApiResponse<ClassRoomDetailsResponseModel> classDetStatus =
      ApiResponse.none();

  void _setclassDetStatus(ApiResponse<ClassRoomDetailsResponseModel> status) {
    classDetStatus = status;
    notifyListeners();
  }

  ClassRoomDetailsResponseModel? _classDetails;
  ClassRoomDetailsResponseModel? get classDetails => _classDetails;

  Future<void> getClassDet(id) async {
    _setclassDetStatus(ApiResponse.loading());
    try {
      final result = await apiRepository.getClassRoomDetails(id);

      _classDetails = result;

      _setclassDetStatus(ApiResponse.completed(result));

      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _setclassDetStatus(ApiResponse.error(e.toString()));
    }
  }
}
