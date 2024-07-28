import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/response/status.dart';
import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view/classroom/classroom_details.dart';
import 'package:studentapp/view/widgets/commonlist_widget.dart';
import 'package:studentapp/view_model/classroom_model/calssroom_controller.dart';

class ClassroomList extends StatelessWidget {
  const ClassroomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: commonAppBar(context),
        body: Column(
          children: [
            pageHead("Class Rooms"),
            Expanded(child: Consumer<CalssroomController>(
              builder: (context, classRoomCntrl, child) {
                switch (classRoomCntrl.listClassroomStatus.status) {
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
                              classRoomCntrl.listClassroomStatus.message ?? '',
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
                        return classRoomCntrl.allClsRoomList.isEmpty
                            ? const Center(
                                child: Text("No Class rooms to display"),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 15, 10, 10),
                                child: ListView.builder(
                                    itemCount:
                                        classRoomCntrl.allClsRoomList.length,
                                    itemBuilder: (context, index) {
                                      return CommonlistWidget(
                                          isTrailingColumn: true,
                                          trailingCount:
                                              "${classRoomCntrl.allClsRoomList[index]!.size}",
                                          trailinghead: "Seats",
                                          title:
                                              "${classRoomCntrl.allClsRoomList[index]!.name}",
                                          subtitle:
                                              "${classRoomCntrl.allClsRoomList[index]!.layout}",
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ClassRoomDetails(
                                                        subjectPage:
                                                            FromSubjectPage(
                                                                subject: "",
                                                                teacher: ""),
                                                      )),
                                            );
                                            classRoomCntrl.getClassDet(
                                                classRoomCntrl
                                                    .allClsRoomList[index]!.id);
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
        ));
  }
}
