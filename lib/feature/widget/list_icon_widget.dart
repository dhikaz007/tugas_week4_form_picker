// Membuat Class List Icon
import 'package:flutter/material.dart';

class ListIcon {
  // Inisialisasi parameter
  final String namaIcon;
  final IconData icon;

  const ListIcon({required this.namaIcon, required this.icon});
}

// List Icon dalam bentuk Map
const List<ListIcon> iconsList = [
  ListIcon(namaIcon: 'Telepon', icon: Icons.phone_rounded),
  ListIcon(namaIcon: 'Pesan', icon: Icons.message_rounded),
  ListIcon(namaIcon: 'Pengaturan', icon: Icons.settings_rounded),
  ListIcon(namaIcon: 'Peramban Web', icon: Icons.open_in_browser_rounded),
  ListIcon(namaIcon: 'Kalender', icon: Icons.calendar_today_rounded),
  ListIcon(namaIcon: 'Pemutar Musik', icon: Icons.library_music_rounded),
  ListIcon(namaIcon: 'Pemutar Video', icon: Icons.video_library_rounded),
  ListIcon(namaIcon: 'Kontak', icon: Icons.contacts_rounded),
  ListIcon(namaIcon: 'Galeri Foto', icon: Icons.photo_library_rounded),
  ListIcon(namaIcon: 'Kamera', icon: Icons.camera_rounded),
  ListIcon(namaIcon: 'Buat Postingan', icon: Icons.post_add_rounded)
];
