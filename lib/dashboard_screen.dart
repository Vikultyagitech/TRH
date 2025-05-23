
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Appointment_Screen.dart';
import 'package:flutter_application_3/Blog%20_Screen.dart';
import 'package:flutter_application_3/Settings_Screen.dart';
import 'package:flutter_application_3/Shop_screen.dart';
import 'package:flutter_application_3/aboutUs.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_application_3/Prosection_screen.dart';
import 'Explore_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home:  const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  // const DashboardScreen({super.key});
  final String? userName; // Add this line

  const DashboardScreen({super.key, this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Real Health'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(
            255, 145, 221, 207), // Change to a pastel light blue
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF3A3B3C), // Neutral dark color for contrast
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Color.fromARGB(255, 58, 60, 58)),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationsScreen()),
              );
            },
          ),
        ],
        iconTheme:
            const IconThemeData(color: Color(0xFF3A3B3C)), // Sidebar icon color
      ),
      drawer: const Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, userName),
            const SizedBox(height: 4),
            _buildAdSlider(),
            const SizedBox(height: 10),
            _buildFeaturesSection(context),
            _buildServicesSection(context),
            _buildExpertiseSection(context),
            _buildNutritionTipsSection(context),
            _buildContactUsSection(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatSupportScreen()),
          );
        },
        label: const Text('Support'),
        icon: const Icon(Icons.chat),
        backgroundColor: const Color.fromARGB(255, 229, 232, 229),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  // Ad Slider Section
  Widget _buildAdSlider() {
    List<String> adImages = [
      'https://etimg.etb2bimg.com/thumb/msid-105205469,imgsize-15434,width-1200,height=765,overlay-ethealth/industry/early-detection-of-pre-diabetes-to-prevent-diabetes-need-of-the-hour.jpg',
      'https://bpincontrol.in/wp-content/uploads/2023/08/Heart-Disease.jpg',
      'https://therealhealth.org/wp-content/uploads/2024/04/child-diet-200x200.png'
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 140.0,
          autoPlay: true,
          enlargeCenterPage: true,
          aspectRatio: 20 / 10,
          enableInfiniteScroll: true,
          autoPlayInterval: const Duration(seconds: 4),
        ),
        items: adImages.map((image) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              image,
              fit: BoxFit.cover,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey,
                  child: const Center(
                    child: Text(
                      'Failed to load image',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}

  // Widget _buildSidebar(BuildContext context) {
  //   return Drawer(
  //     child: ListView(
  //       children: [
  //         const UserAccountsDrawerHeader(
  //           accountName: Text(''),
  //           accountEmail: Text(''),
  //           currentAccountPicture: CircleAvatar(
  //             backgroundImage: NetworkImage('https://www.flaticon.com/free-icon/man_2202112?term=avatar&page=1&position=2&origin=tag&related_id=2202112'),
  //           ),
  //           decoration: BoxDecoration(color: Color.fromARGB(255, 243, 158, 96)),
  //         ),
  //         _buildDrawerItem(
  //             context, Icons.home, 'Home', const DashboardScreen()),
  //         _buildDrawerItem(context, Icons.health_and_safety, 'Health programs',
  //             const HealthProgramsScreen()),
  //         _buildDrawerItem(context, Icons.calendar_today, 'Appointments',
  //             const AppointmentsScreen()),
  //         _buildDrawerItem(
  //             context, Icons.shopping_cart, 'Shop', const ShopScreen()),
  //         _buildDrawerItem(context, Icons.article, 'Blogs', const BlogScreen()),
  //         const Divider(),
  //         _buildDrawerItem(
  //             context, Icons.settings, 'Settings', const SettingsScreen()),
  //         _buildDrawerItem(context, Icons.logout, 'Logout', null),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDrawerItem(
  //     BuildContext context, IconData icon, String title, Widget? destination) {
  //   return ListTile(
  //     leading: Icon(icon, color: const Color.fromARGB(255, 21, 136, 25)),
  //     title: Text(title),
  //     onTap: () {
  //       if (destination != null) {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => destination),
  //         );
  //       }
  //     },
  //   );
  // }
  
class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  // Default avatar image (set to any of your uploaded images initially)
  String selectedAvatar = 'assets/images/profile.png'; // Change this as needed
  String selectedAvatar1 = 'assets/images/boy.png';
  String selectedAvatar2 = 'assets/images/human.png';
  String selectedAvatar3 = 'assets/images/woman.png';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(''),
            accountEmail: const Text(''),
            currentAccountPicture: GestureDetector(
              onTap: () {
                _showAvatarSelectionDialog(context);
              },
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 70,
                backgroundImage: AssetImage(selectedAvatar),
              ),
            ),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 158, 96),
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Home', const DashboardScreen()),
          _buildDrawerItem(context, Icons.health_and_safety, 'Health Programs',
              const HealthProgramsScreen()),
          _buildDrawerItem(context, Icons.calendar_today, 'Appointments',
              const AppointmentsScreen()),
          _buildDrawerItem(context, Icons.shopping_cart, 'Shop', const ShopScreen()),
          _buildDrawerItem(context, Icons.article, 'Blogs', const BlogScreen()),
          const Divider(),
          _buildDrawerItem(context, Icons.settings, 'Settings', const SettingsScreen()),
          _buildDrawerItem(context, Icons.logout, 'Logout', null),
        ],
      ),
    );
  }

  // Function to show the avatar selection dialog
  void _showAvatarSelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Your Avatar'),
          content: Wrap(
            spacing: 10,
            children: [
              _avatarChoice('assets/images/human.png', context),
              _avatarChoice('assets/images/boy.png', context),
              _avatarChoice('assets/images/woman.png', context),
              _avatarChoice('assets/images/profile.png', context),
            ],
          ),
        );
      },
    );
  }

  // Helper function to create selectable avatars
  Widget _avatarChoice(String imagePath, BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAvatar = imagePath;
        });
        Navigator.of(context).pop(); // Close dialog
      },
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        radius: 30,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }

  // Function to create drawer items
  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, Widget? destination) {
    return ListTile(
      leading: Icon(icon, color: const Color.fromARGB(255, 21, 136, 25)),
      title: Text(title),
      onTap: () {
        if (destination != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        }
      },
    );
  }
}


  Widget _buildHeader(BuildContext context, String? userName) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.teal, Colors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 0,
            // backgroundImage: NetworkImage('https://therealhealth.org/wp-content/uploads/2024/04/both-removebg-preview.png'),
          ),
          const SizedBox(width: 19),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName != null ? 'Welcome, $userName!' : 'Welcome Back!', // Display the user's name
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Stay healthy with Real Health.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms).slideX(begin: -0.5);
  }


  Widget _buildFeaturesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Explore Features',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),  
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildFeatureTile(
                context,
                'PRAKRITI PARIKSHA',
                'assets/images/icon2.jpeg',
                url: 'https://therealhealth.org/prakriti-analysis/#single/0',
              ),
              _buildFeatureTile(
                context,
                'Nutrition Plans',
                Icons.restaurant,
                color: Colors.orange,
              ),
              _buildFeatureTile(
                context,
                'Wellness/Exercise Routines',
                Icons.self_improvement,
                color: Colors.teal,
              ),
              _buildFeatureTile(
                context,
                'Consultations',
                Icons.medical_services,
                color: Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureTile(
    BuildContext context,
    String title,
    dynamic asset, {
    Color? color,
    String? url,
  }) {
    return GestureDetector(
      onTap: () {
        if (url != null) {
          _launchURL(url);
        }
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            asset is IconData
                ? Icon(asset, size: 40, color: color ?? Colors.black)
                : Image.asset(asset, height: 40),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }


Future<void> _launchURL(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

Widget _buildServicesSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Services',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListTile(
          leading: const Icon(Icons.spa, color: Colors.green),
          title: const Text('Mental Wellness Programs'),
          subtitle: const Text('Tailored plans for your mental health.'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const WellnessScreen()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.food_bank, color: Colors.orange),
          title: const Text('Healthy Eating Guides'),
          subtitle: const Text('Nutrition-focused eating plans.'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NutritionScreen()),
            );
          },
        ),
      ],
    ),
  );
}

Widget _buildExpertiseSection(BuildContext context) {
  final List<Map<String, dynamic>> expertiseItems = [
    {
      'title': 'Diabetes & Pre Diabetes',
      'imageUrl':
          'https://etimg.etb2bimg.com/thumb/msid-105205469,imgsize-15434,width-1200,height=765,overlay-ethealth/industry/early-detection-of-pre-diabetes-to-prevent-diabetes-need-of-the-hour.jpg',
      'screen': const DiabetesScreen(),
    },
    {
      'title': 'Heart Disease',
      'imageUrl':
          'https://bpincontrol.in/wp-content/uploads/2023/08/Heart-Disease.jpg',
      'screen': const HeartDiseaseScreen(),
    },
    {
      'title': 'Weight Management',
      'imageUrl':
          'https://www.health.com/thmb/z8T-vu1AVZ9flwXK9P15kcRmr6c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Health-GettyImages-FoodsForWeightLoss-35e70ba668eb4d9783e89e93cabf55a9.jpg',
      'screen': const WeightManagementScreen(),
    },
    {
      'title': 'PCOD and Gynae Problems',
      'imageUrl':
          'https://therealhealth.org/wp-content/uploads/2024/04/pcod-p-200x200.png',
      'screen': const PcodScreen(),
    },
    {
      'title': 'Kids Immunity & Nutrition',
      'imageUrl':
          'https://therealhealth.org/wp-content/uploads/2024/04/child-diet-200x200.png',
      'screen': const KidsNutritionScreen(),
    },
    {
      'title': 'Nutrition for Cancer Patient',
      'imageUrl':
          'https://therealhealth.org/wp-content/uploads/2024/04/can-diet-200x200.png',
      'screen': const CancerNutritionScreen(),
    },
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Our Expertise',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: expertiseItems.length,
          itemBuilder: (context, index) {
            final item = expertiseItems[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => item['screen']),
                );
              },
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(item['imageUrl']),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    ),
  );
}

// Individual Screens
class DiabetesScreen extends StatelessWidget {
  const DiabetesScreen({super.key});

  static const String url = 'https://therealhealth.org/diabetes/';

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trigger URL opening after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _launchURL();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
      Navigator.pop(context); // Go back after launching URL
    });

    // Show a blank screen or loader briefly
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class HeartDiseaseScreen extends StatelessWidget {
  const HeartDiseaseScreen({super.key});

  static const String url = 'https://therealhealth.org/heart-diseases/';

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trigger URL opening after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _launchURL();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
      Navigator.pop(context); // Go back after launching URL
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Heart Disease Info')),
      body: const Center(
        child: Text('Launching Heart Disease URL...'),
      ),
    );
  }
}

class WeightManagementScreen extends StatelessWidget {
  const WeightManagementScreen({super.key});

  static const String url = 'https://therealhealth.org/obesity/';

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trigger URL opening after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _launchURL();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
      Navigator.pop(context); // Go back after launching URL
    });

    // Show a blank screen or loader briefly
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class PcodScreen extends StatelessWidget {
  const PcodScreen({super.key});

  static const String url = 'https://therealhealth.org/pcod/';

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trigger URL opening after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _launchURL();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
      Navigator.pop(context); // Go back after launching URL 
    });

    // Show a blank screen or loader briefly
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class KidsNutritionScreen extends StatelessWidget {
  const KidsNutritionScreen({super.key});

  static const String url =
      'https://therealhealth.org/kids-immunity-nutrition/';

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trigger URL opening after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _launchURL();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
      Navigator.pop(context); // Go back after launching URL
    });

    // Show a blank screen or loader briefly
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class CancerNutritionScreen extends StatelessWidget {
  const CancerNutritionScreen({super.key});

  static const String url =
      'https://therealhealth.org/nutrition-for-cancer-patients/';

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Trigger URL opening after widget build
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _launchURL();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
      Navigator.pop(context); // Go back after launching URL
    });

    // Show a blank screen or loader briefly
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

Widget _buildNutritionTipsSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Daily Nutrition Tips',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const Icon(Icons.local_dining, color: Colors.green),
                title: Text('Tip #$index: Eat More Greens'),
                subtitle:
                    const Text('Include green vegetables in your meals daily.'),
              ),
            );
          },
        ),
      ],
    ),
  );
}
// 
Widget _buildContactUsSection(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Us',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 20),
        _buildContactTile(
          icon: Icons.email,
          title: 'Email Us',
          subtitle: 'support@therealhealth.org',
          onTap: () => _launchEmail('support@therealhealth.org'),
        ),
        const SizedBox(height: 15),
        _buildContactTile(
          icon: Icons.phone,
          title: 'Call Us',
          subtitle: '(+91) 9991162741, 90154 09707',
          onTap: () => _launchPhoneCall('+919991162741'),
        ),
        const SizedBox(height: 15),
        _buildContactTile(
          icon: Icons.language,
          title: 'Visit Our Website',
          subtitle: 'https://therealhealth.org/',
          onTap: () => _launchWebsite('https://therealhealth.org/'),
        ),
      ],
    ),
  );
}

Widget _buildContactTile({
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.green, size: 24),
    ),
    title: Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade700,
      ),
    ),
    onTap: onTap,
  );
}

void _launchEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  if (await canLaunch(emailUri.toString())) {
    await launch(emailUri.toString());
  } else {
    throw 'Could not launch $emailUri';
  }
}

void _launchPhoneCall(String phoneNumber) async {
  final Uri phoneUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  if (await canLaunch(phoneUri.toString())) {
    await launch(phoneUri.toString());
  } else {
    throw 'Could not launch $phoneUri';
  }
}

void _launchWebsite(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

// Modify the BottomNavigationBar with onTap handling
Widget _buildBottomNavigationBar(BuildContext context) {
  final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

  return ValueListenableBuilder<int>(
    valueListenable: selectedIndexNotifier,
    builder: (context, selectedIndex, child) {
      return BottomNavigationBar(
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndexNotifier.value = index;
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const DashboardScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProSectionScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ExploreScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUsScreen()),
              );
              break;
          }
        },
        items: [
          _buildAnimatedNavItem(Icons.home, 'Home', 0, selectedIndex),
          _buildAnimatedNavItem(
              Icons.star_border_outlined, 'Pro', 1, selectedIndex),
          _buildAnimatedNavItem(Icons.explore, 'Explore', 2, selectedIndex),
          _buildAnimatedNavItem(Icons.support, 'About Us', 3, selectedIndex),
          // _buildAnimatedNavItem(
          //     Icons.contact_page, 'Contact', 4, selectedIndex),
        ],
      );
    },
  );
}

// Add this new helper method
BottomNavigationBarItem _buildAnimatedNavItem(
  IconData icon,
  String label,
  int index,
  int selectedIndex,
) {
  final isSelected = index == selectedIndex;

  return BottomNavigationBarItem(
    icon: AnimatedScale(
      scale: isSelected ? 2.3 : 1.0,
      duration: const Duration(milliseconds: 200),
      child: Icon(icon),
    ),
    label: label,
  );
}

// Additional Screens

// Additional Screens
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('No new notifications')),
    );
  }
}

class ChatSupportScreen extends StatelessWidget {
  const ChatSupportScreen({super.key});

  Future<void> _launchURL() async {
    const String phoneNumber = "+919015409707"; // Organization's WhatsApp number
    final String message = Uri.encodeComponent("Hello, I need support");
    final String url = "https://wa.me/$phoneNumber?text=$message";

    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat Support')),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _launchURL,
          icon: const Icon(Icons.chat, color: Colors.white),
          label: const Text("Chat on WhatsApp",
              style: TextStyle(color: Colors.white)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // WhatsApp theme color
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ),
    );
  }
}

class HealthProgramsScreen extends StatelessWidget {
  const HealthProgramsScreen({super.key});

  final List<Map<String, String>> programs = const [
    {
      "title": "Diabetes & Pre Diabetes",
      "content": "Learn how to manage and prevent diabetes with expert advice.",
      "imageUrl":
          "https://milehighspine.com/wp-content/uploads/Diabetes101A.jpg",
      "url": "https://therealhealth.org/diabetes/",
    },
    {
      "title": "Heart Diseases",
      "content": "Explore tips and programs for a healthy heart.",
      "imageUrl":
          "https://therealhealth.org/wp-content/uploads/2024/04/heart-p-1-200x200.png",
      "url": "https://therealhealth.org/heart-diseases/",
    },
    {
      "title": "Weight Management",
      "content": "Achieve your ideal weight with our comprehensive guidance.",
      "imageUrl":
          "https://therealhealth.org/wp-content/uploads/2024/04/weight-diet-200x200.png",
      "url": "https://therealhealth.org/obesity/",
    },
    {
      "title": "Gynae & PCOD",
      "content": "Specialized programs for women's health and PCOD management.",
      "imageUrl":
          "https://therealhealth.org/wp-content/uploads/2024/04/pcod-p-200x200.png",
      "url": "https://therealhealth.org/pcod/",
    },
    {
      "title": "Kids Immunity and Nutrition",
      "content": "Boost your child's immunity with nutrition-focused programs",
      "imageUrl":
          "https://therealhealth.org/wp-content/uploads/2024/04/child-diet-200x200.png",
      "url": "https://therealhealth.org/kids-immunity-nutrition/",
    },
    {
      "title": "Stress Management",
      "content": "Manage stress with expert techniques and guidance",
      "imageUrl":
          "https://cdn.prod.website-files.com/620e4101b2ce12a1a6bff0e8/63bc1fffef375305987d272a_Tips%20for%20Stress%20Management%20for%20Students.webp",
      "url": "https://therealhealth.org/stress-managment-pogram/",
    },
    {
      "title": "Nutrition For Cancer Patient",
      "content": "Tailored nutritional guidance for cancer patients",
      "imageUrl":
          "https://therealhealth.org/wp-content/uploads/2024/04/can-diet-200x200.png",
      "url": "https://therealhealth.org/low-immunity-2/",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Programs'),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          itemCount: programs.length,
          itemBuilder: (context, index) {
            final program = programs[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        program['imageUrl']!,
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const SizedBox(
                            height: 60,
                            width: 60,
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 60,
                            width: 60,
                            child: Icon(Icons.broken_image,
                                size: 40, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProgramDetailScreen(
                                    title: program["title"]!,
                                    content: program["content"]!,
                                    imageUrl: program["imageUrl"]!,
                                    url: program["url"]!,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              program["title"]!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            program["content"]!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProgramDetailScreen extends StatelessWidget {
  final String title;
  final String content;
  final String imageUrl;
  final String url;

  const ProgramDetailScreen({
    super.key,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.url,
  });

  Future<void> _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 200,
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _launchURL,
              child: const Text("Learn More"),
            ),
          ],
        ),
      ),
    );
  }
}

class WellnessScreen extends StatelessWidget {
  const WellnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wellness Programs')),
      body: const Center(child: Text('Details about Wellness Programs')),
    );
  }
}

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Healthy Eating')),
      body: const Center(child: Text('Details about Healthy Eating Plans')),
    );
  }
}

class SuccessStoryScreen extends StatelessWidget {
  const SuccessStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Success Story')),
      body: const Center(child: Text('Detailed Success Story')),
    );
  }
}

