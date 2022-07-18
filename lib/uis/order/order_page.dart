import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trash_coin/uis/find_scrap/find_scrap_page.dart';
import 'package:trash_coin/uis/order/order_page_cubit.dart';

import '../../commons/app_bar.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  AppBarCommon appBar = AppBarCommon();
  OrderPageCubit orderPageCubit = OrderPageCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Your order"),
      ),
      body: buildBodyWidget(),
    );
  }

  Widget buildBodyWidget() {
    return BlocBuilder<OrderPageCubit, OrderPageState>(
      bloc: orderPageCubit,
      buildWhen: (pre, cur) {
        return pre.hintText != cur.hintText || pre.liquid != cur.liquid||pre.weight != cur.weight;
      },
      builder: (context, state) {
        return Container(
          decoration: _boxDecoBackground(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 41),
                  height: 180,
                  child: const Text(
                    "Let's get started!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                ),
                inputWidget(),
                const SizedBox(
                  height: 50,
                ),
                inputWidget1(),
                const SizedBox(
                  height: 50,
                ),
                questionWidget("Do you need to refill any liquid?", state),
                const SizedBox(
                  height: 50,
                ),
                questionWidget2("How much (approximately) does your scrap weigh?", state),
                const SizedBox(
                  height: 50,
                ),
                inputWidget2(),
                const SizedBox(
                  height: 50,
                ),
                popBackButton(),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget inputWidget() {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), boxShadow: [
        BoxShadow(
          color: Color(0xffC5C5C5),
          blurRadius: 6,
          offset: Offset(
            0,
            4,
          ),
        )
      ]),
      child: Container(
        padding: const EdgeInsets.only(left: 18),
        alignment: Alignment.centerLeft,
        width: 318,
        height: 48,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(31)),
        child: const TextField(
          decoration: InputDecoration.collapsed(hintText: "Scraps you want to sell? (Ex: Old toys, broken bike,...)", hintStyle: TextStyle(fontSize: 13)),
        ),
      ),
    );
  }

  Widget inputWidget1() {
    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), boxShadow: [
        BoxShadow(
          color: Color(0xffC5C5C5),
          blurRadius: 8,
          offset: Offset(
            0,
            5,
          ),
        )
      ]),
      child: Container(
        padding: const EdgeInsets.only(left: 18),
        alignment: Alignment.centerLeft,
        width: 318,
        height: 48,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(31)),
        child: const TextField(
          decoration: InputDecoration.collapsed(hintText: "How long can you wait?", hintStyle: TextStyle(fontSize: 13)),
        ),
      ),
    );
  }

  Widget inputWidget2() {
    return Container(
      height: 50,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), boxShadow: [
        BoxShadow(
          color: Color(0xffC5C5C5),
          blurRadius: 8,
          offset: Offset(
            0,
            5,
          ),
        )
      ]),
      child: Container(
        padding: const EdgeInsets.only(left: 18),
        alignment: Alignment.centerLeft,
        width: 318,
        height: 100,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(31)),
        child: const TextField(
          decoration: InputDecoration.collapsed(hintText: "Note", hintStyle: TextStyle(fontSize: 13)),
        ),
      ),
    );
  }

  Widget questionWidget(String text, OrderPageState state) {
    List<String> itemTypeList = [
      "Dish washing",
      "Hand washing",
      "Floor washing",
      "Glass washing",
      "Sanitizer",
    ];
    List<DropdownMenuItem<String>> _createList() {
      return itemTypeList
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList();
    }

    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), boxShadow: [
        BoxShadow(
          color: Color(0xffC5C5C5),
          blurRadius: 8,
          offset: Offset(
            0,
            5,
          ),
        )
      ]),
      child: Container(
        padding: const EdgeInsets.only(left: 18),
        alignment: Alignment.centerLeft,
        width: 318,
        height: 48,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(31)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: const Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.keyboard_arrow_down)),
            iconSize: 25,
            isExpanded: true,
            value: state.liquid,
            items: _createList(),
            onChanged: (String? value) {
              orderPageCubit.changeValue(value ?? '');
            },
            hint: Text(state.liquid != null && state.liquid != "" ? state.liquid ?? '' : text),
            style: const TextStyle(color: Colors.black, decorationColor: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget questionWidget2(String text, OrderPageState state ) {
    String? dropdownValue;
    List<String> itemTypeList = ["< 5 kg", "< 10 kg", "> 10 kg "];
    List<DropdownMenuItem<String>> _createList() {
      return itemTypeList
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList();
    }

    return Container(
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30)), boxShadow: [
        BoxShadow(
          color: Color(0xffC5C5C5),
          blurRadius: 8,
          offset: Offset(
            0,
            5,
          ),
        )
      ]),
      child: Container(
        padding: const EdgeInsets.only(left: 18),
        alignment: Alignment.centerLeft,
        width: 318,
        height: 60,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(31)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            icon: const Padding(padding: EdgeInsets.only(right: 15), child: Icon(Icons.keyboard_arrow_down)),
            iconSize: 25,
            isExpanded: true,
            value: state.weight,
            items: _createList(),
            onChanged: (String? value) {
              setState(() {
                orderPageCubit.changeValue2(value ?? "");
              });
            },
            hint: Text(state.weight != null && state.weight != "" ? state.weight ?? '' : text),
            style: const TextStyle(color: Colors.black, decorationColor: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget popBackButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 44,
        height: 44,
        margin: const EdgeInsets.only(right: 33),
        child: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ColorLoader2()));
          },
          child: const Icon(Icons.arrow_forward),
        ),
      ),
    );
  }

  BoxDecoration _boxDecoBackground() {
    return BoxDecoration(
        gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        Color.fromRGBO(95, 158, 160, 0.9),
        Color.fromRGBO(170, 255, 0, 0.8),
      ],
    ));
  }
}
