import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/data/remote/response/status.dart';
import 'package:studentapp/utils/app_utils.dart';
import 'package:studentapp/view_model/subject_model/subject_controller.dart';

class SubjectDetails extends StatelessWidget {
  const SubjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(context),
      body: Column(
        children: [
          pageHead("Subject Details"),
          Expanded(child: Consumer<SubjectsController>(
            builder: (context, subjectsContlr, child) {
              switch (subjectsContlr.subjectDetStatus.status) {
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
                            subjectsContlr.subjectDetStatus.message ?? '',
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
                              backgroundColor: AppUtil.appscecondaryclr,
                              maxRadius: 60,
                              child: SvgPicture.asset(
                                assetSvg("subjects.svg"),
                                height: 60,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                subjectsContlr.subjectDetails!.name ?? "",
                                style: textStyle(
                                    clr: Colors.black,
                                    ftWeight: FontWeight.w500,
                                    font: 24.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                subjectsContlr.subjectDetails!.teacher ?? "",
                                style: textStyle(
                                    clr: Colors.black,
                                    ftWeight: FontWeight.w500,
                                    font: 22.0),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text(
                                "Credits :${subjectsContlr.subjectDetails!.credits ?? ""}",
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
