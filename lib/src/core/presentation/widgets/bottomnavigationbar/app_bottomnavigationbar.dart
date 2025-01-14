import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_code/src/core/data/enums/e_bottomnavigation.dart';
import 'package:flutter_boilerplate_code/src/resources/app_colors.dart';
import 'package:flutter_boilerplate_code/src/resources/app_images.dart';
import 'package:flutter_boilerplate_code/src/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final EBottomNavigationBar? state;

  const AppBottomNavigationBar({
    super.key,
    this.state,
  });

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  Widget _buildNavigationItem({
    required String title,
    required svgAsset,
    bool active = false,
    Function? onPressed,
  }) {
    return IconButton(
      onPressed: () {
        onPressed?.call();
      },
      icon: Container(
        height: 68.h,
        width: 68.h,
        decoration: BoxDecoration(
          color: active? Colors.white : AppColors.primaryColorLight,
          shape: BoxShape.circle,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              svgAsset,
              height: 24.h,
              color: active ? AppColors.primaryColorLight : AppColors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.primaryColorLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff000000).withOpacity(.05),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(0, -1),
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavigationItem(
              title: "Home",
              svgAsset: AppImages.iconHome,
              active: widget.state == EBottomNavigationBar.home,
              onPressed: () {
                if (widget.state == EBottomNavigationBar.home) return;
                Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (route) => false);
              }),
          _buildNavigationItem(
            title: "Categories",
            svgAsset: AppImages.iconCategories,
            active: widget.state == EBottomNavigationBar.categories,
            onPressed: () {
              if (widget.state == EBottomNavigationBar.categories) return;
              Navigator.pushNamed(context, Routes.categoriesScreen,);
            },
          ),
          _buildNavigationItem(
            title: "Cart",
            svgAsset: AppImages.iconCart,
            active: widget.state == EBottomNavigationBar.cart,
            onPressed: () {
              if (widget.state == EBottomNavigationBar.cart) return;
              Navigator.pushNamed(context, Routes.cartScreen);
            },
          ),
          _buildNavigationItem(
            title: "Profile",
            svgAsset: AppImages.iconProfile,
            active: widget.state == EBottomNavigationBar.profile,
            onPressed: () {
              if (widget.state == EBottomNavigationBar.profile) return;
              Navigator.pushNamed(context, Routes.profileScreen);
            },
          ),
          _buildNavigationItem(
            title: "Messages",
            svgAsset: AppImages.iconMessage,
            active: widget.state == EBottomNavigationBar.message,
            onPressed: () {
              if (widget.state == EBottomNavigationBar.message) return;
              Navigator.pushNamed(context, Routes.chatScreen);
            },
          ),
        ],
      ),
    );
  }
}
