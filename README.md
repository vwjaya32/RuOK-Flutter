# Pemrograman Berbasis Platform 2022/2023

## Kelompok E-10 👨‍👨‍👦‍👦  
2106638614 - Felix Tjahyadi  
2106637776 - Vinsen Wijaya  
2106708324 - Marcelinus Gerardo  
2106633626 - Rafito Humam Abrar  
2106650001 - Thobyas Muda Parlindungan  
2106751184 - Balqis Asy-Syifa Lumbun  

- [Deskripsi](#ruok) 📱
- [Link](#link-aplikasi) 🌍
- [Modul](#modul) 🎯
- [Alur Integrasi](#alur-integrasi) 🕊

<br>
<br>

# **RuOK** (*Are u OK?*)
Sebagai tindak lanjut dari usaha kami dalam membantu menyelesaikan masalah mental dunia, kami memutuskan untuk melakukan aplikasi _mobile_ sebagai bentuk perluasann akses menuju website **RuOK**. Aplikasi ini kurang lebih akan memiliki modul atau fitur yang sama dengan versi _website_-nya. 
<br>
<br>

### **Link Aplikasi**
👇👇👇👇👇👇👇  
MASIH DALAM PENGEMBANGAN
<br>
<br>


### **Modul**
Modul yang akan diimplementasikan dalam aplikasi _mobile_ yang akan kami buat.<br> 

**`Stories` - Rafito**  
Pada modul ini pengguna dapat membuat thread dan me-reply thread yang ada. Pengguna yang berpartisipasi dalam suatu story akan masuk dalam daftar peserta thread.<br>

**`Articles` - Gerardo**  
Secara umum, modul ini akan menampilkan artikel tentang kesehatan mental. Berikut ini adalah gambaran mengenai action yang dapat dilakukan pada Articles:
- Artikel hanya dapat dibuat dan dihapus oleh `admin`, namun dapat dibaca oleh siapapun
- Setiap `user` dapat memberikan komentar untuk sebuah komentar dengan *pseudonym*
- Setiap komentar yang telah di-*post* tidak dapat dapat dihapus, kecuali oleh `admin`<br>

**`Community Events` - Felix**  
Terdapat daftar event yang dapat diikuti oleh user. Sebuah acara hanya dapat dibuat oleh Admin, user yang sudah login dapat mendaftarkan diri pada acara tersebut.<br>

**`Mental Health Goods` - Thobyas**  
Modul ini akan menampilkan barang yang berhubungan dengan kesehatan mental untuk yang dijual di website ini.<br>

**`Mental Health Tests` - Balqis**  
Modul ini akan menampilkan pertanyaan singkat untuk menilai keadaan mental seseorang.<br>

**`Motivational Quotes` - Vinsen**  
Pada modul ini, pengguna dapat mengunggah gambar berisi kutipan motivasi yang dapat dilihat oleh user lain.<br>
<br>
<br>

### **Alur integrasi**
Kami akan melakukan integrasi menghubungkan isi JSON yang ada di proyek heroku dengan cara membuat model flutter yang serupa dengan model django. Kami akan mengambil data dari url json yang dimiliki heroku dan mengaktifkan dependency HTTP serta menampilkan data dengan widget FutureBuilder.
