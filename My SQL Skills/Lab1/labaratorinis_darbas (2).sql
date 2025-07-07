-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2024 at 05:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labaratorinis darbas`
--

-- --------------------------------------------------------

--
-- Table structure for table `atsiliepimai`
--

CREATE TABLE `atsiliepimai` (
  `Tekstas` varchar(255) NOT NULL,
  `_vertinimas` int(11) NOT NULL,
  `Data` date NOT NULL,
  `id_Atsiliepimai` int(11) NOT NULL,
  `fk_Kursasid_Kursas` int(11) NOT NULL,
  `fk_Klientasid_Klientas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `atsiliepimai`
--

INSERT INTO `atsiliepimai` (`Tekstas`, `_vertinimas`, `Data`, `id_Atsiliepimai`, `fk_Kursasid_Kursas`, `fk_Klientasid_Klientas`) VALUES
('Geriausias kursas, labiausiai kompetetingi destytojai', 10, '2020-03-26', 1, 1, 1),
('Likau nusivyles kursu kokybe', 8, '2024-03-02', 2, 2, 8),
('Kursai labai patiko', 9, '2016-03-16', 3, 5, 6),
('Kursai labai geri', 9, '2020-06-05', 6, 11, 9),
('Kursai labai geri, juos baiges iskart gavau darbo pasiulyma', 10, '2024-03-16', 7, 2, 15),
('Kursai labai geri', 9, '2020-03-20', 8, 11, 9),
('Kursai yra labai geros kokybes, desto labai kompetetingi destytojai', 9, '2024-03-20', 10, 7, 15),
('Kursai yra labai blogos kokybes, neverta moketi pinigu', 1, '2021-03-22', 11, 3, 20);

-- --------------------------------------------------------

--
-- Table structure for table `filialai`
--

CREATE TABLE `filialai` (
  `Miestas` varchar(50) NOT NULL,
  `Adresas` varchar(100) NOT NULL,
  `Tel__numeris` varchar(50) NOT NULL,
  `El__pastas` varchar(255) NOT NULL,
  `Vadovas` varchar(50) NOT NULL,
  `id_Filialas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `filialai`
--

INSERT INTO `filialai` (`Miestas`, `Adresas`, `Tel__numeris`, `El__pastas`, `Vadovas`, `id_Filialas`) VALUES
('Kaunas', 'K. Donelaičio g., Kaunas, 44214 Kauno m. sav.', '+3705459178', 'KaunasCodingschool@gmail.com', 'Jonas Jonaitis', 3),
('Alytus', '4677 Pocius Port Apt. 456', '+37065799661', 'aleksandraskalvenas@kavaliauskas.org', 'Emilis Butkus', 4),
('Klaipėda', '468 Evelina Orchard', '+37067195281', 'gustasnarusis@hotmail.com', 'Edgaras Galdikas', 5),
('Marijampolė', '4322 Gailius Corners Suite 041', '+37063374401', 'mantas70@urbonas.net', 'Darija Petrauskas', 6),
('Marijampolė', 'Unit 1300 Box 3382', '+37067917939', 'dariusnarusis@hotmail.com', 'Nerijus Kazlauskas', 7),
('Vilnius', '7027 Ignė Spring Apt. 455', '+37068092400', 'agne41@gmail.com', 'Laurynas Jankauskas', 8),
('Mažeikiai', '49050 Kairys Lodge', '+37068040652', 'dvsiliauskas@gmail.com', 'Milda Kalvaitis', 9),
('Kaunas', '5926 Stankevičius Parkway Apt. 216', '+37065539517', 'arielenarusis@zukauskas-zukauskas.net', 'Danielius Gailius', 10),
('Kaunas', 'Prancuzu g. 722A', '+37041523945', 'codinschool123@gail.com', 'Algimantas Petratis', 15),
('Vilnius', 'Kauno g. 53A', '+37041571545', 'codinschoolVilnius@gail.com', 'Linas Adomaitis', 16);

-- --------------------------------------------------------

--
-- Table structure for table `kalba`
--

CREATE TABLE `kalba` (
  `id_Kalba` int(11) NOT NULL,
  `name` char(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `kalba`
--

INSERT INTO `kalba` (`id_Kalba`, `name`) VALUES
(1, 'Lietuviu'),
(2, 'Anglu'),
(3, 'Rusu');

-- --------------------------------------------------------

--
-- Table structure for table `klientai`
--

CREATE TABLE `klientai` (
  `Vardas` varchar(50) NOT NULL,
  `Pavarde` varchar(50) NOT NULL,
  `Miestas` varchar(50) NOT NULL,
  `Am_ius` int(11) NOT NULL,
  `El__pastas` varchar(255) NOT NULL,
  `Tel__nr` varchar(40) NOT NULL,
  `Kliento_kodas` varchar(50) NOT NULL,
  `Vartotojo_vardas` varchar(50) NOT NULL,
  `Slapta_odis` varchar(255) NOT NULL,
  `Back_up_fraze` varchar(255) NOT NULL,
  `id_Klientas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `klientai`
--

INSERT INTO `klientai` (`Vardas`, `Pavarde`, `Miestas`, `Am_ius`, `El__pastas`, `Tel__nr`, `Kliento_kodas`, `Vartotojo_vardas`, `Slapta_odis`, `Back_up_fraze`, `id_Klientas`) VALUES
('Rokas', 'Gudziunas', 'Kaunas', 20, 'rokas123gudziunas@gmail.com', '+37064561295', '20030801', 'rgudziunas', 'rokas123', 'Buckis', 1),
('Jonas', 'Jonaitis', 'Vilnius', 25, 'jonas123@gmail.com', '+3705454884', '20080405', 'jonasgud', 'jonas456', 'Jonelis', 2),
('Martynas', 'Maraitis', 'Klaipeda', 35, 'jmar123@gmail.com', '+3705784884', '20070405', 'jmarsgud', 'markas456', 'Markelis', 3),
('Alanas', 'Alenas', 'Kaunas', 25, 'alan123@gmail.com', '+37789784884', '20450405', 'alanssgud', 'alanas456', 'Alankiukas', 4),
('Martynas', 'Mar', 'Alytus', 45, 'martynas123@gmail.com', '+37781284884', '22650405', 'martynssgud', 'martynas4896', 'Lektuvas skrenda', 5),
('Jovita', 'Tom', 'Kaunas', 22, 'jovita123@gmail.com', '+37784784884', '22650478', 'jovitute', 'jovita123', 'Nemegstu ciuozinet paciuzom', 6),
('Rugile', 'Raganaite', 'Mazeikiai', 20, 'rugile123@gmail.com', '+37784104884', '23150448', 'gilerugile', 'ruga123', 'Suo', 7),
('Gedmantas', 'Subarcikas', 'Mazeikiai', 20, 'gedma123@gmail.com', '+37784105584', '23040438', 'gedma123', 'gedma453', 'Subaru geriausia masina', 8),
('Saulius', 'Mazininkas', 'Alytus', 21, 'saulius123@gmail.com', '+37745107584', '20120468', 'saulius123', 'saulenskas453', 'Saule sviecia', 9),
('Eimantas', 'Rail', 'Vilnius', 24, 'eima123456@gmail.com', '+37745145684', '20178938', 'eima123', 'eimutis453', 'Kamuolys', 10),
('Kasparas', 'Griod', 'Vilnius', 22, 'kaspa123456@gmail.com', '+37744125684', '24185338', 'kaspa123', 'kasparasg453', 'Kvepalai', 11),
('Martynas', 'Jank', 'Kaunas', 21, 'martynasjank456@gmail.com', '+37744412434', '24111136', 'martusgg', 'martynelis453', 'Blah blah blah', 12),
('Jonas', 'Petraitis', 'Kaunas', 30, 'jonas.petraitis@email.com', '+37012345678', '24111137', 'jonukas', 'petraitis123', 'Upės teka', 13),
('Ieva', 'Kazlauskienė', 'Vilnius', 25, 'ieva.kazl@email.com', '+37012345679', '24111138', 'ievute', 'kazlauskiene456', 'Žalias lapas', 14),
('Tomas', 'Antanaitis', 'Marijampole', 40, 'tomas.antanas@email.com', '+37012345680', '24111139', 'tomukas', 'antanaitis789', 'Baltas katinas', 15),
('Laura', 'Bajoraitė', 'Alytus', 35, 'laura.bajoraite@email.com', '+37012345681', '24111140', 'laurute', 'bajoraite123', 'Raudona rožė', 16),
('Rokas', 'Kairys', 'Kaunas', 22, 'rokas.kairys@email.com', '+37012345682', '24111141', 'rokass', 'kairys456', 'Mėlynas dangus', 17),
('Greta', 'Norvilaitė', 'Vilnius', 28, 'greta.norvilaite@email.com', '+37012345683', '24111142', 'gretute', 'norvilaitė789', 'Geltonas obuolys', 18),
('Mindaugas', 'Juozapavičius', 'Marijampole', 45, 'mindaugas.juoz@email.com', '+37012345684', '24111143', 'mindis', 'juozapavicius123', 'Juoda akmens', 19),
('Eglė', 'Žalčiūtė', 'Alytus', 32, 'egle.zalciute@email.com', '+37012345685', '24111144', 'eglyte', 'zalciute456', 'Žalias šakas', 20),
('Vytas', 'Vaitiekūnas', 'Kaunas', 27, 'vytas.vaitiekunas@email.com', '+37012345686', '24111145', 'vytukas', 'vaitiekunas789', 'Rudas ruduo', 21),
('Monika', 'Pavardenė', 'Vilnius', 29, 'monika.pavardene@email.com', '+37012345687', '24111146', 'monikute', 'pavardene123', 'Pilka pelytė', 22),
('Darius', 'Būtvydas', 'Mazeikiai', 33, 'darius.butvydas@email.com', '+37012345688', '24111147', 'dariukas', 'butvydas234', 'Vėjo gūsis', 23),
('Kristina', 'Alytienė', 'Alytus', 26, 'kristina.alyt@gmail.com', '+37012345689', '24111148', 'kristyte', 'alytiene567', 'Rudenėjantis parkas', 24),
('Justas', 'Vilnietis', 'Vilnius', 29, 'justas.vilnietis@email.com', '+37012345690', '24111149', 'justukas', 'vilnietis789', 'Šaltas ledas', 25),
('Agnė', 'Marijampolietė', 'Marijampole', 24, 'agne.marijamp@gmail.com', '+37012345691', '24111150', 'agnute', 'marijamp123', 'Saulės spindulys', 26),
('Linas', 'Kaunietis', 'Kaunas', 37, 'linas.kaunietis@email.com', '+37012345692', '24111151', 'linukas', 'kaunietis345', 'Geltona alyva', 27),
('Erika', 'Mažeikiene', 'Mažeikiai', 31, 'erika.mazeikiene@email.com', '+37012345693', '24111152', 'erikute', 'mazeikiene678', 'Languotas megztinis', 28),
('Ramūnas', 'Vilnietis', 'Vilnius', 22, 'ramunas.vilnietis@email.com', '+37012345694', '24111153', 'ramukas', 'vilnietis890', 'Spalvingas balionas', 29),
('Giedrė', 'Kazlauskaite', 'Kaunas', 28, 'giedre.kazl@email.com', '+37012345695', '24111154', 'giedryte', 'kazlauskaite456', 'Pirmosios gėlės', 30);

-- --------------------------------------------------------

--
-- Table structure for table `kursai`
--

CREATE TABLE `kursai` (
  `Pavadinimas` varchar(40) NOT NULL,
  `Kurso_kodas` varchar(40) NOT NULL,
  `Kurso_kaina` double NOT NULL,
  `Ar_finansuojamas_UT` tinyint(1) NOT NULL,
  `Aprasymas` varchar(255) NOT NULL,
  `Kurso_lygmuo` varchar(40) DEFAULT NULL,
  `Ar_reikalinga_programavimo_patirtis` tinyint(1) DEFAULT NULL,
  `Naudojamos_technologijos` varchar(150) DEFAULT NULL,
  `Reikalinga_programine__ranga` varchar(150) DEFAULT NULL,
  `Kurso_reitingas` double DEFAULT NULL,
  `Sertifikavimo_galimybe` tinyint(1) NOT NULL,
  `Mokymu_trukm__val` int(11) NOT NULL,
  `Kokia_kalba_vedamas_kursas` int(11) NOT NULL,
  `id_Kursas` int(11) NOT NULL,
  `fk_Filialasid_Filialas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `kursai`
--

INSERT INTO `kursai` (`Pavadinimas`, `Kurso_kodas`, `Kurso_kaina`, `Ar_finansuojamas_UT`, `Aprasymas`, `Kurso_lygmuo`, `Ar_reikalinga_programavimo_patirtis`, `Naudojamos_technologijos`, `Reikalinga_programine__ranga`, `Kurso_reitingas`, `Sertifikavimo_galimybe`, `Mokymu_trukm__val`, `Kokia_kalba_vedamas_kursas`, `id_Kursas`, `fk_Filialasid_Filialas`) VALUES
('Introduction to Data Structures and Algo', 'KYM-56670', 1300.27, 1, 'Kursas tiems, kurie nori susipazinti ir ivaldyti svarbias duomenu strukturas', 'Pradedantiesiems', 0, 'C#, Java, Python', 'VsCode, IntiliJ, Visual Studio 2022', 1.6, 1, 107, 2, 1, 4),
('Excel and PowerBi', 'KYM-56670', 1300.27, 1, 'Kursas tiems, kurie nori susipazinti su duomenu analitika', 'Pradedantiesiems', 0, 'C#, Java, Python', 'VsCode, IntiliJ, Visual Studio 2022', 9.8, 1, 115, 1, 2, 5),
('DevOps', 'KYM-57881', 1300.27, 1, 'Kursas tiems, kurie nori susipazinti su DevOpa', 'Pazengusiems', 0, 'Java, Python', 'VsCode, IntiliJ, Visual Studio 2022', 9.8, 1, 115, 3, 3, 8),
('Advanced Python Programming', 'GVK-77981', 1841.22, 1, 'Python kursai pazengusiems', 'Pazengusiems', 0, ' Python', 'IntelliJ IDEA', 8.5, 1, 108, 1, 4, 3),
('Advanced Python Programming', 'GVK-77981', 1841.22, 1, 'Python kursai pazengusiems', 'Pazengusiems', 0, ' Python', 'IntelliJ IDEA', 8.5, 1, 108, 1, 5, 5),
('Advanced Python Programming', 'GVK-77981', 1841.22, 1, 'Python kursai pazengusiems', 'Pazengusiems', 0, ' Python', 'IntelliJ IDEA', 8.5, 1, 108, 1, 6, 7),
('Advanced Python Programming', 'GVK-77981', 1841.22, 1, 'Python kursai pazengusiems', 'Pazengusiems', 0, ' Python', 'IntelliJ IDEA', 8.5, 1, 108, 1, 7, 9),
('Data Science and Machine Learning', 'AVL-78981', 2500.22, 1, 'Kuras skirtas susipazinti su duomenu analitika naudojant Python ir masininio mokynosi metodus', 'Pazengusiems', 1, 'Python, R', 'IntelliJ IDEA, Rstudio', 9.5, 1, 150, 2, 10, 4),
('Data Science and Machine Learning', 'AVL-78981', 2500.22, 1, 'Kuras skirtas susipazinti su duomenu analitika naudojant Python ir masininio mokynosi metodus', 'Pazengusiems', 1, 'Python, R', 'IntelliJ IDEA, Rstudio', 7.5, 1, 150, 2, 11, 6),
('Data Science and Machine Learning', 'AVL-78981', 2500.22, 1, 'Kuras skirtas susipazinti su duomenu analitika naudojant Python ir masininio mokynosi metodus', 'Pazengusiems', 1, 'Python, R', 'IntelliJ IDEA, Rstudio', 8.4, 1, 150, 2, 12, 9),
('Automated Testing', 'TLLK-77971', 1499.99, 1, 'Susipazinimas su automatizuotu testavimu', 'Pradedantiesiems', 0, 'JUni, pytest', 'SoapUI, Cucumber', 9, 1, 90, 2, 15, 3),
('Automated Testing', 'TLLK-77971', 1499.99, 1, 'Susipazinimas su automatizuotu testavimu', 'Pradedantiesiems', 0, 'JUni, pytest', 'SoapUI, Cucumber', 9, 1, 90, 3, 16, 3),
('Automated Testing', 'TLLK-77971', 1499.99, 1, 'Susipazinimas su automatizuotu testavimu', 'Pradedantiesiems', 0, 'JUni, pytest', 'SoapUI, Cucumber', 9, 1, 90, 1, 17, 5),
('Automated Testing', 'TLLK-77971', 1499.99, 1, 'Susipazinimas su automatizuotu testavimu', 'Pradedantiesiems', 0, 'JUni, pytest', 'SoapUI, Cucumber', 9, 1, 90, 1, 18, 7),
('Automated Testing', 'TLLK-77971', 1499.99, 1, 'Susipazinimas su automatizuotu testavimu', 'Pradedantiesiems', 0, 'JUni, pytest', 'SoapUI, Cucumber', 9.5, 1, 90, 2, 19, 8),
('Data engineering', 'EEK-47981', 1600.22, 1, 'Duomenu inzinerijos mokslai', 'Pradedantiesiems', 0, ' Python SQL', 'IntelliJ IDEA, SQL', 9.3, 1, 108, 2, 21, 10),
('Data engineering', 'EEK-47981', 1600.22, 1, 'Duomenu inzinerijos mokslai', 'Pradedantiesiems', 0, ' Python SQL', 'IntelliJ IDEA, SQL', 9.3, 1, 108, 2, 22, 4),
('Data engineering', 'EEK-47981', 1600.22, 1, 'Duomenu inzinerijos mokslai', 'Pradedantiesiems', 0, ' Python SQL', 'IntelliJ IDEA, SQL', 9.3, 1, 108, 2, 23, 6),
('Data engineering', 'EEK-47981', 1600.22, 1, 'Duomenu inzinerijos mokslai', 'Pradedantiesiems', 0, ' Python SQL', 'IntelliJ IDEA, SQL', 9.3, 1, 108, 2, 24, 9),
('Data engineering', 'EER-47981', 1800.22, 1, 'Duomenu inzinerijos mokslai', 'Pazengusiems', 0, ' Python SQL', 'IntelliJ IDEA, SQL', 8.9, 1, 108, 1, 25, 3),
('Data engineering', 'EER-47981', 1800.22, 1, 'Duomenu inzinerijos mokslai', 'Pazengusiems', 1, ' Python SQL', 'IntelliJ IDEA, SQL', 8.9, 1, 108, 1, 27, 6),
('Data engineering', 'EER-47981', 1800.22, 1, 'Duomenu inzinerijos mokslai', 'Pazengusiems', 1, ' Python SQL', 'IntelliJ IDEA, SQL', 8.9, 1, 108, 1, 28, 8),
('Data engineering', 'EER-47981', 1800.22, 1, 'Duomenu inzinerijos mokslai', 'Pazengusiems', 1, ' Python SQL', 'IntelliJ IDEA, SQL', 8.9, 1, 108, 1, 29, 10),
('Introduction to Cloud', 'CVK-45981', 1300.22, 1, 'Debesu kompiuterijos kursai', 'Pradedantiesiems', 0, ' AWS, MS Azure', 'IntelliJ IDEA, AWS', 9, 1, 118, 1, 30, 3),
('Introduction to Cloud', 'CVK-45981', 1300.22, 1, 'Debesu kompiuterijos kursai', 'Pradedantiesiems', 0, ' AWS, MS Azure', 'IntelliJ IDEA, AWS', 9, 1, 118, 1, 31, 5),
('Introduction to Cloud', 'CVK-45981', 1300.22, 1, 'Debesu kompiuterijos kursai', 'Pradedantiesiems', 0, ' AWS, MS Azure', 'IntelliJ IDEA, AWS', 9, 1, 118, 1, 32, 8),
('Introduction to Cloud', 'CVK-45981', 1300.22, 1, 'Debesu kompiuterijos kursai', 'Pradedantiesiems', 0, ' AWS, MS Azure', 'IntelliJ IDEA, AWS', 9, 1, 118, 1, 33, 10),
('Cloud Architecture', 'GAA-77981', 1841.22, 1, 'Mokymasis naudoti clouda', 'Pažengusiems', 1, 'AWS, Python', 'IntelliJ IDEA', 8.5, 1, 110, 2, 34, 6),
('Advanced .Net', 'LAA-77901', 1600.22, 1, 'Mokymasis naudoti C# .Net', 'Pažengusiems', 1, 'C# .Net', 'Visual Studio Code', 9, 1, 95, 1, 35, 4),
('Begginer .Net', 'LAA-77902', 1400.22, 1, 'Mokymasis naudoti C# .Net Pradedantiesiems', 'Pradedantiesiems', 0, 'C# .Net', 'Visual Studio Code', 9, 1, 80, 1, 36, 4),
('Prompt Engineering', 'AAA-67902', 1000.22, 1, 'Mokymasis generuoti gerus atsakymus su AI', 'Pradedantiesiems', 0, 'Pyrhon ChatGPT', 'VsCode', 9, 1, 50, 2, 37, 10),
('Front End Development', 'BAA-57902', 1200.22, 1, 'Mokymasis kurti svetaines su front end technologijomis', 'Pradedantiesiems', 0, 'HTML, CSS, Java Script', 'VsCode', 7, 1, 80, 1, 38, 6),
('Front End Development', 'BAA-57902', 1200.22, 1, 'Mokymasis kurti svetaines su front end technologijomis', 'Pradedantiesiems', 0, 'HTML, CSS, Java Script', 'VsCode', 7, 1, 80, 2, 39, 3),
('Front End Development', 'BAA-57902', 1200.22, 1, 'Mokymasis kurti svetaines su front end technologijomis', 'Pazengusiems', 1, 'HTML, CSS, Java Script, React', 'VsCode', 9, 1, 110, 1, 40, 5),
('Front End Development', 'BAA-57902', 1200.22, 1, 'Mokymasis kurti svetaines su front end technologijomis', 'Pazengusiems', 1, 'HTML, CSS, Java Script, React', 'VsCode', 9, 1, 110, 1, 41, 8),
('Front End Development', 'BAA-57902', 1200.22, 1, 'Mokymasis kurti svetaines su front end technologijomis', 'Pazengusiems', 1, 'HTML, CSS, Java Script, React', 'VsCode', 9, 1, 110, 1, 42, 10),
('Full-Stack course', 'CAA-57902', 1400.22, 1, 'Mokymasis kurti svetaines su front end technologijomis ir kuriant back-end', 'Pazengusiems', 1, 'HTML, CSS, Java Script, React, ASP.Net', 'VsCod0, Visual Studio', 9, 1, 120, 2, 43, 10),
('Cloud Architecture', 'GAA-77981', 1841.22, 1, 'Mokymasis naudoti clouda', 'Pažengusiems', 1, 'AWS, Python', 'IntelliJ IDEA', 8.5, 1, 110, 2, 46, 15),
('Cloud Architecture', 'GAA-77981', 1841.22, 1, 'Mokymasis naudoti clouda', 'Pažengusiems', 1, 'AWS, Python', 'IntelliJ IDEA', 8.5, 1, 110, 2, 47, 16);

-- --------------------------------------------------------

--
-- Table structure for table `kurso_vedejai`
--

CREATE TABLE `kurso_vedejai` (
  `Vardas` varchar(60) NOT NULL,
  `Pavarde` varchar(60) NOT NULL,
  `Kurso_vedejo_kodas` varchar(60) NOT NULL,
  `Kurso_vedejo_el__pastas` varchar(255) DEFAULT NULL,
  `Issilavinimas` varchar(100) DEFAULT NULL,
  `Patirtis` varchar(100) DEFAULT NULL,
  `id_Kurso_vedejas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `kurso_vedejai`
--

INSERT INTO `kurso_vedejai` (`Vardas`, `Pavarde`, `Kurso_vedejo_kodas`, `Kurso_vedejo_el__pastas`, `Issilavinimas`, `Patirtis`, `id_Kurso_vedejas`) VALUES
('Jonas', 'Jonaitis', '12345', 'jonaitis45@gmail.com', 'Aukstasis', 'Senior Software Developer at Bentley', 1),
('Rokis', 'Gudziunaitis', '12344', 'rokaitis@gmail.com', 'Aukstasis', 'Mid Tester  at Bentley', 2),
('Martynas', 'Kaltanaitis', '12744', 'martynaitis@gmail.com', 'Aukstasis', 'Mid Data Scientist at Hyarchis', 3),
('Lina', 'Navickienė', '12745', 'l.navickiene@email.com', 'Aukštesnysis', 'Senior Data Analyst at DataTech', 4),
('Jonas', 'Jonaitis', '12746', 'j.jonaitis@email.com', 'Vidurinis', 'Junior Data Engineer at InfoCorp', 5),
('Eglė', 'Eglaitė', '12747', 'e.eglaitė@email.com', 'Aukštasis', 'Data Scientist at Analytica', 6),
('Rokas', 'Rokaitis', '12748', 'r.rokaitis@email.com', 'Aukštesnysis', 'Lead Data Scientist at QuantumData', 7),
('Mantas', 'Mantaitis', '12750', 'm.mantaitis@email.com', 'Aukštesnysis', 'Cloud Engineer at BigDataSolutions', 8),
('Darius', 'Dariūnas', '12751', 'd.dariunas@email.com', 'Aukštasis', 'Machine Learning Engineer at AIStartUp', 9),
('Greta', 'Gretaitė', '12752', 'g.gretaitė@email.com', 'Vidurinis', 'BI Developer at DataWorks', 10),
('Tomas', 'Tomaitis', '12753', 't.tomaitis@email.com', 'Aukštesnysis', 'Software Tester Manager at CloudTech', 11),
('Ieva', 'Ievaitė', '12754', 'i.ievaitė@email.com', 'Aukštasis', 'Chief Data Officer at InsightData', 12),
('Eglė', 'Juodeikienė', '12745', 'e.juodeikiene@email.com', 'Bakalauras', 'Quality Assurance Tester at TechSolutions', 13),
('Tadas', 'Viršila', '12746', 't.virsila@email.com', 'Magistras', 'Senior Software Developer at DevTech', 14),
('Rūta', 'Balčiūtė', '12747', 'r.balciute@email.com', 'Bakalauras', 'Software Engineer at Innovatech', 15),
('Gintas', 'Vaitkevičius', '12748', 'g.vaitkevicius@email.com', 'Daktaras', 'IT Consultant at InfoSolutions', 16),
('Lina', 'Kumetienė', '12749', 'l.kumetiene@email.com', 'Magistras', 'UI/UX Designer at Creativa', 17),
('Justas', 'Adomavičius', '12750', 'j.adomavicius@email.com', 'Bakalauras', 'Systems Analyst at SystemizeIT', 18),
('Aistė', 'Zarankaitė', '12751', 'a.zarankaite@email.com', 'Magistras', 'DevOps Engineer at CloudNet', 19),
('Paulius', 'Kedys', '12752', 'p.kedys@email.com', 'Bakalauras', 'Front-end Developer at WebArt', 20),
('Simonas', 'Petrauskas', '12753', 's.petrauskas@email.com', 'Magistras', 'Data Analyst at DataWise', 21),
('Viktorija', 'Markauskaitė', '12754', 'v.markauskaite@email.com', 'Bakalauras', 'Project Manager at ProjectPlus', 22),
('Karolis', 'Jovaiša', '12755', 'k.jovaisa@email.com', 'Magistras', 'Backend Developer at CodeCrafters', 23),
('Monika', 'Šeduvienė', '12756', 'm.seduviene@email.com', 'Daktaras', 'Database Administrator at DataBank', 24),
('Neringa', 'Vaitkutė', '12757', 'n.vaitkute@email.com', 'Bakalauras', 'Network Specialist at NetSecure', 25);

-- --------------------------------------------------------

--
-- Table structure for table `kursu_uzsakymai`
--

CREATE TABLE `kursu_uzsakymai` (
  `Sumoketa_suma` double NOT NULL,
  `Mokejimo_data` date NOT NULL,
  `Mokejimo_budas` varchar(100) NOT NULL,
  `Ar_pilnai_ivykdytas_mokejimas` tinyint(1) NOT NULL,
  `Uzsakymo_numeris` varchar(150) NOT NULL,
  `id_Kursu_uzsakymas` int(11) NOT NULL,
  `fk_Klientasid_Klientas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `kursu_uzsakymai`
--

INSERT INTO `kursu_uzsakymai` (`Sumoketa_suma`, `Mokejimo_data`, `Mokejimo_budas`, `Ar_pilnai_ivykdytas_mokejimas`, `Uzsakymo_numeris`, `id_Kursu_uzsakymas`, `fk_Klientasid_Klientas`) VALUES
(1800.22, '2023-03-16', 'Paysera', 1, '1475268', 147523647, 1),
(1756, '2023-11-22', 'Paysera', 1, '4007410', 477111289, 10),
(1850, '2019-03-21', 'Grynieji pinigai', 1, '4104120', 477530389, 7),
(1586, '2020-03-18', 'Paysera', 1, '4000560', 477754289, 9),
(1450, '2024-03-01', 'Paysera', 1, '4104720', 477860389, 8),
(1400, '2018-01-18', 'Paysera', 1, '4542539', 478413789, 4),
(1200, '2024-03-27', 'PayPal', 1, '4100839', 478741389, 5),
(1700, '2024-03-17', 'PayPal', 1, '4100000', 478745389, 6),
(3000, '2021-03-13', 'Grynieji pinigai', 1, '4561239', 478951269, 2),
(1500, '2020-05-08', 'PayPal', 1, '4564539', 478951789, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sertifikatai`
--

CREATE TABLE `sertifikatai` (
  `Isdavimo_data` date NOT NULL,
  `Islaikymo_pazymys` double NOT NULL,
  `Galiojimo_pasibaigimo_data` date NOT NULL,
  `id_Sertifikatai` int(11) NOT NULL,
  `fk_Klientasid_Klientas` int(11) NOT NULL,
  `fk_Kursasid_Kursas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `sertifikatai`
--

INSERT INTO `sertifikatai` (`Isdavimo_data`, `Islaikymo_pazymys`, `Galiojimo_pasibaigimo_data`, `id_Sertifikatai`, `fk_Klientasid_Klientas`, `fk_Kursasid_Kursas`) VALUES
('2017-03-01', 9, '2017-05-01', 1, 1, 1),
('2018-03-12', 8, '2018-06-22', 2, 8, 2),
('2018-02-11', 9, '2018-03-15', 3, 6, 5),
('2024-01-16', 7, '2024-03-02', 4, 9, 11),
('2017-03-15', 9, '2018-03-29', 5, 15, 2),
('2024-02-18', 10, '2024-03-29', 6, 9, 11),
('2024-01-28', 9, '2024-03-27', 7, 16, 11),
('2020-03-26', 9, '2024-03-14', 8, 17, 15),
('2024-03-10', 6, '2024-03-22', 10, 19, 18),
('2018-03-16', 10, '2021-03-24', 12, 30, 18),
('2023-12-18', 5, '2024-03-07', 13, 28, 7),
('2020-03-17', 9, '2024-03-20', 14, 26, 3);

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymo_prekes`
--

CREATE TABLE `uzsakymo_prekes` (
  `Kiekis` int(11) NOT NULL,
  `id_Uzsakymo_preke` int(11) NOT NULL,
  `fk_Kursasid_Kursas` int(11) NOT NULL,
  `fk_Kursu_uzsakymasid_Kursu_uzsakymas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `uzsakymo_prekes`
--

INSERT INTO `uzsakymo_prekes` (`Kiekis`, `id_Uzsakymo_preke`, `fk_Kursasid_Kursas`, `fk_Kursu_uzsakymasid_Kursu_uzsakymas`) VALUES
(1, 57, 6, 478745389),
(1, 12456, 15, 147523647),
(2, 14578, 10, 478951269),
(1, 17586, 4, 478951789),
(1, 33759, 10, 477860389),
(1, 37057, 5, 478741389),
(1, 37859, 3, 478413789),
(1, 41289, 3, 477111289),
(1, 41759, 7, 477754289),
(1, 41789, 4, 477530389);

-- --------------------------------------------------------

--
-- Table structure for table `uzsiemimai`
--

CREATE TABLE `uzsiemimai` (
  `Trukme` double NOT NULL,
  `Vietu_skaicius` int(11) NOT NULL,
  `Kurso_laikas` varchar(15) NOT NULL,
  `Uzsiemimo_budas` int(11) NOT NULL,
  `id_Uzsiemimas` int(11) NOT NULL,
  `fk_Kursasid_Kursas` int(11) NOT NULL,
  `fk_Kurso_ved_jasid_Kurso_ved_jas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `uzsiemimai`
--

INSERT INTO `uzsiemimai` (`Trukme`, `Vietu_skaicius`, `Kurso_laikas`, `Uzsiemimo_budas`, `id_Uzsiemimas`, `fk_Kursasid_Kursas`, `fk_Kurso_ved_jasid_Kurso_ved_jas`) VALUES
(2.5, 30, '18:00', 1, 1, 1, 1),
(1, 35, '14:00', 2, 2, 2, 2),
(1, 35, '14:00', 2, 3, 2, 3),
(1.5, 35, '15:00', 1, 4, 3, 4),
(1.5, 35, '15:00', 1, 5, 4, 5),
(1.5, 35, '15:00', 1, 6, 5, 5),
(1.5, 35, '15:00', 1, 7, 6, 7),
(1.5, 35, '18:00', 2, 8, 7, 8),
(1.5, 35, '18:00', 2, 9, 10, 8),
(1.5, 35, '18:00', 2, 10, 11, 10),
(1.5, 35, '18:00', 2, 12, 15, 11),
(2, 35, '18:00', 1, 13, 16, 12),
(2, 35, '18:00', 1, 14, 17, 12),
(2, 35, '18:00', 1, 15, 18, 13),
(2, 35, '18:00', 1, 16, 18, 14),
(2, 35, '18:00', 1, 17, 21, 15),
(2, 35, '20:30', 2, 19, 22, 15),
(2, 35, '20:30', 2, 20, 23, 16),
(2, 35, '20:30', 2, 21, 24, 16),
(2, 35, '20:30', 2, 22, 25, 17),
(2.5, 15, '20:30', 1, 23, 27, 18),
(2.5, 15, '20:30', 1, 24, 27, 19),
(2.5, 15, '20:30', 1, 25, 28, 20),
(2.5, 15, '20:30', 1, 26, 28, 21),
(2.5, 15, '20:30', 1, 27, 29, 22),
(2.5, 15, '20:30', 1, 28, 29, 23),
(3, 15, '20:30', 2, 29, 30, 23),
(3, 15, '20:30', 2, 30, 30, 24),
(3, 20, '17:30', 1, 31, 31, 25);

-- --------------------------------------------------------

--
-- Table structure for table `u_siemimo_vedimo_b_dai`
--

CREATE TABLE `u_siemimo_vedimo_b_dai` (
  `id_U_siemimo_vedimo_b_dai` int(11) NOT NULL,
  `name` char(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `u_siemimo_vedimo_b_dai`
--

INSERT INTO `u_siemimo_vedimo_b_dai` (`id_U_siemimo_vedimo_b_dai`, `name`) VALUES
(1, 'U_siemimas_gyvai'),
(2, 'U_siemimas_nuotoliniu_b_du');

-- --------------------------------------------------------

--
-- Table structure for table `yra_vedami`
--

CREATE TABLE `yra_vedami` (
  `fk_Kursasid_Kursas` int(11) NOT NULL,
  `fk_Kurso_ved_jasid_Kurso_ved_jas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `yra_vedami`
--

INSERT INTO `yra_vedami` (`fk_Kursasid_Kursas`, `fk_Kurso_ved_jasid_Kurso_ved_jas`) VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 5),
(6, 7),
(7, 8),
(10, 8),
(11, 10),
(15, 11),
(16, 12),
(17, 12),
(18, 13),
(18, 14),
(21, 15),
(22, 15),
(23, 16),
(24, 16),
(25, 17),
(27, 18),
(27, 19),
(28, 20),
(28, 21),
(29, 22),
(29, 23),
(30, 23),
(30, 24),
(31, 25);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atsiliepimai`
--
ALTER TABLE `atsiliepimai`
  ADD PRIMARY KEY (`id_Atsiliepimai`),
  ADD KEY `Yra_gaves` (`fk_Kursasid_Kursas`),
  ADD KEY `Kuria` (`fk_Klientasid_Klientas`);

--
-- Indexes for table `filialai`
--
ALTER TABLE `filialai`
  ADD PRIMARY KEY (`id_Filialas`);

--
-- Indexes for table `kalba`
--
ALTER TABLE `kalba`
  ADD PRIMARY KEY (`id_Kalba`);

--
-- Indexes for table `klientai`
--
ALTER TABLE `klientai`
  ADD PRIMARY KEY (`id_Klientas`,`Kliento_kodas`);

--
-- Indexes for table `kursai`
--
ALTER TABLE `kursai`
  ADD PRIMARY KEY (`id_Kursas`,`Kurso_kodas`),
  ADD KEY `Kokia_kalba_vedamas_kursas` (`Kokia_kalba_vedamas_kursas`),
  ADD KEY `Turi_parenges` (`fk_Filialasid_Filialas`);

--
-- Indexes for table `kurso_vedejai`
--
ALTER TABLE `kurso_vedejai`
  ADD PRIMARY KEY (`id_Kurso_vedejas`);

--
-- Indexes for table `kursu_uzsakymai`
--
ALTER TABLE `kursu_uzsakymai`
  ADD PRIMARY KEY (`id_Kursu_uzsakymas`),
  ADD KEY `Užsako` (`fk_Klientasid_Klientas`);

--
-- Indexes for table `sertifikatai`
--
ALTER TABLE `sertifikatai`
  ADD PRIMARY KEY (`id_Sertifikatai`),
  ADD KEY `Gavo` (`fk_Klientasid_Klientas`),
  ADD KEY `Išduoda` (`fk_Kursasid_Kursas`);

--
-- Indexes for table `uzsakymo_prekes`
--
ALTER TABLE `uzsakymo_prekes`
  ADD PRIMARY KEY (`id_Uzsakymo_preke`),
  ADD KEY `Itraukta i` (`fk_Kursasid_Kursas`),
  ADD KEY `Sudarytas is_ko` (`fk_Kursu_uzsakymasid_Kursu_uzsakymas`);

--
-- Indexes for table `uzsiemimai`
--
ALTER TABLE `uzsiemimai`
  ADD PRIMARY KEY (`id_Uzsiemimas`),
  ADD KEY `Uzsiemimo_budas` (`Uzsiemimo_budas`),
  ADD KEY `Turi` (`fk_Kursasid_Kursas`),
  ADD KEY `Veda` (`fk_Kurso_ved_jasid_Kurso_ved_jas`);

--
-- Indexes for table `u_siemimo_vedimo_b_dai`
--
ALTER TABLE `u_siemimo_vedimo_b_dai`
  ADD PRIMARY KEY (`id_U_siemimo_vedimo_b_dai`);

--
-- Indexes for table `yra_vedami`
--
ALTER TABLE `yra_vedami`
  ADD PRIMARY KEY (`fk_Kursasid_Kursas`,`fk_Kurso_ved_jasid_Kurso_ved_jas`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atsiliepimai`
--
ALTER TABLE `atsiliepimai`
  MODIFY `id_Atsiliepimai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `filialai`
--
ALTER TABLE `filialai`
  MODIFY `id_Filialas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `klientai`
--
ALTER TABLE `klientai`
  MODIFY `id_Klientas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `kursai`
--
ALTER TABLE `kursai`
  MODIFY `id_Kursas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `kurso_vedejai`
--
ALTER TABLE `kurso_vedejai`
  MODIFY `id_Kurso_vedejas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sertifikatai`
--
ALTER TABLE `sertifikatai`
  MODIFY `id_Sertifikatai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `uzsiemimai`
--
ALTER TABLE `uzsiemimai`
  MODIFY `id_Uzsiemimas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `atsiliepimai`
--
ALTER TABLE `atsiliepimai`
  ADD CONSTRAINT `Kuria` FOREIGN KEY (`fk_Klientasid_Klientas`) REFERENCES `klientai` (`id_Klientas`),
  ADD CONSTRAINT `Yra_gaves` FOREIGN KEY (`fk_Kursasid_Kursas`) REFERENCES `kursai` (`id_Kursas`);

--
-- Constraints for table `kursai`
--
ALTER TABLE `kursai`
  ADD CONSTRAINT `Turi_parenges` FOREIGN KEY (`fk_Filialasid_Filialas`) REFERENCES `filialai` (`id_Filialas`),
  ADD CONSTRAINT `kursai_ibfk_1` FOREIGN KEY (`Kokia_kalba_vedamas_kursas`) REFERENCES `kalba` (`id_Kalba`);

--
-- Constraints for table `kursu_uzsakymai`
--
ALTER TABLE `kursu_uzsakymai`
  ADD CONSTRAINT `Užsako` FOREIGN KEY (`fk_Klientasid_Klientas`) REFERENCES `klientai` (`id_Klientas`);

--
-- Constraints for table `sertifikatai`
--
ALTER TABLE `sertifikatai`
  ADD CONSTRAINT `Gavo` FOREIGN KEY (`fk_Klientasid_Klientas`) REFERENCES `klientai` (`id_Klientas`),
  ADD CONSTRAINT `Išduoda` FOREIGN KEY (`fk_Kursasid_Kursas`) REFERENCES `kursai` (`id_Kursas`);

--
-- Constraints for table `uzsakymo_prekes`
--
ALTER TABLE `uzsakymo_prekes`
  ADD CONSTRAINT `Itraukta i` FOREIGN KEY (`fk_Kursasid_Kursas`) REFERENCES `kursai` (`id_Kursas`),
  ADD CONSTRAINT `Sudarytas is_ko` FOREIGN KEY (`fk_Kursu_uzsakymasid_Kursu_uzsakymas`) REFERENCES `kursu_uzsakymai` (`id_Kursu_uzsakymas`);

--
-- Constraints for table `uzsiemimai`
--
ALTER TABLE `uzsiemimai`
  ADD CONSTRAINT `Turi` FOREIGN KEY (`fk_Kursasid_Kursas`) REFERENCES `kursai` (`id_Kursas`),
  ADD CONSTRAINT `Veda` FOREIGN KEY (`fk_Kurso_ved_jasid_Kurso_ved_jas`) REFERENCES `kurso_vedejai` (`id_Kurso_vedejas`),
  ADD CONSTRAINT `uzsiemimai_ibfk_1` FOREIGN KEY (`Uzsiemimo_budas`) REFERENCES `u_siemimo_vedimo_b_dai` (`id_U_siemimo_vedimo_b_dai`);

--
-- Constraints for table `yra_vedami`
--
ALTER TABLE `yra_vedami`
  ADD CONSTRAINT `Yra_vedamas` FOREIGN KEY (`fk_Kursasid_Kursas`) REFERENCES `kursai` (`id_Kursas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
