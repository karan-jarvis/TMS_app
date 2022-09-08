import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tms_app/widget/common_button.dart';

class NoteTimeScreen extends StatefulWidget {
  const NoteTimeScreen({Key? key}) : super(key: key);

  @override
  State<NoteTimeScreen> createState() => _NoteTimeScreenState();
}

class _NoteTimeScreenState extends State<NoteTimeScreen> {
  String time = "In Time";
  String outTime = "Out Time";
  String? inOutButton;
  String? userName;

  List<TimeModel> timeList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Note time"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text("Hello! $userName"),
            const SizedBox(
              height: 20,
            ),
            Text("In :- $time"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 200,
              child: CommonButton(
                  title: inOutButton ?? "In",
                  onPressed: () {
                    if (inOutButton == "Out") {
                      setState(() {
                        inOutButton = "In";
                        DateTime date = DateTime.now();
                        outTime =
                            "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second}";
                        timeList.add(TimeModel(inTime: time, outTime: outTime));
                        time = "In time";
                        outTime = "Out time";
                      });
                    } else {
                      setState(() {
                        inOutButton = "Out";
                        DateTime date = DateTime.now();
                        time =
                            "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second}";
                      });
                    }
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            timeList.isEmpty
                ? const Center(
                    child: Text("No data found"),
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: timeList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name:- ${userName ?? "DemoName"} "),
                              Text("InTime:- ${timeList[index].inTime}"),
                              Text("OutTime:- ${timeList[index].outTime}"),
                            ],
                          ),
                        );
                      },
                    ),
                  )
          ],
        ),
      ),
    );
  }
}

class TimeModel {
  String? inTime;
  String? outTime;

  TimeModel({this.inTime, this.outTime});
}
