import 'package:book_store/Features/Cart/Model/governerates_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';

class CityDropDown extends StatelessWidget {
  SingleValueDropDownController controller;
  String hint;
  List<Governorate> list;
  Function? onChange;
  CityDropDown({
    super.key,
    required this.controller,
    required this.hint,
    required this.list,
    this.onChange,
  });
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: list.isNotEmpty,
      builder: (context) => DropDownTextField(
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Can\'t be empty';
          }
          return null;
        },
        textFieldDecoration: InputDecoration(
          labelText: hint,
          enabledBorder: const OutlineInputBorder(),
        ),
        controller: controller,
        searchDecoration: InputDecoration(hintText: hint),
        enableSearch: true,
        dropDownItemCount: list.length,
        dropDownList: list.map<DropDownValueModel>((value) {
          return DropDownValueModel(
            value: value.id,
            name: value.governorateNameEn!,
          );
        }).toList(),
        onChanged: (value) {
          if (onChange != null) {
            onChange!.call();
          }
        },
      ),
      fallback: (context) => const CircularProgressIndicator(),
    );
  }
}
