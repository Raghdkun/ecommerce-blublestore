import 'package:flutter/material.dart';
import 'package:powerecommerce/core/constant/color.dart';

class CustomSearch extends StatelessWidget {
  final TextEditingController? mycontroller;
  final String myText;
  final void Function(String)? onChanged;
  final void Function()? onSearch;
  final void Function()? onCloseSearch;

  CustomSearch(
      {super.key,
      required this.myText,
      this.onChanged,
      this.mycontroller,
      this.onCloseSearch,
      this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: SizedBox(
                  height: 55,
                  child: TextFormField(
                    controller: mycontroller,
                    onChanged: onChanged,
                    decoration: InputDecoration(
                        suffixIcon: !mycontroller!.text.isNotEmpty && mycontroller!.text == "" ? null : IconButton(
                            icon: Icon(Icons.close), onPressed: onCloseSearch),
                        // prefixIcon: const Icon(Icons.search),
                        hintText: myText,
                        hintStyle: const TextStyle(
                          fontSize: 18,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.grey[200]),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 1,
              child: MaterialButton(
                height: 50,
                onPressed: onSearch,
                color: AppColor.customBlack,
                child: const Icon(Icons.search, color: Colors.white),
              ),
            )
          ],
        ));
  }
}
