import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/response/status.dart';
import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view_model/students_model/students_controller.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(context),
      body: Column(
        children: [
          pageHead("Student Details"),
          Expanded(child: Consumer<StudentsController>(
            builder: (context, studentsCntrl, child) {
              switch (studentsCntrl.studentDetStatus.status) {
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
                            studentsCntrl.studentDetStatus.message ?? '',
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
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            CircleAvatar(
                              backgroundColor: AppUtil.appprimaryclr,
                              maxRadius: 60,
                              child: SvgPicture.asset(
                                assetSvg("students.svg"),
                                height: 60,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                studentsCntrl.studentDetails!.name ?? "",
                                style: textStyle(
                                    clr: Colors.black,
                                    ftWeight: FontWeight.w500,
                                    font: 24.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Age :${studentsCntrl.studentDetails!.age ?? ""}",
                                style: textStyle(
                                    clr: Colors.black,
                                    ftWeight: FontWeight.w500,
                                    font: 22.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                studentsCntrl.studentDetails!.email ?? "",
                                style: textStyle(
                                    clr: Colors.black,
                                    ftWeight: FontWeight.w400,
                                    font: 20.0),
                              ),
                            ),
                          ],
                        ),
                      );
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
