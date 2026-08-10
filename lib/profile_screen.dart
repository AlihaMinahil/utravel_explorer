import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Aliha Minahil";
  String userEmail = "aliha.minahil@gmail.com";
  int selectedIndex = 4;

  // Modern Girl Profile Picture URL
  final String profileImageUrl =
      "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=500&auto=format&fit=crop";

  void openEditProfile() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          name: userName,
          email: userEmail,
        ),
      ),
    );

    if (result != null && result is Map) {
      setState(() {
        userName = result["name"] ?? userName;
        userEmail = result["email"] ?? userEmail;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FC),
      body: Column(
        children: [
          // ================= PROFILE HEADER =================
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 6,
              bottom: 24,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff082B57),
                  Color(0xff075BE8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                // Top Navigation Row with Back Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        "My Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 48), // Balance space for symmetry
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Profile Avatar with Edit Icon
                GestureDetector(
                  onTap: openEditProfile,
                  child: Stack(
                    children: [
                      Container(
                        width: 86,
                        height: 86,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.network(
                            profileImageUrl,
                            fit: BoxFit.cover,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                color: const Color(0xffE8F0FA),
                                child: const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Color(0xff075BE8),
                                    ),
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) {
                              return const CircleAvatar(
                                backgroundColor: Color(0xffE8F0FA),
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Color(0xff075BE8),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        right: 2,
                        bottom: 2,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                            color: const Color(0xff075BE8),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 13,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 3),

                Text(
                  userEmail,
                  style: const TextStyle(
                    color: Color(0xffC8D8EC),
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),

          // ================= MENU OPTIONS =================
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              physics: const BouncingScrollPhysics(),
              children: [
                _buildSectionHeader("Account"),

                _buildCardGroup([
                  _menuItem(
                    icon: Icons.person_outline_rounded,
                    title: "Edit Profile",
                    onTap: openEditProfile,
                  ),
                  _menuItem(
                    icon: Icons.credit_card_rounded,
                    title: "Saved Payment Methods",
                    onTap: () {},
                  ),
                  _menuItem(
                    icon: Icons.notifications_none_rounded,
                    title: "Notifications",
                    onTap: () {},
                  ),
                ]),

                const SizedBox(height: 14),

                _buildSectionHeader("Preferences & Support"),

                _buildCardGroup([
                  _menuItem(
                    icon: Icons.settings_outlined,
                    title: "Settings",
                    onTap: () {},
                  ),
                  _menuItem(
                    icon: Icons.help_outline_rounded,
                    title: "Help & Support",
                    onTap: () {},
                  ),
                  _menuItem(
                    icon: Icons.info_outline_rounded,
                    title: "About Us",
                    onTap: () {},
                    showDivider: false,
                  ),
                ]),

                const SizedBox(height: 20),

                // Logout Button Card
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Logged out successfully"),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.logout_rounded,
                            size: 18,
                            color: Colors.redAccent,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Logout",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Section Heading
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Color(0xff697589),
        ),
      ),
    );
  }

  // Card Container Wrap
  Widget _buildCardGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  // List Item Tile
  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: const Color(0xffF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    icon,
                    size: 18,
                    color: const Color(0xff075BE8),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xff172842),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  size: 20,
                  color: Color(0xff94A3B8),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(
            height: 1,
            thickness: 0.8,
            indent: 50,
            endIndent: 14,
            color: Color(0xffF1F5F9),
          ),
      ],
    );
  }

  // Bottom Nav Bar
  Widget _buildBottomNavigationBar() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(icon: Icons.home_outlined, label: 'Home', index: 0),
          _navItem(icon: Icons.explore_outlined, label: 'Explore', index: 1),
          _navItem(icon: Icons.favorite_border, label: 'Favorites', index: 2),
          _navItem(icon: Icons.history, label: 'Recent', index: 3),
          _navItem(icon: Icons.person, label: 'Profile', index: 4),
        ],
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool selected = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 20,
              color: selected ? const Color(0xff075BE8) : const Color(0xff697589),
            ),
            const SizedBox(height: 3),
            Text(
              label,
              style: TextStyle(
                fontSize: 9,
                color: selected ? const Color(0xff075BE8) : const Color(0xff697589),
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}