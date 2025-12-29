import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF86BC25);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [

           // header section

            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [primaryColor, Color(0xFF5A8018)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "My Profile",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                // images from assets folder

                Positioned(
                  top: 140,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.grey[300],
                      backgroundImage: const AssetImage('assets/images/realjob.jpg'),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 65),


            Text(
              "Md Imran",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey[800]),
            ),
            const SizedBox(height: 5),
            Text(
              "imran@email.com",
              style: TextStyle(fontSize: 14, color: Colors.grey[600], letterSpacing: 1),
            ),

            const SizedBox(height: 30),

            // manu item list

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _item(context, "Account Settings", Icons.settings_outlined, '/account', primaryColor),
                  _item(context, "Edit Profile", Icons.edit_outlined, '/edit-profile', primaryColor),
                  _item(context, "Terms & Conditions", Icons.description_outlined, '/terms', primaryColor),
                  _item(context, "Privacy Policy", Icons.privacy_tip_outlined, '/privacy', primaryColor),
                  _item(context, "Help & Support", Icons.help_outline, '/help', primaryColor),
                  const Divider(height: 40, thickness: 1),
                  _item(context, "Logout", Icons.logout_rounded, '/login', Colors.redAccent, logout: true),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _item(BuildContext context, String title, IconData icon, String route, Color color,
      {bool logout = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: logout ? Colors.redAccent : Colors.black87,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
        onTap: () {
          if (logout) {
            Navigator.pushNamedAndRemoveUntil(context, route, (route) => false);
          } else {
            Navigator.pushNamed(context, route);
          }
        },
      ),
    );
  }
}