import 'package:flutter/material.dart';
import 'package:studentapp/data/remote/network/api_end_points.dart';
import 'package:studentapp/data/remote/network/base_api_service.dart';
import 'package:studentapp/models/class_det_response_model.dart';
import 'package:studentapp/models/class_response_model.dart';
import 'package:studentapp/models/students_det_models.dart';
import 'package:studentapp/models/students_response_model.dart';
import 'package:studentapp/models/subject_details_response_model.dart';

import 'package:studentapp/models/subject_response_model.dart';

class ApiRepository {
  final BaseApiService apiService;

  ApiRepository(this.apiService);


// list all classs rooms
  Future<ClassresponseModel?> getClassRooms() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.getClassrooms,
      );

      return ClassresponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Exception: $e");
      rethrow;
    }
  }
// clsss details

  // get subject details
  Future<ClassRoomDetailsResponseModel?> getClassRoomDetails(id) async {
    try {
      final response = await apiService.get("${ApiEndPoints.getClassrooms}$id");

      return ClassRoomDetailsResponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Exception: $e");
      rethrow;
    }
  }




  // list all students

  Future<StudentsListResponseModel?> getStudentsList() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.getStudents,
      );

      return StudentsListResponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Exception: $e");
      rethrow;
    }
  }

// get student details
  Future<StudentDetailsResponseModel?> getStudentDetails(id) async {
    try {
      final response = await apiService.get("${ApiEndPoints.getStudents}$id");

      return StudentDetailsResponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Exception: $e");
      rethrow;
    }
  }

  /// get subjects list

  Future<SubjectsResponseModel?> getSubjectsList() async {
    try {
      final response = await apiService.get(
        ApiEndPoints.getSubjects,
      );

      return SubjectsResponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Exception: $e");
      rethrow;
    }
  }

  // get subject details
  Future<SubjectsDetailsResponseModel?> getSubjectDetails(id) async {
    try {
      final response = await apiService.get("${ApiEndPoints.getSubjects}$id");

      return SubjectsDetailsResponseModel.fromJson(response);
    } catch (e) {
      debugPrint("Exception: $e");
      rethrow;
    }
  }
}
