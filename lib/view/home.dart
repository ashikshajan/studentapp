import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view/classroom/classroomlist.dart';
import 'package:studentapp/view/students/studentslist.dart';
import 'package:studentapp/view/subjects/subjectlist.dart';
import 'package:studentapp/view/widgets/home_widgets.dart';
import 'package:studentapp/view_model/classroom_model/calssroom_controller.dart';
import 'package:studentapp/view_model/home_model/home_controller.dart';
import 'package:studentapp/view_model/students_model/students_controller.dart';
import 'package:studentapp/view_model/subject_model/subject_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120), // Set this height
        child:
            Consumer<HomeController>(builder: (context, homepagecontroller, _) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hello,",
                          style: textStyle(
                              clr: Colors.black,
                              ftWeight: FontWeight.w600,
                              font: 33.0)),
                      GestureDetector(
                        onTap: () {
                          homepagecontroller.setpageViewasMenu();
                        },
                        child: SvgPicture.asset(
                          assetSvg(homepagecontroller.pageViewasMenu == true
                              ? "menu.svg"
                              : "grid.svg"),
                          height: 35,
                        ),
                      )
                    ],
                  ),
                  Text(greeting(),
                      style: textStyle(
                          clr: Colors.black,
                          ftWeight: FontWeight.w400,
                          font: 25.0)),
                ],
              ),
            ),
          );
        }),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Consumer<HomeController>(
              builder: (context, homepagecontroller, _) {
            return Column(
              mainAxisAlignment: homepagecontroller.pageViewasMenu == false
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                if (homepagecontroller.pageViewasMenu == false) ...[
                  CategoryCardList(
                    clr: AppUtil.appprimaryclr,
                    label: "Students",
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StudentsList()),
                      );

                      await context
                          .read<StudentsController>()
                          .getListAllStudents();
                    },
                  ),
                  CategoryCardList(
                    clr: AppUtil.appscecondaryclr,
                    label: "Subjects",
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SubjectList()),
                      );

                      await context
                          .read<SubjectsController>()
                          .getListAllSubjects();
                    },
                  ),
                  CategoryCardList(
                    clr: AppUtil.appclr3,
                    label: "Classroom",
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ClassroomList()),
                      );
                      await context
                          .read<CalssroomController>()
                          .getListAllClasses();
                    },
                  ),
                  CategoryCardList(
                    clr: AppUtil.appclr4,
                    label: "Registration",
                    onTap: () {},
                  ),
                ],
                if (homepagecontroller.pageViewasMenu == true) ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryCardGrid(
                        clr: AppUtil.appprimaryclr,
                        icon: "students",
                        label: "Students",
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StudentsList()),
                          );

                          await context
                              .read<StudentsController>()
                              .getListAllStudents();
                        },
                      ),
                      CategoryCardGrid(
                        clr: AppUtil.appscecondaryclr,
                        icon: "subjects",
                        label: "Subjects",
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SubjectList()),
                          );
                          await context
                              .read<SubjectsController>()
                              .getListAllSubjects();
                        },
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CategoryCardGrid(
                        clr: AppUtil.appclr3,
                        icon: "classroom",
                        label: "Classroom",
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ClassroomList()),
                          );
                          await context
                              .read<CalssroomController>()
                              .getListAllClasses();
                        },
                      ),
                      CategoryCardGrid(
                        clr: AppUtil.appclr4,
                        icon: "registration",
                        label: "Registration",
                      )
                    ],
                  )
                ],
              ],
            );
          }),
        ),
      ),
    );
  }
}
