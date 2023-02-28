import 'package:delivery_app/beans/user_bean.dart';
import 'package:delivery_app/helpers/common_utils.dart';
import 'package:delivery_app/service/user_service.dart';
import '../component/dialog_box.dart';
import '../response/users./user_response.dart';
import 'package:flutter/material.dart';

///This contain the screen for Adding the User in the database
class GetUsers extends StatefulWidget {
  const GetUsers({Key? key}) : super(key: key);

  @override
  State<GetUsers> createState() => _GetUsersState();
}

class _GetUsersState extends State<GetUsers> {
  late UserResponse userResponse;
  final UserService _userService = UserService();
  bool _isLoading=false;

  /// Function for showing up the dialog box after adding the user
  void _showDialogBox(BuildContext context, UserResponse response) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DialogBox(response: response),
    );
  }

  Future<void> _deleteUser(BuildContext ctx,String email)async {
    setState(() {
      _isLoading = true;
    });
    if(CommonUtils.isNullOrBlank(email)){
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
    } else{
      UserService service=UserService();
      userResponse=await service.deleteUser(email);
      //Changing the state
      setState(() {
        _isLoading = false;
        _showDialogBox(ctx, userResponse);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Get Users"),
        ),
        body: FutureBuilder<UserResponse>(
          future: _userService.getUsersService(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.data?.respCode != -1 &&
                snapshot.data?.users != null) {
              List<UserBean>? users = snapshot.data?.users;
              return ListView(
                children: (users != null && users.isNotEmpty)
                    ? users
                        .map(
                          (UserBean user) => Center(
                            child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: const Icon(
                                        Icons.supervised_user_circle),
                                    title: Text(
                                        "${user.userDetails.firstName} ${user.userDetails.lastName}"),
                                    subtitle:
                                        Text(user.userDetails.designation),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(user.email),
                                      const SizedBox(width: 8),
                                      ElevatedButton(
                                        onPressed: () {
                                          _deleteUser(context,user.email);
                                        },
                                        child: const Text("Delete User"),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList()
                    : <Widget>[
                        const Center(
                          child: Text("No Data found"),
                        ),
                      ],
              );
            } else if (snapshot.hasError || snapshot.data?.respCode == -1) {
              return const Center(
                child: Text("Technical error in getting response from backend"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
