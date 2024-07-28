import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/response/status.dart';
import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view/classroom/classroom_details.dart';

import 'package:studentapp/view/widgets/commonlist_widget.dart';
import 'package:studentapp/view_model/subject_model/subject_controller.dart';

class AddSubjectinClassRoom extends StatelessWidget {
  const AddSubjectinClassRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(context),
      body: Column(
        children: [
          pageHead("Subjects"),
          Expanded(child: Consumer<SubjectsController>(
            builder: (context, subjectsCntrl, child) {
              switch (subjectsCntrl.listallSubjectsstatus.status) {
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
                            subjectsCntrl.listallSubjectsstatus.message ?? '',
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
                      return subjectsCntrl.allSubjectsList.isEmpty
                          ? const Center(
                              child: Text("No Subjects to display"),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 10),
                              child: ListView.builder(
                                  itemCount:
                                      subjectsCntrl.allSubjectsList.length,
                                  itemBuilder: (context, index) {
                                    return CommonlistWidget(
                                        isTrailingColumn: true,
                                        trailingCount: subjectsCntrl
                                            .allSubjectsList[index]!.credits
                                            .toString(),
                                        trailinghead: "Credit",
                                        title: subjectsCntrl
                                                .allSubjectsList[index]!.name ??
                                            "",
                                        subtitle: subjectsCntrl
                                                .allSubjectsList[index]!
                                                .teacher ??
                                            "",
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ClassRoomDetails(
                                                      subjectPage: FromSubjectPage(
                                                          subject: subjectsCntrl
                                                              .allSubjectsList[
                                                                  index]!
                                                              .name,
                                                          teacher: subjectsCntrl
                                                              .allSubjectsList[
                                                                  index]!
                                                              .teacher),
                                                    )),
                                          );
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
