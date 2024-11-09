import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipi Bakery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Recipi Bakery'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  // Method untuk mengubah halaman saat button di BottomNavigationBar ditekan
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              setState(() {
                _currentIndex = 0;  // Navigate to Home screen
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              setState(() {
                _currentIndex = 1;  // Navigate to Favorite screen
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              setState(() {
                _currentIndex = 2;  // Navigate to Profile screen
              });
            },
          ),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Method untuk menentukan konten layar berdasarkan tab yang dipilih
  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return MyHomePageBody();
      case 1:
        return FavoriteScreen();
      case 2:
        return ProfileScreen();
      default:
        return MyHomePageBody();
    }
  }
}

// Body dari halaman utama
class MyHomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageCard(
                  imagePath: 'assets/image1.jpg',
                  label: 'Brownies',
                  context: context,
                ),
                _buildImageCard(
                  imagePath: 'assets/image2.jpg',
                  label: 'Pastry',
                  context: context,
                ),
              ],
            ),
          ),
          // Baris kedua dengan card gambar baru
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildImageCard(
                  imagePath: 'assets/image3.jpg',
                  label: 'Cake',
                  context: context,
                ),
                _buildImageCard(
                  imagePath: 'assets/image4.jpg',
                  label: 'Donat',
                  context: context,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk membuat Image Card
  GestureDetector _buildImageCard({
    required String imagePath,
    required String label,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigasi ke halaman detail gambar
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ImageDetailScreen(
              imagePath: imagePath,
              title: label,
            ),
          ),
        );
      },
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                imagePath,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Layar Favorite
class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Favorite Screen'),
    );
  }
}

// Layar Profile
class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

class ImageDetailScreen extends StatelessWidget {
  final String imagePath;
  final String title;

  ImageDetailScreen({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagePath,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'This is the detail view for $title',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
