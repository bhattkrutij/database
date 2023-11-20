import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../helpers/Constants.dart';
import '../helpers/dbhelper.dart';
import '../models/Employee.dart';
import '../widgets/rounded_button.dart';

class AddNew extends StatefulWidget {
  AddNew({Key? key}) : super(key: key);

  var argumentsData = Get.arguments;

  @override
  State<AddNew> createState() => _AddNewState(argumentsData);
}

class _AddNewState extends State<AddNew> {
  var argumentsData;
  _AddNewState(this.argumentsData);
  var _formKey = GlobalKey<FormState>();
  late DbHelper dbHelper;
  TextEditingController nameController = TextEditingController();
  TextEditingController ageControlller = TextEditingController();
  TextEditingController deprtControlller = TextEditingController();
  TextEditingController designationControlller = TextEditingController();
  TextEditingController salaryControlller = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode ageFocusNode = FocusNode();
  FocusNode deptFocusNode = FocusNode();
  FocusNode designationFocusNode = FocusNode();
  FocusNode salaryFocusNode = FocusNode();
  Employee? e;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    if (argumentsData != null) {
      e = argumentsData["employee"];
      nameController.text = e!.getName();
      ageControlller.text = e!.getAge();
      deprtControlller.text = e!.getDepartment();
      designationControlller.text = e!.getDesignation();
      salaryControlller.text = e!.getSalary();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.ADD_NEW_EMPLOYEE),
        centerTitle: false,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: nameController,
                focusNode: nameFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Constants.NAME_VALIDATION;
                  } else {
                    return null;
                  }
                },
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: Constants.HINT_NAME,
                    hintStyle: TextStyle(fontSize: 18)),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(ageFocusNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: ageControlller,
                focusNode: ageFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Constants.AGE_VALIDATION;
                  } else {
                    return null;
                  }
                },
                inputFormatters: [LengthLimitingTextInputFormatter(10)],
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: Constants.HINT_AGE,
                    hintStyle: TextStyle(fontSize: 18)),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(deptFocusNode);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: deprtControlller,
                focusNode: deptFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Constants.DEPARTMENT_VALIDATION;
                  } else {
                    return null;
                  }
                },
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: Constants.HINT_DEPARTMENT,
                    hintStyle: TextStyle(fontSize: 18)),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(designationFocusNode);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: designationControlller,
                focusNode: designationFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Constants.DESIGNATION_VALIDATION;
                  } else {
                    return null;
                  }
                },
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: Constants.HINT_DESIGNATION,
                    hintStyle: TextStyle(fontSize: 18)),
                onFieldSubmitted: (value) {
                  FocusScope.of(context).requestFocus(salaryFocusNode);
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: salaryControlller,
                focusNode: salaryFocusNode,
                validator: (value) {
                  if (value!.isEmpty) {
                    return Constants.SALARY_VALIDATION;
                  } else {
                    return null;
                  }
                },
                inputFormatters: [LengthLimitingTextInputFormatter(50)],
                decoration: InputDecoration(
                    labelStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    // focusedBorder: UnderlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.blue)),
                    hintText: Constants.HINT_SALARY,
                    hintStyle: TextStyle(fontSize: 18)),
                onFieldSubmitted: (value) {
                  salaryFocusNode.unfocus();
                },
              ),
              SizedBox(height: 30),
              Container(
                height: 50,
                child: RoundedButton(
                  fontSize: 16,
                  borderRadius: 0,
                  fontColor: Colors.blue,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      if (argumentsData != null) {
                        updateEmployee();
                      } else {
                        insetEmployee();
                      }
                      Get.toNamed("/displayData");
                    }

                    //   Get.toNamed("/addNew");
                  },
                  title: Constants.SAVE,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  insetEmployee() async {
    Employee employee = Employee(
        name: nameController.text,
        designation: designationControlller.text,
        department: deprtControlller.text,
        salary: salaryControlller.text,
        age: ageControlller.text);
    int result = await dbHelper.insertEmployee(employee);
    print("data is inserted==> :$result");
  }

  updateEmployee() async {
    print("update employee called ${nameController.text}");
    Employee employee = Employee(
        id: e!.getId(),
        name: nameController.text,
        designation: designationControlller.text,
        department: deprtControlller.text,
        salary: salaryControlller.text,
        age: ageControlller.text);
    await dbHelper.update(employee);
  }
}
