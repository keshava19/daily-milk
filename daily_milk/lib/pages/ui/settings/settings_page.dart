import 'package:daily_milk/utils/hive_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final formKey = GlobalKey<FormState>();
  var quantityCtr = TextEditingController();
  var priceCtr = TextEditingController();

  @override
  void initState() {
    defaultValues();
    super.initState();
  }

  void defaultValues() async {
    var box = await Hive.openBox(HiveConstants.boxName);
    double price = box.get(HiveConstants.defaultPrice, defaultValue: 45);
    double quantity = box.get(HiveConstants.defaultQuantity, defaultValue: 1);
    priceCtr.text = price.toString();
    quantityCtr.text = quantity.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(width: MediaQuery.of(context).size.width),
          SizedBox(
            width: 120,
            child: TextFormField(
              validator: ((value) {
                return (value?.isEmpty ?? true)
                    ? AppLocalizations.of(context)!.required
                    : null;
              }),
              keyboardType: TextInputType.number,
              controller: quantityCtr,
              decoration: InputDecoration(
                suffixText: AppLocalizations.of(context)!.milkQuantitySymbol,
                labelText: AppLocalizations.of(context)!.defaultQuantity,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: 120,
            child: TextFormField(
              validator: ((value) {
                return (value?.isEmpty ?? true)
                    ? AppLocalizations.of(context)!.required
                    : null;
              }),
              keyboardType: TextInputType.number,
              controller: priceCtr,
              decoration: InputDecoration(
                suffixText: AppLocalizations.of(context)!.pricePerLitre,
                labelText: AppLocalizations.of(context)!.defaultPrice,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSubmit,
            child: Text(AppLocalizations.of(context)!.save),
          ),
        ],
      ),
    );
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      var box = await Hive.openBox(HiveConstants.boxName);
      var price = double.parse(priceCtr.text);
      var quantity = double.parse(quantityCtr.text);
      box.put(HiveConstants.defaultPrice, price);
      box.put(HiveConstants.defaultQuantity, quantity);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)!.settingsSubmitSuccess)),
      );
    }
  }
}
