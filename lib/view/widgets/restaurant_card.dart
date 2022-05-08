import 'package:flutter/material.dart';


Widget restaurantCard(String name, String rating,String imageURL) {
    return Builder(
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width * .35,
          height: MediaQuery.of(context).size.height * .20,
          margin: const EdgeInsets.only(right: 15.0),
          decoration: 
            const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Image.network(
                      imageURL,
                      width:80,
                      height:80,),
              Text(
                name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                )
              ),
            ],
          ),
        );
      }
    );
  }