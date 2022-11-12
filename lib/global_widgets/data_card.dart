import 'package:flavored_app_demo/extensions/num_ext.dart';
import 'package:flutter/material.dart';
import 'package:flavored_app_demo/models/data_row.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataCard extends StatelessWidget {
  DataCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final RowData item;
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.data[2],
                    style: TextStyle(
                      color: Theme.of(context).textTheme.subtitle1!.color!,
                    ),
                  ),
                  4.toSizedBoxHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.data[9],
                      ),
                      Text(
                        item.data[13],
                      ),
                      Text(
                        '${item.data[7]} - ${item.data[1]}',
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Enter a numeric value',
                      hintStyle: TextStyle(
                        fontSize: 13.0,
                        color: Colors.grey,
                      ),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}'),
                      ),
                      LengthLimitingTextInputFormatter(4),
                    ],
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ),
            8.toSizedBoxWidth(),
            InkWell(
              onTap: () {
                Get.toNamed(
                  '/details',
                  arguments: [
                    item.id,
                    textEditingController.text,
                  ],
                );
              },
              child: Icon(
                Icons.arrow_forward_ios,
                color: Theme.of(context).textTheme.subtitle1!.color!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
