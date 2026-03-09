import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Yeh humari main app class hai
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Upar right corner se 'Debug' banner hatane ke liye
      title: 'Image Display Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ImageAssignmentScreen(), // Screen ko call kar rahe hain
    );
  }
}

// Yeh humari main screen hai jahan hum photos dikhayenge
class ImageAssignmentScreen extends StatelessWidget {
  const ImageAssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Assignment 1: Displaying Images'),
        backgroundColor: Colors.blueAccent,
      ),
      // SingleChildScrollView se screen scroll ho sakti hai (mobile friendly)
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // ==========================================================
              // TASK 1: Displaying an Image from Assets (Local Image)
              // ==========================================================
              const Text(
                '1. Asset Image (Border & Shadow)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Container ka use karke hum shadow (parchhai) laga rahe hain
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Container ke corners gol kiye
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5), // Shadow ka color aur opacity
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5), // Shadow ko thoda neeche shift kiya
                    ),
                  ],
                ),
                // ClipRRect ka use image ke corners ko gol karne ke liye hota hai
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/my_image.png', // DHYAN DEIN: pubspec.yaml mein iska path hona zaroori hai
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover, // Image ko box mein perfect fit karne ke liye
                  ),
                ),
              ),

              const SizedBox(height: 40), // Dono tasks ke beech gap

              // ==========================================================
              // TASK 2: Displaying an Image from the Network (Internet)
              // ==========================================================
              const Text(
                '2. Network Image (Loading & Error Handling)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Container + shadow for network image (consistent with Task 1)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                  'https://picsum.photos/400/300', // Ek random high-quality image ka link
                  width: 300,
                  height: 200,
                  fit: BoxFit.cover,

                  // loadingBuilder: Jab tak image internet se download ho rahi hai, tab tak kya dikhega
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child; // Agar load ho gayi, toh image dikhao
                    return SizedBox(
                      width: 300,
                      height: 200,
                      child: Center(
                        child: CircularProgressIndicator( // Gol ghoomne wala loading icon
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },

                  // errorBuilder: Agar internet na ho ya link kharab ho, toh app crash hone se bachayega
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 300,
                      height: 200,
                      color: Colors.grey[200],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, color: Colors.red, size: 50),
                          SizedBox(height: 10),
                          Text('Failed to load image', style: TextStyle(color: Colors.red)),
                        ],
                      ),
                    );
                  },
                ),
                ),
              ),

              const SizedBox(height: 40),

              // ==========================================================
              // TASK 3: Simple Network Image (Jo aapne share kiya tha)
              // ==========================================================
              const Text(
                '3. Simple Network Image Test',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Styled with shadow and rounded corners for consistency
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.5),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const Image(
                    image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 30), // End of screen gap
            ],
          ),
        ),
      ),
    );
  }
}