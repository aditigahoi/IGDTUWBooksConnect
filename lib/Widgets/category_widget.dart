import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> with SingleTickerProviderStateMixin  {

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this ,initialIndex:0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
     }
   _handleTabSelection(){
if(_tabController.indexIsChanging){
  setState(() { });
}
   }  

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  // final String categoryName;
  // final IconData icon;

 

  @override
  Widget build(BuildContext context) {
    return Card(
     // margin: EdgeInsets.only(right: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
            controller:_tabController,
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.black.withOpacity(0.6),
            isScrollable: true,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
              color:Colors.teal,
              width: 3,
              ),
              insets: EdgeInsets.symmetric(horizontal: 16), 
            ),
            labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
            labelPadding: EdgeInsets.symmetric(horizontal: 20),
            tabs:const [
            Tab(text: "Books",icon: Icon(Icons.book_online),),
            Tab(text: "Notes",icon: Icon(Icons.notes_outlined)),
            Tab(text: "Lab Coat",icon: Icon(Icons.book_online)),
            Tab(text: "Drafter",icon: Icon(Icons.book_online)),
          ]),
            // Icon(icon, size: 32),
            // const SizedBox(height: 10,width: 12),
            // Text(
            //   categoryName,
            //   style: TextStyle(fontSize: 12),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}