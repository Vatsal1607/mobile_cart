import 'package:flutter/material.dart';

class HomeSingle extends StatefulWidget {
  const HomeSingle({Key? key}) : super(key: key);

  @override
  State<HomeSingle> createState() => _HomeSingleState();
}

class _HomeSingleState extends State<HomeSingle> {

  // This is for home page:
  var Mobiles = ['Iphone 14', 'Real me X2', 'Oppo A3s', 'One plus NORD', 'Vivo Y23', 'Oppo A9'];
  var searchChange = true;
  var mobileIndex = null;
  List<String> values1 = [
    'assets/images/nobita.jpg',
    'assets/images/nobita.jpg',
    'assets/images/nobita.jpg',
    'assets/images/nobita.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.accents.first,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // offset: const Offset(0, 10),
                          blurRadius: 10,
                          color: Color(807777).withOpacity(.23)
                      )
                    ]
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value){
                          print('${value}');
                          print(searchChange);
                          if(Mobiles.contains(value)){
                            print(Mobiles.indexOf(value));
                            setState(() {
                              searchChange = false;
                              mobileIndex = Mobiles.indexOf(value);
                            });
                          } else {
                            setState(() {
                              searchChange = true;
                            });
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none
                        ),
                      ),
                    ),
                    // SvgPicture.asset("assets/icons/search.svg")
                  ],
                )
            ),
          ),
          Text(searchChange.toString()),
          const SizedBox(height: 20,),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              searchChange == true ?
              Expanded(
                child: SizedBox(
                  height: 500,
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Card(child: Image.asset(values1[index],
                                  height: 110,
                                  width: 200,
                                ),
                                ),
                                Text(Mobiles[index])
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
                  : Column(
                children: [
                  Card(child: Image.asset('assets/images/nobita.jpg',
                    height: 110,
                    width: 200,
                  ),
                  ),
                  Text(Mobiles[mobileIndex]),
                ],
              ),
              // Expanded(
              //   child: SizedBox(
              //     height: 500,
              //     width: double.infinity,
              //     child: ListView(
              //       scrollDirection: Axis.horizontal,
              //       children: List.generate(values1.length, (index) => Image.asset(values1[index]),
              //       ),),
              //   ),
              // ),
            ],
          ),

          // Container(
          //   height: 300,
          //   child: ListView.builder(
          //     // itemCount: 3,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (context, index){
          //         return Row(
          //           children: List.generate(values1.length, (index) => Center(child: Image.asset(values1[index]),),),
          //         );
          //       }
          //   ),
          // )
        ],
      ),
    );
  }
}
