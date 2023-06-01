import 'package:flutter/material.dart';
import 'package:pes/config/app_colors.dart';
import 'package:pes/di/app_injector.dart';
import 'package:pes/helper/loading_helper.dart';
import 'package:pes/providers/network/apis/home_api.dart';

class GiamSatPage extends StatefulWidget {
  const GiamSatPage({Key? key}) : super(key: key);

  @override
  State<GiamSatPage> createState() => _GiamSatPageState();
}

class _GiamSatPageState extends State<GiamSatPage> {
  HomeAPI api = getIt<HomeAPI>();

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    LoadingHelper.showLoading();
    LoadingHelper.hiddenLoading();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainWhite,
      appBar: AppBar(),
      body: const Center(child: Text('Home page')),
    );
  }
}
