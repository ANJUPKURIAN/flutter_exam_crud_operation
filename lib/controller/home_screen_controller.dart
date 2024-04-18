import 'dart:convert';
import 'package:flutter_exam_crud_operation/model/employee_details_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  String baseUrl = "http://3.93.46.140";

  List<Employee> employeedetailList = [];
  bool isLoading = false;
  // get employees details 

  Future getEmployees() async {
    isLoading = true;
    notifyListeners();
    Uri url = Uri.parse(baseUrl + "/employeedetail/");
    var response = await http.get(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      var decodedData = jsonDecode(response.body);
      EmployeeDetailsResModel resModel = EmployeeDetailsResModel.fromJson(decodedData);
      employeedetailList = resModel.employeesdetailList ?? [];
    }
    isLoading = false;
    notifyListeners();
  }

  // delete an employee

  Future deleteEmployee(var id) async {
    isLoading = true;
    notifyListeners();
    Uri url = Uri.parse(baseUrl + "/employees/$id/");
    var response = await http.delete(url);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await getEmployees();
    } else {
      print("failed");
    }

    isLoading = false;
    notifyListeners();
  }

  // add an employee
  Future addEmployee() async {
    isLoading = true;
    notifyListeners();
    Uri url = Uri.parse(baseUrl + "/employees/create/");
    var response =
        await http.post(url, body: {"name": "Anju", "role": "flutter"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await getEmployees();
    } else {
      print("failed");
    }

    isLoading = false;
    notifyListeners();
  }

 // add an employee 

  Future updateEmployee(var id) async {
    isLoading = true;
    notifyListeners();
    Uri url = Uri.parse(baseUrl + "/employees/update/$id/");
    var response = await http.put(url,
        body: {"name": "Anju- editted", "role": "flutter - editted"});
    if (response.statusCode >= 200 && response.statusCode < 300) {
      await getEmployees();
    } else {
      print("failed");
    }

    isLoading = false;
    notifyListeners();
  }
}