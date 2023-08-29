import 'package:flutter/material.dart';
import 'package:flutterbeginner/global/constant/api_const.dart';
import 'package:flutterbeginner/global/constant/color_const.dart';
import 'package:flutterbeginner/global/constant/string_const.dart';
import 'package:flutterbeginner/global/utils/widget_helper.dart';

class ProfilePage4 extends StatefulWidget {
  @override
  State<ProfilePage4> createState() => _ProfilePage4State();
}

class _ProfilePage4State extends State<ProfilePage4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.grey,
      appBar: AppBar(
        backgroundColor: ColorConst.grey,
        title: getTxtWhiteColor(msg: StringConst.WEBADDICTED, fontSize: 17),
        elevation: 0.0,
        //App Bar Back Button
        leading:  IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: ColorConst.whiteColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: <Widget>[
          // Profile Image Widget
          ProfileImageWidget(),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        // color: AppTheme.primary,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Header Widget
            getHeader(),
            const SizedBox(
              height: 35.0,
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: const <Widget>[
                  ProfileCardWidget(
                    title: 'Todo',
                    desc: '4 tasks',
                    icon: Icons.list,
                    // iconColor: AppTheme.iconColors[0],
                  ),
                  ProfileCardWidget(
                    title: 'Notes',
                    desc: '4 notes',
                    icon: Icons.event_note,
                    // iconColor: AppTheme.iconColors[1],
                  ),
                  ProfileCardWidget(
                    title: 'Calendar',
                    desc: '11 events',
                    icon: Icons.calendar_today,
                    // iconColor: AppTheme.iconColors[2],
                  ),
                  ProfileCardWidget(
                    title: 'Finance',
                    desc: '3 cards',
                    icon: Icons.local_atm,
                    // iconColor: AppTheme.iconColors[3],
                  ),
                  ProfileCardWidget(
                    title: 'Camara',
                    desc: '428 photos',
                    icon: Icons.camera,
                    // iconColor: AppTheme.iconColors[4],
                  ),

                  // Add New To do Card
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(Icons.add),
                    ),
                  )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        getTxtWhiteColor(
          msg:'To-Do Profile',
          fontSize: 16
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          '11 tasks',
          style:
              Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}

class ProfileCardWidget extends StatelessWidget {
  final String? title;
  final String? desc;
  final IconData? icon;
  final Color? iconColor;

  const ProfileCardWidget(
      {Key? key, this.title, this.desc, this.icon, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(icon, color: iconColor),
            const SizedBox(height: 25.0),
            Text(
              '$title',
            ),
            Text(
              '$desc',
            ),
          ],
        ),
      ),
    );
  }
}
class ProfileImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.0),
          bottomRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
        image: DecorationImage(
          image: NetworkImage(
            ApiConstant.DEMO_IMG,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}