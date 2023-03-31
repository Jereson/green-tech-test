import 'package:flutter/material.dart';
import 'package:green_tech_app/getit.dart';
import 'package:green_tech_app/model/setting_model.dart';
import 'package:green_tech_app/utils/base_view_builder.dart';
import 'package:green_tech_app/utils/color_utils.dart';
import 'package:green_tech_app/utils/text_style_utils.dart';
import 'package:green_tech_app/viewModel/profile_vm.dart';
import 'package:green_tech_app/views/widgets/app_bar.dart';
import 'package:green_tech_app/views/widgets/custom_dialog.dart';
import 'package:green_tech_app/views/widgets/custom_loader.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Account'),
      body: BaseViewBuilder<ProfileViewModel>(
          model: getIt(),
          initState: (init) {
            init.getUserDetail();
          },
          builder: (pVm, _) {
            return pVm.cachedUserDetail == null
                ? const CustomLoader()
                : SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          height: 100,
                          width: 100,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                        ),
                        const SizedBox(height: 20),
                        Text(pVm.cachedUserDetail!.data!.name ?? 'Hi User',
                            style: stBlack50016.copyWith(fontSize: 18)),
                        Text(
                            '@${pVm.cachedUserDetail!.data!.name!.split(' ').first}',
                            style: stBlackWithOpacity30014),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.all(20),
                              itemCount: settingData.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () => index == 0
                                      ? Navigator.of(context).pushNamed(
                                          settingData[index].routeName!)
                                      : index == 1
                                          ? showSuccess(
                                              context: context,
                                              title:
                                                  'Are you sure you want to logout?',
                                              btnText: 'Logout',
                                              textColor: kcE51414,
                                              callback: () {
                                                pVm.logout(context);
                                              })
                                          : null,

                                  // index == 2
                                  //     ? showSuccess(
                                  //         context: context,
                                  //         title: 'Are you sure you want to logout?',
                                  //         btnText: 'Logout',
                                  //         textColor: kcE51414,
                                  //         callback: () {
                                  //           pVm.logout(context);
                                  // })

                                  child: Container(
                                    color: Colors.white,
                                    margin: const EdgeInsets.only(bottom: 30),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kcPrimaryColor
                                                  .withOpacity(0.1)),
                                          child: Icon(
                                            settingData[index].iconn,
                                            color: kcPrimaryColor,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Text(settingData[index].title!),
                                        const Spacer(),
                                        Icon(Icons.arrow_forward_ios_sharp,
                                            color:
                                                kcPrimaryColor.withOpacity(0.1))
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  );
          }),
    );
  }
}
