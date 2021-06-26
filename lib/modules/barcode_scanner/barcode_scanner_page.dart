import 'package:boletos/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:boletos/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:boletos/shared/constants/constants.dart';
import 'package:boletos/shared/themes/app_text_style.dart';
import 'package:boletos/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:boletos/shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'package:flutter/material.dart';

class BarcodeScannerPage extends StatefulWidget {
  BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  BarcodeScannerPageState createState() => BarcodeScannerPageState();
}

class BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, '/insert_boleto');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(children: [
        ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            }),
        RotatedBox(
          quarterTurns: 1,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.black.withOpacity(0.6),
              title: Text(
                Constants.TITLE_APPBAR,
                style: TextStyles.buttonBackground,
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: SetLabelButtons(
              primaryLabel: Constants.PRIMARY_LABEL,
              primaryOnPressed: () {
                Navigator.pushReplacementNamed(context, '/insert_boleto');
              },
              secondLabel: Constants.SECONDARY_LABEL,
              secondOnPressed: () {},
            ),
          ),
        ),
        ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  title: Constants.TITLE_BOTTOM_SHEET,
                  subTitle: Constants.SUBTITLE_BOTTOM_SHEET,
                  primaryLabel: Constants.PRIMARY_LABEL_BOTTOM_SHEET,
                  primaryOnPressed: () {
                    controller.scanWithCamera();
                  },
                  secondLabel: Constants.SECONDARY_LABEL_BOTTOM_SHEET,
                  secondOnPressed: () {
                    Navigator.pushReplacementNamed(context, '/insert_boleto');
                  },
                );
              } else {
                return Container();
              }
            }),
      ]),
    );
  }
}
