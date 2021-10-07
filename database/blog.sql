-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Ağu 2021, 08:19:55
-- Sunucu sürümü: 10.4.20-MariaDB
-- PHP Sürümü: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `blog`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `aid` int(11) NOT NULL,
  `ad` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`aid`, `ad`, `email`, `password`) VALUES
(1, 'Ali Kar', 'ali@gmail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(2, 'Azra Ok', 'azra@mail.com', 'e10adc3949ba59abbe56e057f20f883e'),
(3, 'Veli Can', 'veli@mail.com', 'e10adc3949ba59abbe56e057f20f883e');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `blog`
--

CREATE TABLE `blog` (
  `bid` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `detail` text NOT NULL,
  `date` datetime NOT NULL,
  `aid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `blog`
--

INSERT INTO `blog` (`bid`, `title`, `detail`, `date`, `aid`) VALUES
(3, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2021-08-11 02:41:16', 2),
(5, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2021-08-11 02:45:47', 3),
(8, 'Büyük Patlama', '1929’da Edwin Hubble’ın uzak galaksilerdeki (galaksilerin ışığındaki) nispi kırmızıya kaymayı keşfinden sonra, bu gözlemi, çok uzak galaksilerin ve galaksi kümelerinin konumumuza oranla bir \"görünür hız\"a sahip olduklarını ortaya koyan bir kanıt olarak ele alındı. Bunlardan en yüksek \"görünür hız\"la hareket edenler en uzak olanlarıdır.[7] Galaksi kümeleri arasındaki uzaklık gitgide artmakta olduğuna göre, bunların hepsinin geçmişte bir arada olmaları gerekmektedir. Big Bang modeline göre, evren genişlemeden önceki bu ilk durumundayken aşırı derecede yoğun ve sıcak bir halde bulunuyordu. Bu ilk hale benzer koşullarda üretilen \"parçacık hızlandırıcı\"larla yapılan deney sonuçları teoriyi doğrulamaktadır. Fakat bu hızlandırıcılar, şimdiye dek yalnızca laboratuvar ortamındaki yüksek enerji sistemlerinde denenebilmiştir. Evrenin genişlemesi olgusu bir yana bırakılırsa, Big Bang teorisinin, ilk genişleme anına ilişkin bir bulgu olmaksızın bu ilk hale herhangi bir kesin açıklama getirmesi mümkün değildir. Kozmozdaki hafif elementlerin günümüzde gözlemlediğimiz bolluğu, Big Bang teorisince kabul edilen ilk nükleosentez[8] sonuçlarına uygun olarak, evrenin ilk hızlı genişleme ve soğuma dakikalarındaki nükleer süreçlerde hafif elementlerin oluşmuş olduğu tahminleriyle örtüşmektedir.(Hidrojen ve helyumun evrendeki oranı, yapılan teorik hesaplamalara göre Big Bang\'den arta kalması gereken hidrojen ve helyum oranıyla uyuşmaktadır. Evrenin bir başlangıcı olmasaydı, evrendeki hidrojenin tümüyle yanarak helyuma dönüşmüş olması gerekirdi.) Bu ilk dakikalarda, soğuyan evren bazı çekirdeklerin oluşmasına imkân sağlamış olmalıydı.(Belirli miktarlarda hidrojen, helyum ve lityum oluşmuştu.)', '2021-08-13 02:48:37', 1),
(10, 'AAA', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of ', '2021-08-13 02:53:31', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `contact`
--

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `contact`
--

INSERT INTO `contact` (`cid`, `name`, `email`, `message`) VALUES
(1, 'Kerem', 'kerem@mail.com', 'Kereeeem'),
(2, 'Şahsanem', 'sahsanem@mail.com', 'Güzel');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Tablo için indeksler `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`bid`);

--
-- Tablo için indeksler `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`cid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `blog`
--
ALTER TABLE `blog`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `contact`
--
ALTER TABLE `contact`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
