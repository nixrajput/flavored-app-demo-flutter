import 'package:flavored_app_demo/extensions/double_ext.dart';
import 'package:flavored_app_demo/flavor_config.dart';
import 'package:flavored_app_demo/global_widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildAppBar(context),
                Divider(
                  height: 0.0,
                  color: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .color!
                      .withOpacity(0.75),
                ),
                _buildBody(context, args),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomAppBar _buildAppBar(BuildContext context) {
    return CustomAppBar(
      bgColor: Theme.of(context).cardColor,
      title: 'Details',
      titleStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: FlavorConfig.instance.color,
      ),
      padding: 8.0.edgeInsets().copyWith(
            top: 16.0,
            bottom: 16.0,
          ),
    );
  }

  Widget _buildBody(BuildContext context, args) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'ID: ${args[0]}',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: FlavorConfig.instance.color,
                ),
          ),
          Text(
            'Value: ${args[1]}',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: FlavorConfig.instance.color,
                ),
          ),
        ],
      ),
    );
  }
}
