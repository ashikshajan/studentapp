import 'package:flutter/foundation.dart';

import 'package:studentapp/models/students_det_models.dart';
import 'package:studentapp/models/students_response_model.dart';

import '../../../repository/api_repository.dart';
import '../../data/remote/response/api_response.dart';

class StudentsController extends ChangeNotifier {
  StudentsController({required this.apiRepository});
  final ApiRepository apiRepository;

//// --- API CALING FOR LISTING ALL Students

  ApiResponse<StudentsListResponseModel> listallStudentstatus =
      ApiResponse.none();

  void _setlistallStudentStatus(ApiResponse<StudentsListResponseModel> status) {
    listallStudentstatus = status;
    notifyListeners();
  }

  List<Students?> _allStudentsList = [];
  List<Students?> get allStudentsList => _allStudentsList;

  Future<void> getListAllStudents() async {
    _setlistallStudentStatus(ApiResponse.loading());
    try {
      final result = await apiRepository.getStudentsList();

      _allStudentsList = result?.students ?? [];

      _setlistallStudentStatus(ApiResponse.completed(result));

      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _setlistallStudentStatus(ApiResponse.error(e.toString()));
    }
  }

  /// get student details

  ApiResponse<StudentDetailsResponseModel> studentDetStatus =
      ApiResponse.none();

  void _setstudentDetStatus(ApiResponse<StudentDetailsResponseModel> status) {
    studentDetStatus = status;
    notifyListeners();
  }

  StudentDetailsResponseModel? _studentDetails;
  StudentDetailsResponseModel? get studentDetails => _studentDetails;

  Future<void> getStudentsDetails(id) async {
    _setstudentDetStatus(ApiResponse.loading());
    try {
      final result = await apiRepository.getStudentDetails(id);

      _studentDetails = result;

      _setstudentDetStatus(ApiResponse.completed(result));

      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _setstudentDetStatus(ApiResponse.error(e.toString()));
    }
  }
}
