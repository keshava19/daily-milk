import 'package:daily_milk/model/milk_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<FormState>();

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
              decoration: InputDecoration(
                suffixText: AppLocalizations.of(context)!.milkQuantitySymbol,
                hintText: AppLocalizations.of(context)!.milkQuantity,
                labelText: AppLocalizations.of(context)!.milkLabel,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onSubmit,
            child: Text(AppLocalizations.of(context)!.milkSubmit),
          ),
        ],
      ),
    );
  }

  void onSubmit() async {
    if (formKey.currentState!.validate()) {
      var box = await Hive.openBox('hive_box');
      var milkEntry = MilkModel(
        date: DateTime.now().toUtc().toString(),
        // TODO: Have to get this at the first start of app and get from settings always.
        price: 45,
        quantity: 1,
      );
      box.add(milkEntry);
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)!.milkSubmitSuccess)),
      );
    }
  }
}
