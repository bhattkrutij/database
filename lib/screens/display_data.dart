import 'package:database/helpers/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../helpers/dbhelper.dart';
import '../models/Employee.dart';
import '../widgets/rounded_button.dart';
import '../widgets/text.dart';

class DisplayData extends StatefulWidget {
  const DisplayData({Key? key}) : super(key: key);

  @override
  State<DisplayData> createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  late DbHelper dbHelper;
  late Future<List<Employee>> items;
  List<Employee>? modelList;
  late Employee _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbHelper();
    print("init state called");
    refreshList();
  }

  refreshList() {
    print("refresh list called");
    setState(() {
      print("inisde setstae");
      items = dbHelper.getEmployees();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.HOME),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: RoundedButton(
                      borderRadius: 10,
                      fontSize: 16,
                      fontColor: Colors.blue,
                      onTap: () {
                        Get.toNamed("/addNew");
                      },
                      title: Constants.ADD_NEW,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                // Expanded(
                //   child: Container(
                //     height: 50,
                //     child: RoundedButton(
                //       fontSize: 16,
                //       borderRadius: 10,
                //       fontColor: Colors.blue,
                //       onTap: () {
                //         Get.toNamed("/apiCall");
                //       },
                //       title: Constants.GO_TO_API_PAGE,
                //     ),
                //   ),
                // )
              ],
            ),
            SizedBox(height: 30),
            Expanded(
              child: FutureBuilder(
                future: dbHelper.getEmployees(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      modelList = snapshot.data;
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: modelList!.length,
                          itemBuilder: (context, index) {
                            _model = modelList![index];
                            return Padding(
                              padding: const EdgeInsets.all(20),
                              child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Padding(
                                    padding: EdgeInsets.all(20),
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 30,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 10,
                                                child: CustomText(
                                                  title: Constants.NAME,
                                                  fontSize: 20,
                                                  fontColor: Colors.black,
                                                ),
                                              ),
                                              Positioned(
                                                left: 80,
                                                child: CustomText(
                                                  title: _model.getName(),
                                                  fontSize: 20,
                                                  fontColor: Colors.blue,
                                                ),
                                              ),
                                              Positioned(
                                                right: 80,
                                                child: CustomText(
                                                  title: Constants.AGE,
                                                  fontSize: 20,
                                                  fontColor: Colors.black,
                                                ),
                                              ),
                                              Positioned(
                                                right: 20,
                                                child: CustomText(
                                                  title: _model.getAge(),
                                                  fontSize: 20,
                                                  fontColor: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: Constants.DESIGNATION,
                                              fontSize: 20,
                                              fontColor: Colors.black,
                                            ),
                                            CustomText(
                                              title: _model.getDesignation(),
                                              fontSize: 20,
                                              fontColor: Colors.blue,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: Constants.DEPARTMENT,
                                              fontSize: 20,
                                              fontColor: Colors.black,
                                            ),
                                            CustomText(
                                              title: _model.getDepartment(),
                                              fontSize: 20,
                                              fontColor: Colors.blue,
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomText(
                                              title: Constants.SALARY,
                                              fontSize: 20,
                                              fontColor: Colors.black,
                                            ),
                                            CustomText(
                                              title: _model.getSalary(),
                                              fontSize: 20,
                                              fontColor: Colors.blue,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 40,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: RoundedButton(
                                                    borderRadius: 4,
                                                    fontSize: 20,
                                                    fontColor: Colors.blue,
                                                    onTap: () {
                                                      var data = {
                                                        "employee": _model,
                                                      };

                                                      Get.toNamed("/addNew",
                                                          arguments: data);
                                                    },
                                                    title: Constants.EDIT),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Expanded(
                                                child: RoundedButton(
                                                    borderRadius: 4,
                                                    fontSize: 20,
                                                    fontColor: Colors.blue,
                                                    onTap: () {
                                                      _showDialog(context);
                                                    },
                                                    title: Constants.DELETE),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            );
                            ;
                          });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '${snapshot.error} occurred',
                          style: TextStyle(fontSize: 18),
                        ),
                      );

                      // if we got our data
                    }
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: Color(0xe5eef2f5),
        context: context,
        builder: (context) => AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.blue),
                        color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          CustomText(
                              maxLines: 2,
                              fontColor: Colors.red,
                              title: Constants.DELETE_TITLE,
                              alignment: TextAlign.left,
                              fontSize: 20),
                          SizedBox(
                            height: 20,
                          ),
                          CustomText(
                              maxLines: 2,
                              fontColor: Colors.blue,
                              title: Constants.DELETE_MSG,
                              alignment: TextAlign.left,
                              fontSize: 18),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 40,
                                  child: RoundedButton(
                                    borderRadius: 10,
                                    fontSize: 16,
                                    fontColor: Colors.blue,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    title: Constants.CANCEL,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 40,
                                  child: RoundedButton(
                                    fontSize: 16,
                                    borderRadius: 10,
                                    fontColor: Colors.blue,
                                    onTap: () {
                                      Navigator.pop(context);
                                      dbHelper.delete(_model.getId());
                                      refreshList();
                                    },
                                    title: Constants.CONFIRM,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
