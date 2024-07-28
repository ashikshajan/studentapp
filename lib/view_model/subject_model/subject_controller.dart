import 'package:flutter/foundation.dart';

import 'package:studentapp/models/subject_details_response_model.dart';
import 'package:studentapp/repository/api_repository.dart';

import '../../data/remote/response/api_response.dart';
import '../../models/subject_response_model.dart';

//// --- API CALING FOR LISTING ALL Subjects
class SubjectsController extends ChangeNotifier {
  SubjectsController({required this.apiRepository});
  final ApiRepository apiRepository;

  ApiResponse<SubjectsResponseModel> listallSubjectsstatus = ApiResponse.none();

  void _setlistallSubjectStatus(ApiResponse<SubjectsResponseModel> status) {
    listallSubjectsstatus = status;
    notifyListeners();
  }

  List<Subjects?> _allSubjectsList = [];
  List<Subjects?> get allSubjectsList => _allSubjectsList;

  Future<void> getListAllSubjects() async {
    _setlistallSubjectStatus(ApiResponse.loading());
    try {
      final result = await apiRepository.getSubjectsList();

      _allSubjectsList = result?.subjects ?? [];

      _setlistallSubjectStatus(ApiResponse.completed(result));

      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _setlistallSubjectStatus(ApiResponse.error(e.toString()));
    }
  }

  /// get subjects details

  ApiResponse<SubjectsDetailsResponseModel> subjectDetStatus =
      ApiResponse.none();

  void _setsubjectDetStatus(ApiResponse<SubjectsDetailsResponseModel> status) {
    subjectDetStatus = status;
    notifyListeners();
  }

  SubjectsDetailsResponseModel? _subjectDetails;
  SubjectsDetailsResponseModel? get subjectDetails => _subjectDetails;

  Future<void> getSubjectDet(id) async {
    _setsubjectDetStatus(ApiResponse.loading());
    try {
      final result = await apiRepository.getSubjectDetails(id);

      _subjectDetails = result;

      _setsubjectDetStatus(ApiResponse.completed(result));

      return;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      _setsubjectDetStatus(ApiResponse.error(e.toString()));
    }
  }
}
