import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/response/status.dart';
import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view/students/student_details.dart';
import 'package:studentapp/view/widgets/commonlist_widget.dart';
import 'package:studentapp/view_model/students_model/students_controller.dart';

class StudentsList extends StatelessWidget {
  const StudentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(context),
      body: Column(
        children: [
          pageHead("Students"),
          Expanded(child: Consumer<StudentsController>(
            builder: (context, studentsCntrl, child) {
              switch (studentsCntrl.listallStudentstatus.status) {
                case Status.error:
                  return RefreshIndicator(
                    color: AppUtil.appprimaryclr,
                    backgroundColor: AppUtil.appprimaryclr,
                    onRefresh: () async {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        children: [
                          Center(
                              child: Text(
                            studentsCntrl.listallStudentstatus.message ?? '',
                          )),
                        ],
                      ),
                    ),
                  );
                case Status.completed:
                  return RefreshIndicator(
                    backgroundColor: AppUtil.appprimaryclr,
                    onRefresh: () async {},
                    child: Builder(builder: (context) {
                      return studentsCntrl.allStudentsList.isEmpty
                          ? const Center(
                              child: Text("No Students to display"),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 10),
                              child: ListView.builder(
                                  itemCount:
                                      studentsCntrl.allStudentsList.length,
                                  itemBuilder: (context, index) {
                                    return CommonlistWidget(
                                        isTrailingColumn: false,
                                        trailingCount:
                                            "${studentsCntrl.allStudentsList[index]!.age ?? ""}",
                                        trailinghead: "Age : ",
                                        title: studentsCntrl
                                                .allStudentsList[index]!.name ??
                                            "",
                                        subtitle: studentsCntrl
                                                .allStudentsList[index]!
                                                .email ??
                                            "",
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const StudentDetails()),
                                          );

                                          studentsCntrl.getStudentsDetails(
                                              studentsCntrl
                                                  .allStudentsList[index]!.id);
                                        },
                                        clr: Colors.grey);
                                  }));
                    }),
                  );

                default:
                  return Center(child: commonloading());
              }
            },
          ))
        ],
      ),
    );
  }
}
