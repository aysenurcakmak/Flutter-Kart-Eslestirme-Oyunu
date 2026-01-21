#  Flutter Kart Eşleştirme Oyunu

Mobil Programlama dersim için **Flutter** ve **Dart** kullanarak geliştirdiğim hafıza oyunu projesi. Flutter'da durum yönetimi (State Management) ve algoritma mantığını pekiştirmek amacıyla bu uygulamayı tasarladım.

##  Proje Hakkında

Bu projeyi yaparken amacım, klasik bir kart eşleştirme oyununu mobil platforma taşımaktı. Oyunda rastgele dağıtılan kartları eşleştirirken hem hamle sayısını hem de bulunan eşleşmeleri takip edebiliyorsunuz. Özellikle Flutter'ın widget yapısını ve `setState` kullanımını pratik etmemi sağlayan bir çalışma oldu.

##  Neler Kullandım?

Projeyi geliştirirken aşağıdaki teknoloji ve yapılardan faydalandım:

* **Flutter & Dart:** Uygulamanın iskeletini ve mantığını kurdum.
* **StatefulWidget:** Oyun içindeki anlık değişimleri (kartın dönmesi, puanın artması vb.) yönetmek için kullandım.
* **Asenkron Yapılar (Future & Await):** Yanlış eşleşme olduğunda kartların hemen kapanmaması, kullanıcının kısa bir süre (1 saniye) kartları görebilmesi için gecikme (delay) mekanizması ekledim.
* **Algoritma Mantığı:** `List.shuffle()` metodunu kullanarak her yeni oyunda kartların farklı ve rastgele dizilmesini sağladım.
* **GridView:** Kartları ekrana düzgün bir ızgara yapısında yerleştirmek için kullandım.

##  Uygulama Özellikleri

* **Rastgele Oyun:** Her başlattığınızda kartlar tamamen farklı yerleşiyor, ezber yapmayı engelliyor.
* **Skor Takibi:** Kaç hamlede bitirdiğinizi ve o anki eşleşme sayınızı ekranda görebiliyorsunuz.
* **Oyun Sonu Ekranı:** Tüm kartları eşleştirdiğinizde sizi tebrik eden ve toplam hamle sayınızı gösteren bir pencere açılıyor.
* **Tekrar Oyna:** Uygulamayı kapatmadan yeni bir oyuna başlayabiliyorsunuz.

##  Kurulum

Projeyi kendi bilgisayarınızda denemek isterseniz:

1.  Projeyi indirin:
    git clone https://github.com/aysenurcakmak/Flutter-Kart-Eslestirme-Oyunu.git

2.  Gerekli paketleri yükleyin:
    flutter pub get

3.  Emülatör açıkken çalıştırın:
    flutter run

    <img width="1716" height="817" alt="image" src="https://github.com/user-attachments/assets/fac035e7-b1a3-41af-9310-ed0ec63660b0" />


