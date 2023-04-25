import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({super.key, 
  //required this.name, required this.author, required this.price, required this.image,
  });
  // final String name;
  // final String author;
  // final int price; 
  // final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFFED2A0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 68, 68, 68).withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 10,
                        offset: Offset(1, 3),
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(image: AssetImage('assets/images/cl.jpeg'), fit: BoxFit.cover,)
                    ),
                ),
              ),
            ),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mona Lisa'),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.person_outlined, size: 18,),
                      Text('Leo'),
                    ],
                  )
                ],
              ),
              Text('500.000 \$'),
            ],
          )
        ],
      ),
    );
    // Padding(
    //   padding: const EdgeInsets.all(10.0),
    //   child: Column(
    //     children: [
    //       Container(
    //         decoration: BoxDecoration(color: Colors.amber),
    //         child: Container(
    //           alignment: Alignment.center,
    //           decoration: BoxDecoration(boxShadow: null),
    //           child: Padding(
    //             padding: const EdgeInsets.all(18.0),
    //             child: Container(child: Image(image: AssetImage('assets/images/ml.jpeg'), fit: BoxFit.fill,)),
    //           ),
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Column(
    //             children: [
    //               Text('name'),
    //               Row(
    //                 children: [
    //                   Icon(Icons.person_outlined),
    //                   Text('artist'),
    //                 ],
    //               )
    
    //             ],
    //           ),
    //           Text('cost'),
    //         ],
    //       )
    //     ],
    //   ),
    // );
  }
}