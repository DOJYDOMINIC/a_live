import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../control/controllar.dart';


class DropDown extends StatelessWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerOne = Provider.of<ProviderOne>(context);
    final selectedIndex = providerOne.selectedIndex;

    return DropdownButton(
      isExpanded: true,
      value: providerOne.items[selectedIndex],
      icon: const Icon(Icons.keyboard_arrow_down),
      items: providerOne.items
          .map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      ))
          .toList(),
      onChanged: (newValue) {
        final index = providerOne.items.indexOf(newValue!);
        providerOne.setSelectedIndex(index, context);
      },
    );
  }
}
