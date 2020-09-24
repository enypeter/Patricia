import 'package:DetailApp/model/user_data_api.dart';
import 'package:flutter/material.dart';

class UserDataPage extends StatelessWidget {
  static String routeName = "/user_data_page";

  @override
  Widget build(BuildContext context) {
    UserModel _user;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/profile.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Theme.of(context).primaryColor,
                      Colors.white30,
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 1),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.home,
                                  color: Colors.white,
                                  size: 40,
                                ),
                                onPressed: () {}),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4),
                      Text('${_user.name}'),
                      Text('user'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(width: 5.0),
                          Text('${_user.id}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Designation : ',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              color: Color(0xFF20294D),
                            ),
                          ),
                          Text(
                            '${_user.job}',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color(0xFFEB0928),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
