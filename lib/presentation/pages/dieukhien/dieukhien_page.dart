import 'package:flutter/material.dart';
import 'package:pes/config/app_colors.dart';
import 'package:pes/di/app_injector.dart';
import 'package:pes/helper/loading_helper.dart';
import 'package:pes/providers/network/apis/home_api.dart';

class DieuKhienPage extends StatefulWidget {
  const DieuKhienPage({Key? key}) : super(key: key);

  @override
  State<DieuKhienPage> createState() => _DieuKhienPageState();
}

class _DieuKhienPageState extends State<DieuKhienPage> {
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
      body: const Center(child: Text('Control page')),
    );
  }
}
