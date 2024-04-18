class  EmployeeDetailsResModel {
  int? status;
  String? message;
  List<Employee>? employeedetailList;

  EmployeeDetailsResModel({
    this.status,
    this.message,
    this.employeedetailList,
  });

  factory EmployeeDetailsResModel.fromJson(Map<String, dynamic> json) =>
      EmployeeDetailsResModel(
        status: json["status"],
        message: json["message"],
        employeedetailList: json["data"] == null
            ? []
            : List<Employee>.from(
                json["data"]!.map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": employeedetailList == null
            ? []
            : List<dynamic>.from(employeedetailList!.map((x) => x.toJson())),
      };
}

class Employee {
  int? id;
  String? name;
  String? role;

  Employee({
    this.id,
    this.name,
    this.role,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
      };
}