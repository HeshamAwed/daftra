import 'package:daftra/presentation/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final String description;
  final SheetType type;

  const CustomBottomSheet(
      {Key? key,
      required this.title,
      required this.description,
      required this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          color: Colors.white),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildIcons(context),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
            text: AppLocalizations.of(context)!.ok,
            width: 200,
            press: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  _buildIcons(BuildContext context) {
    if (type == SheetType.info) {
      return const Icon(
        Icons.info_outline,
        color: Colors.yellowAccent,
        size: 50,
      );
    } else if (type == SheetType.success) {
      return const Icon(
        Icons.done,
        color: Colors.green,
        size: 50,
      );
    } else if (type == SheetType.error) {
      return const Icon(
        Icons.error,
        color: Colors.red,
        size: 50,
      );
    } else {
      return const SizedBox();
    }
  }
}

enum SheetType { info, success, error }
