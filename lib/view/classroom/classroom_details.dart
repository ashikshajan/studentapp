import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/response/status.dart';
import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view/classroom/add_sub_in_classroom.dart';

import 'package:studentapp/view_model/classroom_model/calssroom_controller.dart';
import 'package:studentapp/view_model/subject_model/subject_controller.dart';

class ClassRoomDetails extends StatelessWidget {
  final FromSubjectPage? subjectPage;
  const ClassRoomDetails({super.key, this.subjectPage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppBar(
          context,
        ),
        body: Column(
          children: [
            pageHead("ClassRoom Details"),
            Expanded(child: Consumer<CalssroomController>(
              builder: (context, classroomCntrl, child) {
                switch (classroomCntrl.classDetStatus.status) {
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
                              classroomCntrl.classDetStatus.message ?? '',
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
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
// im doing like this bcoz while i try to do use patch/ update method its gives me 500 , tried several time

// atached screen shot in assets/apierrors

                              (classroomCntrl.classDetails!.subject == "" &&
                                      subjectPage!.subject == "")
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 15),
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddSubjectinClassRoom()),
                                          );
                                          await context
                                              .read<SubjectsController>()
                                              .getListAllSubjects();
                                        },
                                        child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 8.0),
                                                child: Text(
                                                  "Add Subject",
                                                  style: textStyle(
                                                      font: 15.0,
                                                      clr: Colors.black,
                                                      ftWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppUtil
                                                          .appprimaryclr),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 18,
                                                              top: 2,
                                                              right: 18,
                                                              bottom: 2),
                                                      child: Text(
                                                        "Add",
                                                        style: textStyle(
                                                            font: 13.0,
                                                            clr: Colors.teal,
                                                            ftWeight: FontWeight
                                                                .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8, 8, 8, 15),
                                      child: InkWell(
                                        onTap: () async {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddSubjectinClassRoom()),
                                          );
                                          await context
                                              .read<SubjectsController>()
                                              .getListAllSubjects();
                                        },
                                        child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      subjectPage!.subject ??
                                                          "",
                                                      style: textStyle(
                                                          font: 17.0,
                                                          clr: Colors.black,
                                                          ftWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      subjectPage!.teacher ??
                                                          "",
                                                      style: textStyle(
                                                          font: 16.0,
                                                          clr: Colors.black,
                                                          ftWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Container(
                                                  height: 35,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      color: AppUtil
                                                          .appprimaryclr),
                                                  child: Center(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        "Change",
                                                        style: textStyle(
                                                            font: 13.0,
                                                            clr: Colors.teal,
                                                            ftWeight: FontWeight
                                                                .w500),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                              classroomCntrl.classDetails!.layout.toString() ==
                                      "conference"
                                  ? ConferenceLayout(
                                      numbers: List.generate(
                                          classroomCntrl.classDetails!.size!,
                                          (index) => index),
                                    )
                                  : ClassroomLayout(
                                      numbers: List.generate(
                                          classroomCntrl.classDetails!.size!,
                                          (index) => index)),
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
        ));
  }
}

class ConferenceLayout extends StatelessWidget {
  final List<int> numbers;

  const ConferenceLayout({
    super.key,
    required this.numbers,
  });
  @override
  Widget build(BuildContext context) {
    int halfLength = (numbers.length / 2).ceil();
    List<int> firstHalf = numbers.sublist(0, halfLength);
    List<int> secondHalf = numbers.sublist(halfLength);

    double itemHeight = 50.0;
    double containerHeight = firstHalf.length * itemHeight;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
            children: List.generate(
                firstHalf.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        assetImages("chair.png"),
                        color: Colors.black,
                        height: 30,
                      ),
                    ))),
        Container(
          width: 200,
          height: containerHeight,
          color: Colors.grey[300],
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: Text(
                'Conference Table',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Column(
            children: List.generate(
                secondHalf.length,
                (index) => Transform.scale(
                    scaleX: -1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        assetImages("chair.png"),
                        color: Colors.black,
                        height: 30,
                      ),
                    ))))
      ],
    );
  }
}

class ClassroomLayout extends StatelessWidget {
  final List<int> numbers;

  const ClassroomLayout({
    super.key,
    required this.numbers,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          return Container(
              width: 200.0,
              height: 100.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Image.asset(
                  assetImages("chair.png"),
                  height: 30,
                ),
              ));
        },
      ),
    );
  }
}
