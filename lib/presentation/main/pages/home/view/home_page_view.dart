import 'package:flutter/material.dart';
import 'package:task/presentation/main/pages/home/view_model/home_page_view_model.dart';
import 'package:task/presentation/resources/color_manager.dart';
import 'package:task/presentation/resources/size_manger.dart';
import 'package:task/presentation/resources/string_manager.dart';

import '../../../../../model/category.dart';
import '../../../../../model/freelancer.dart';
import '../../../../../model/product.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final HomePageViewModel _viewModel = HomePageViewModel();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _getText(
            text: StringManager.product,
            stream: _viewModel.outputProductShown,
            details: _getProductDetails(),
            onTap: () {
              _viewModel.switchProduct();
            }),
        const SizedBox(
          height: SizeManager.s34,
        ),
        _getText(
          text: StringManager.freelancer,
          stream: _viewModel.outputFreeLancerShown,
          onTap: () {
            _viewModel.switchFreeLancer();
          },
          details: _getFreelancerDetails(),
        ),
      ],
    );
  }

  Widget _getText(
      {required String text,
      Stream<bool>? stream,
      void Function()? onTap,
      Widget? details}) {
    return StreamBuilder<bool>(
        stream: stream,
        builder: (context, snapshot) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(SizeManager.s34),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: ColorManager.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(SizeManager.s0, SizeManager.ns6),
                    color: ColorManager.grey2,
                    spreadRadius: SizeManager.s3,
                    blurRadius: SizeManager.s5,
                  )
                ]),
            child: snapshot.hasData
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: onTap,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              text,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            if (!snapshot.data!)
                              const Icon(
                                Icons.keyboard_arrow_right,
                                color: ColorManager.darkGrey,
                              ),
                            const Spacer(),
                            if (snapshot.data!)
                              const Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: ColorManager.darkGrey,
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (snapshot.data!) details!,
                    ],
                  )
                : const SizedBox(),
          );
        });
  }

  Widget _getProductDetails() {
    return StreamBuilder<ProductModel>(
        stream: _viewModel.outputProductModel,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: SizeManager.s34,
                    ),
                    _getSubTitleText(StringManager.newest),
                    _getProductList(snapshot.data!.newest),
                    const SizedBox(
                      height: SizeManager.s34,
                    ),
                    _getSubTitleText(StringManager.higherRating),
                    _getProductList(snapshot.data!.higherRating),
                    const SizedBox(
                      height: SizeManager.s34,
                    ),
                    _getSubTitleText(StringManager.category),
                    _getCategoryList(snapshot.data!.category),
                  ],
                )
              : const SizedBox();
        });
  }

  Widget _getFreelancerDetails() {
    return StreamBuilder<FreelancerModel>(
        stream: _viewModel.outputFreelancerModel,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: SizeManager.s34,
                    ),
                    _getSubTitleText(StringManager.higherRating),
                    _getFreelancerList(snapshot.data!.higherRating, false),
                    const SizedBox(
                      height: SizeManager.s34,
                    ),
                    _getSubTitleText(StringManager.moreCompletedProjects),
                    _getFreelancerList(
                        snapshot.data!.moreCompletedProjects, true),
                    const SizedBox(
                      height: SizeManager.s34,
                    ),
                    _getSubTitleText(StringManager.category),
                    _getCategoryList(
                      snapshot.data!.category,
                    )
                  ],
                )
              : const SizedBox();
        });
  }

  Widget _getProductList(List list) {
    return _getHorizontalList(children: [
      for (int i = 0; i < list.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeManager.s8, vertical: SizeManager.s12),
          child: Column(
            children: [
              Image.asset(
                list[i].image,
                width: SizeManager.s100,
                height: SizeManager.s90,
              ),
              Text(
                list[i].name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: SizeManager.s9,
                    ),
              ),
              Text(list[i].price.toString(),
                  style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
    ]);
  }

  Widget _getFreelancerList(List<Freelancer> list, bool completedProject) {
    return _getHorizontalList(children: [
      for (int i = 0; i < list.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeManager.s8, vertical: SizeManager.s12),
          child: Column(
            children: [
              Image.asset(
                list[i].image,
                width: SizeManager.s78,
                height: SizeManager.s78,
              ),
              Text(
                list[i].name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: SizeManager.s10,
                    ),
              ),
              Row(
                children: [
                  Icon(
                    completedProject ? Icons.check : Icons.star,
                    color: ColorManager.lightBlue,
                    size: SizeManager.s8,
                  ),
                  Text(
                      completedProject
                          ? list[i].completedProjects.toString()
                          : list[i].rating.toString(),
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ],
          ),
        ),
    ]);
  }

  Widget _getCategoryList(List<Category> list) {
    return _getHorizontalList(children: [
      for (int i = 0; i < list.length; i++)
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: SizeManager.s8, vertical: SizeManager.s12),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(
                  list[i].image,
                ),
                radius: SizeManager.s29,
              ),
              Text(
                list[i].name,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: SizeManager.s9,
                    ),
              ),
              Text(list[i].name.toString(),
                  style: Theme.of(context).textTheme.labelMedium),
            ],
          ),
        ),
    ]);
  }

  Widget _getSubTitleText(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
    );
  }

  Widget _getHorizontalList({required List<Widget> children}) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const AlwaysScrollableScrollPhysics(),
      child: Row(children: children),
    );
  }
}
