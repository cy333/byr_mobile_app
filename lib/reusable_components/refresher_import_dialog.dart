import 'package:byr_mobile_app/customizations/theme_controller.dart';
import 'package:byr_mobile_app/reusable_components/refreshers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RefresherImporterDialog extends StatefulWidget {
  @override
  _RefresherImporterDialogState createState() => _RefresherImporterDialogState();
}

class _RefresherImporterDialogState extends State<RefresherImporterDialog> {
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextField urlField = TextField(
      controller: urlController,
      autofocus: true,
      decoration: new InputDecoration(labelText: 'URL'),
      style: TextStyle(color: E().dialogContentColor),
    );
    return SimpleDialog(
      backgroundColor: E().dialogBackgroundColor,
      title: Text(
        "refresherAdd".tr,
        style: TextStyle(
          fontSize: 17.0,
          color: E().dialogTitleColor,
        ),
      ),
      children: <Widget>[
        urlField,
        SimpleDialogOption(
          onPressed: () {
            BYRRefresherManager.instance().importOnlineRefresher(urlController.text, null).then((succeeded) {
              if (succeeded) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                          backgroundColor: E().dialogBackgroundColor,
                          title: Text(
                            "succeed".tr,
                            style: TextStyle(
                              fontSize: 17.0,
                              color: E().dialogTitleColor,
                            ),
                          ),
                          titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                        ));
              } else {
                showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                          backgroundColor: E().dialogBackgroundColor,
                          title: Text(
                            "fail".tr,
                            style: TextStyle(
                              fontSize: 17.0,
                              color: E().dialogTitleColor,
                            ),
                          ),
                          titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                        ));
              }
            }).catchError((handleError) {
              showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                        backgroundColor: E().dialogBackgroundColor,
                        title: Text(
                          "fail".tr,
                          style: TextStyle(
                            fontSize: 17.0,
                            color: E().dialogTitleColor,
                          ),
                        ),
                        titlePadding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 24.0),
                      ));
            });
          },
          child: Text(
            "confirmTrans".tr,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17.0,
              color: E().dialogButtonTextColor,
            ),
          ),
        ),
      ],
    );
  }
}
