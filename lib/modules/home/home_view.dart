import 'package:flavored_app_demo/extensions/double_ext.dart';
import 'package:flavored_app_demo/extensions/num_ext.dart';
import 'package:flavored_app_demo/flavor_config.dart';
import 'package:flavored_app_demo/global_widgets/app_bar.dart';
import 'package:flavored_app_demo/global_widgets/data_card.dart';
import 'package:flavored_app_demo/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                _buildBody(context),
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
      title: FlavorConfig.instance.name,
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

  Widget _buildBody(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (logic) {
        if (logic.isLoading) {
          return Expanded(
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 3.0,
                color: FlavorConfig.instance.color,
              ),
            ),
          );
        }

        if (logic.hasError) {
          return Expanded(
            child: Center(
              child: Text(
                logic.errorMessage,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          );
        }

        if (logic.dataRecord.rows == null ||
            logic.dataRecord.rows!.isEmpty ||
            logic.rows.isEmpty) {
          return Expanded(
            child: Center(
              child: Text(
                'No data found',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade300,
                ),
              ),
            ),
          );
        }

        return Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  color: Theme.of(context).cardColor,
                  child: _buildHeaderRow(),
                ),
                8.toSizedBoxHeight(),
                _buildName(logic),
                _buildListView(logic, context),
                if (!logic.isLoading &&
                    logic.dataRecord.rows!.length > logic.lastIndex)
                  _buildLoadMore(logic),
                _buildNote(context),
                16.toSizedBoxHeight(),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding _buildName(HomeController logic) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 8.0,
      ),
      child: Text(
        logic.rows.first.data[8],
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Container _buildNote(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      width: Get.width,
      padding: 4.0.edgeInsets(),
      child: Center(
        child: Text(
          'Note: Date shown is Trxn Date',
          style: TextStyle(
            color: Theme.of(context).textTheme.subtitle1!.color!,
          ),
        ),
      ),
    );
  }

  Center _buildLoadMore(HomeController logic) {
    return Center(
      child: TextButton(
        onPressed: () => logic.loadMore(),
        child: Text(
          'Load More',
          style: TextStyle(
            color: FlavorConfig.instance.color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Padding _buildListView(HomeController logic, BuildContext context) {
    return Padding(
      padding: 4.0.edgeInsets().copyWith(bottom: 0.0),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: logic.rows.length,
        itemBuilder: (ctx, i) {
          var item = logic.rows[i];
          return DataCard(item: item);
        },
      ),
    );
  }

  Row _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Trxn Date',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FlavorConfig.instance.color,
          ),
        ),
        Text(
          'Amt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FlavorConfig.instance.color,
          ),
        ),
        Text(
          'Type/Mode',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: FlavorConfig.instance.color,
          ),
        ),
      ],
    );
  }
}
