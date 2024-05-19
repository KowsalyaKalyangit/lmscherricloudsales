import 'package:leadingmanagementsystem/controller/profile_controller.dart';
import 'package:leadingmanagementsystem/view/menu/profile_bottomsheet.dart';
import '../../allpackages.dart';
import '../../utils/textstyles.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  ProfileController profileController = Get.put(ProfileController());
  @override
  void initState() {
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child:   Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 34.0,
                child: CircleAvatar(
                  backgroundColor: appcolor,
                  radius: 32.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/img/profile.png'),
                    radius: 28.0,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 3),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          "Testing\ntesting@gmail.com",
                          style: subtitleStylecolor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Get.to(const EditProfileScreen());

                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40))),
                    context: context,
                    builder: (BuildContext context) {
                      return Container(child: BottomSheetContent());
                    },
                  );
                },
                child: Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 9),
                    child: CircleAvatar(
                      backgroundColor: screenbackground,
                      child: Icon(
                        Icons.edit_square,
                        size: 15,
                        color: appcolor,
                      ),
                    )),
              )
            ],
          ));
        }
     
     
  }

