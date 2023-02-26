import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nft_market/transaction.dart';

class Detail extends StatelessWidget {
  String price;
  String creator;
  String image;
  String minutes;
  String hours;
  String day;
  String name;
  String creator_image;
  String follower;
  Detail({
    super.key,
    required this.creator,
    required this.name,
    required this.price,
    required this.image,
    required this.day,
    required this.follower,
    required this.creator_image,
    required this.minutes,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6f8),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            appbar(context),
            follow(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(),
                    Text(
                      name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Help me cover the cost of attending Howard University, one of the top HBCUs in the country. As a low-income student, I need \$30,000 for tuition, room and board, and a laptop. Your support, no matter how small, can make a big difference in my life. Thank you for your generosity.',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter follow() {
    return SliverToBoxAdapter(
      child: ListTile(
        trailing: Container(
          alignment: Alignment.center,
          child: Text(
            'Donate',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),
          width: 80,
          height: 40,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(4, 2),
                color: Colors.grey.shade300,
                blurRadius: 20,
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        subtitle: Text(
          follower + ' Donors',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        title: Text(
          creator,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 19,
          ),
        ),
        leading: CircleAvatar(
            backgroundImage: AssetImage('images/${creator_image}')),
      ),
    );
  }

  SliverAppBar appbar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      expandedHeight: 500,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/${image}.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 70,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              day + ' D',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.grey.shade200.withOpacity(0.6),
                                  Colors.grey.shade100.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        ':',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(width: 4),
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              hours + ' H',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.grey.shade200.withOpacity(0.6),
                                  Colors.grey.shade100.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        ':',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(width: 4),
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              minutes + ' M',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            width: 39,
                            height: 39,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.topRight,
                                colors: [
                                  Colors.grey.shade200.withOpacity(0.6),
                                  Colors.grey.shade100.withOpacity(0.3),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset('images/et.png'),
                              Text(
                                price + ' CEL',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        width: 120,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.grey.shade200.withOpacity(0.6),
                              Colors.grey.shade100.withOpacity(0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(10),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            ),
            color: Color(0xfff4f6f8),
          ),
          child: Column(
            children: [
              SizedBox(height: 15),
              Container(
                width: 80,
                height: 4,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 19,
            child: GestureDetector(
              onTap: (){
              print("object");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TransactionPage()),
            );
          },
              child:Icon(
              Icons.info,
              color: Colors.white,
              size: 20,
            )),
          ),
        ),
      ],
      title: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 19,
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
}
