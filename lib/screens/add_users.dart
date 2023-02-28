import 'package:delivery_app/beans/user_bean.dart';
import 'package:delivery_app/beans/user_details_bean.dart';
import 'package:delivery_app/helpers/common_utils.dart';
import 'package:delivery_app/service/user_service.dart';
import 'package:flutter/material.dart';

import '../component/dialog_box.dart';
import '../response/users./user_response.dart';

///This contain the screen for Adding the User in the database
class AddUsers extends StatefulWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  late UserResponse userResponse;

  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _designationController = TextEditingController();
  bool _isLoading = false;

  /// Function for showing up the dialog box after adding the user
  void _showDialogBox(BuildContext context, UserResponse response) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DialogBox(response: response),
    );
  }

  /// Function for adding the users in the database
  Future<void> addUser(BuildContext ctx) async {
    setState(() {
      _isLoading = true;
    });

    //Validation for checking empty data value
    if (CommonUtils.isNullOrBlank(_emailController.text) ||
        CommonUtils.isNullOrBlank(_firstNameController.text) ||
        CommonUtils.isNullOrBlank(_lastNameController.text) ||
        CommonUtils.isNullOrBlank(_designationController.text)) {
      setState(() {
        _isLoading = false;
        userResponse = UserResponse(
          respMsg: "Failure",
          respCode: -1,
          apiErrorCode: -1,
          message: "Please fill out all details",
          users: <UserBean>[],
        );
        _showDialogBox(ctx, userResponse);
      });
    } else {
      //Creating the user detail bean
      UserDetailsBean userDetails = UserDetailsBean(
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        designation: _designationController.text,
      );
      //Creating the userBean and adding user detail bean
      UserBean userBean = UserBean(
        email: _emailController.text,
        userDetails: userDetails,
      );
      //Creating the user service instance
      UserService service = UserService();
      //Calling the service which will call api
      userResponse = await service.addUserService(userBean);
      //Changing the state
      setState(() {
        _isLoading = false;
        _showDialogBox(ctx, userResponse);
        _emailController.text = "";
        _firstNameController.text = "";
        _lastNameController.text = "";
        _designationController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add Users'),
        ),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Column(
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Enter Email',
                          hintText: 'Enter Your Email',
                        ),
                        controller: _emailController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'First Name',
                          hintText: 'Enter Your First Name',
                        ),
                        controller: _firstNameController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Last Name',
                          hintText: 'Enter Your Last Name',
                        ),
                        controller: _lastNameController,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          labelText: 'Designation',
                          hintText: 'Enter Your Designation',
                        ),
                        controller: _designationController,
                      ),
                      Container(
                        margin: const EdgeInsets.all(25),
                        child: ElevatedButton(
                          onPressed: () => addUser(context),
                          child: const Text(
                            "Add User in Database",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
