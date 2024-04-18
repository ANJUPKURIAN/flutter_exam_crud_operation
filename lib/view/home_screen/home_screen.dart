import 'package:flutter/material.dart';
import 'package:flutter_exam_crud_operation/controller/home_screen_controller.dart';
//import 'package:flutter_exam_crud_operation/core/color_constant.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //
      await Provider.of<HomeScreenController>(context, listen: false)
          .getEmployees();
      //
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<HomeScreenController>(context);
     return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Enter",
                    label: Text("Employee Name"),
                    //
                    fillColor: Colors.green.withOpacity(6),
                    filled: true,
                    //
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                    label: Text("Role"),
                    hintText: "Enter",
                    fillColor: Colors.green.withOpacity(6),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () async {
                      await Provider.of<HomeScreenController>(context,
                              listen: false)
                          .addEmployee();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(6),
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  )),
                  SizedBox(width: 20),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                          color:Colors.amber.withOpacity(6),
                          borderRadius: BorderRadius.circular(12)),
                      alignment: Alignment.center,
                      child: Text(
                        "Edit",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                  child: RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<HomeScreenController>(context,
                          listen: false)
                      .getEmployees();
                },

                child: provider.isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: provider.employeedetailList.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen.withOpacity(.5),
                                    borderRadius: BorderRadius.circular(12)),
                                child: ListTile(
                                  title: Text(
                                      provider.employeedetailList[index].name ?? ""),
                                  subtitle: Text(
                                      provider.employeedetailList[index].role ?? ""),
                                  trailing: IconButton(
                                      onPressed: () async {
                                        await Provider.of<HomeScreenController>(
                                                context,
                                                listen: false)
                                            .updateEmployee(provider
                                                .employeedetailList[index].id);
                                      },
                                      icon: Icon(Icons.delete)),
                                ),
                              ),
                            )),
              ))
            ],
          ),
        ),
      ),
    );
  }
}