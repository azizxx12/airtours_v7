// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:AirTours/views/One-Way/Var.dart';

import 'available_flights_screen.dart';

class oneWay extends StatefulWidget {
  @override
  State<oneWay> createState() => _oneWayState();
}

class _oneWayState extends State<oneWay> {
  void toNext() {
    DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OneWaySearch(
            numOfPas: count,
            date: dateOnly,
            flightClass: currentPassenger,
            from: fromName!,
            to: toName!,
          ),
        ));
  }

  void icreaseCount() {
    setState(() {
      count++;
    });
  }

  void decreaseCount() {
    setState(() {
      if (count == 0) return;
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: DropdownSearch<String>(
                      mode: Mode.MENU,
                      showSelectedItems: true,
                      items: flightName,
                      onChanged: (value) => fromName = value,
                      dropdownSearchDecoration: InputDecoration(
                          suffixIcon: const Icon(Icons.flight_takeoff_rounded),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          labelText: "from",
                          hintText: "City"),
                      showSearchBox: true,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                        ],
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        showSelectedItems: true,
                        items: flightName,
                        onChanged: (value) => toName = value,
                        dropdownSearchDecoration: InputDecoration(
                            suffixIcon:
                                const Icon(Icons.flight_takeoff_rounded),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide.none),
                            labelText: "To",
                            hintText: "City"),
                        showSearchBox: true,
                      ),
                    )),
                const SizedBox(
                  height: 1,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      margin: const EdgeInsets.all(5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 2,
                          ),
                          const Text("   Departure date"),
                          Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 200, top: 8, bottom: 8),
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    elevation: 0,
                                    backgroundColor: Colors.white),
                                child: Text(
                                  "${dateTime.day} ${monthNames[dateTime.month - 1]}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 17),
                                ),
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2024));
                                  if (newDate == null) return;
                                  //print(start);
                                  //print("-----------");
                                  setState(() {
                                    dateTime = newDate;
                                    // print(start);
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(flex: 1, child: Text("Passenger: ")),
                            Expanded(
                                flex: 2,
                                child: Row(children: [
                                  TextButton(
                                      onPressed: decreaseCount,
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.black,
                                        size: 15,
                                      )),
                                  Text("$count"),
                                  TextButton(
                                      onPressed: icreaseCount,
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.black,
                                        size: 15,
                                      )),
                                  const SizedBox(
                                    height: 70,
                                  )
                                ])),
                          ],
                        ),
                      ),
                      //before children if we want it to be at the end of the container mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: RadioListTile(
                                title: const Text("Guest"),
                                value: passengerType[0],
                                groupValue: currentPassenger,
                                onChanged: (value) {
                                  setState(() {
                                    currentPassenger = value.toString();
                                  });
                                },
                              ),
                            ),
                            Flexible(
                              child: RadioListTile(
                                title: const Text("Business"),
                                value: passengerType[1],
                                groupValue: currentPassenger,
                                onChanged: (value) {
                                  setState(() {
                                    currentPassenger = value.toString();
                                    print(currentPassenger);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: toNext,
                  child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(blurRadius: 2, offset: Offset(0, 0))
                          ],
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue),
                      child: const Center(
                          child: Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))),
                )
              ],
            )));
  }
}
