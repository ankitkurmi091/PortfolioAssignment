import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(),
      home: const PortfolioScreen(),
    );
  }
}

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  String _activeTab = 'Project';
  List<String> list1 = ['assets/first.png','assets/second1.png','assets/third.png','assets/fourth.png','assets/fifth.png'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Portfolio',
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/cart.png', width: 21, height: 21,),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/notification.png', width: 25, height: 25,),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTextButtonTab('Project', _activeTab == 'Project', () {
                setState(() {
                  _activeTab = 'Project';
                });
              }),
              _buildTextButtonTab('Saved', _activeTab == 'Saved', () {
                setState(() {
                  _activeTab = 'Saved';
                });
              }),
              _buildTextButtonTab('Shared', _activeTab == 'Shared', () {
                setState(() {
                  _activeTab = 'Shared';
                });
              }),
              _buildTextButtonTab('Achievement', _activeTab == 'Achievement', () {
                setState(() {
                  _activeTab = 'Achievement';
                });
              }),
            ],
          ),

          const SizedBox(height: 10),
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search a project',
                filled: true,
                fillColor: Colors.grey[200],
                suffixIcon: Image.asset('assets/search.png', width: 10, height: 10,scale: 1.4,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          if(_activeTab.contains('Project'))
            Container(
              // Project List Section
              child:  Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemBuilder: (context, index) {
                    return _buildProjectItem(list1[index]);
                  },
                ),
              ),
            ),
          if(_activeTab.contains('Saved'))
            Container(
              child: const Center(
                child: Text('This is Saved Page Container'),
              ),
            ),
          if(_activeTab.contains('Shared'))
            Container(
              child: const Center(
                child: Text('This is Shared Page Container'),
              ),
            ),
          if(_activeTab.contains('Achievement'))
            Container(
              child: const Center(
                child: Text('This is Achievement Page Container'),
              ),
            )

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set the active tab
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/home.png', width: 17, height: 17,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/portfololio.png', width: 17, height: 17,),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/input.png', width: 18, height: 18,),
            label: 'Input',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/profile.png', width: 17, height: 17),
            label: 'Profile',
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(

        onPressed: () {

        },
        label: const Text(' Filter ',style: TextStyle(color: Colors.white,fontSize: 17),),
        icon: const Icon(Icons.filter_list,color: Colors.white,),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Helper method to create project list item
  Widget _buildProjectItem(String iPath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(iPath,
            width: 65,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        title: const Text(
          'Kemampuan Merangkum Tulisan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('BAHASA SUNDA\nOleh Al-Baiqi Samaan'),

        trailing: Container(
          width: 60,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.orange[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Center(
            child: Text(
              'A',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20,),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextButtonTab(String tabName, bool isActive, VoidCallback onPressed) {
    return Column(
      children: [
        TextButton(onPressed: onPressed,
          child: Text(
            tabName,
            style: TextStyle(
              color: isActive ? Colors.red : Colors.grey,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        if (isActive)
          Container(
            height: 2,
            width: 40,
            color: Colors.red,
          ),
      ],
    );
  }
}