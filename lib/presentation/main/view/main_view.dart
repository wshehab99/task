import 'package:flutter/material.dart';
import 'package:task/presentation/common/widgets/custom_app_bar.dart';
import 'package:task/presentation/main/pages/folder/folder_page_view.dart';
import 'package:task/presentation/main/pages/home/view/home_page_view.dart';
import "../pages/account/account_page_view.dart";
import '../pages/settings/settings_page_view.dart';
import '../view_model/main_view_model.dart';
import 'package:task/presentation/resources/assets_manager.dart';
import 'package:task/presentation/resources/color_manager.dart';
import 'package:task/presentation/resources/size_manger.dart';
import '../../common/widgets/custom_navigation_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final MainViewModel _viewModel = MainViewModel();
  final List<Widget> _pages = [
    const HomePageView(),
    const FolderPageView(),
    const SettingsPageView(),
    const AccountPageView(),
  ];
  final List<String> icons = [
    AssetSvgManager.home,
    AssetSvgManager.folder,
    AssetSvgManager.settings,
    AssetSvgManager.person
  ];
  @override
  void initState() {
    _viewModel.init();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        stream: _viewModel.outputCurrentIndex,
        builder: (context, snapshot) {
          int currentIndex = snapshot.data ?? 0;
          return Scaffold(
              body: SingleChildScrollView(
                child: Stack(children: [
                  _getBackgroundImage(),
                  _getOpacityContainer(),
                  _getPage(currentIndex),
                ]),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: CustomNavigationBar(
                icons: icons,
                currentIndex: currentIndex,
                onTap: _viewModel.setCurrentIndex,
              ));
        });
  }

  Widget _getBackgroundImage() {
    return Positioned(
      top: SizeManager.s0,
      left: SizeManager.s0,
      child: Container(
        height: SizeManager.s337,
        width: SizeManager.s428,
        decoration: BoxDecoration(
          color: ColorManager.lightBlue.withOpacity(0.9),
        ),
        child: Image.asset(AssetImageManager.home),
      ),
    );
  }

  Widget _getOpacityContainer() {
    return Positioned(
      top: SizeManager.s0,
      left: SizeManager.s0,
      child: Container(
        height: SizeManager.s337,
        width: SizeManager.s428,
        decoration:
            BoxDecoration(color: ColorManager.lightBlue.withOpacity(0.9)),
      ),
    );
  }

  Widget _getPage(int currentIndex) {
    return Column(
      children: [
        const CustomAppBar(),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(SizeManager.s13)),
          child: _pages[currentIndex],
        ),
      ],
    );
  }
}
