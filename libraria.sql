-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2025. Dec 04. 10:08
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `libraria`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adoalany`
--

CREATE TABLE `adoalany` (
  `adoalany_id` int(3) NOT NULL,
  `adoalany_megnev` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `adoalany`
--

INSERT INTO `adoalany` (`adoalany_id`, `adoalany_megnev`) VALUES
(1, 'Magánszeméy'),
(2, 'Cég');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalok`
--

CREATE TABLE `felhasznalok` (
  `felhasznalo_id` int(6) NOT NULL,
  `felhasznalo_nev` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `felhasznalo_email` varchar(100) NOT NULL,
  `felhasznalo_jelszo` varchar(255) NOT NULL,
  `admin` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `felhasznalok`
--

INSERT INTO `felhasznalok` (`felhasznalo_id`, `felhasznalo_nev`, `felhasznalo_email`, `felhasznalo_jelszo`, `admin`) VALUES
(1, 'Menyhárt Patrik', 'mpatrik@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 1),
(2, 'Kis Géza', 'geza@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(4, 'Menyhárt Patrik', 'mpatrik16@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0),
(9, 'Teszt Elek', 'tesztelek@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `fizetesi_modok`
--

CREATE TABLE `fizetesi_modok` (
  `fizmod_id` int(3) NOT NULL,
  `fizmod_megnev` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `fizetesi_modok`
--

INSERT INTO `fizetesi_modok` (`fizmod_id`, `fizmod_megnev`) VALUES
(1, 'Készpénz'),
(2, 'Bankkártya'),
(3, 'Átutalás');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `konyvek`
--

CREATE TABLE `konyvek` (
  `cikkszam` int(6) NOT NULL,
  `cim` varchar(200) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `szerzo` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `leiras` text CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `mufaj` int(6) NOT NULL,
  `kiado` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `kiadasi_ev` int(4) NOT NULL,
  `oldalszam` int(4) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `nyelv` int(6) NOT NULL,
  `ar` int(6) NOT NULL,
  `kep` varchar(100) NOT NULL,
  `sorozat` int(6) NOT NULL DEFAULT 0,
  `borito` varchar(50) NOT NULL,
  `suly` varchar(10) NOT NULL,
  `kiemelt` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `konyvek`
--

INSERT INTO `konyvek` (`cikkszam`, `cim`, `szerzo`, `leiras`, `mufaj`, `kiado`, `kiadasi_ev`, `oldalszam`, `isbn`, `nyelv`, `ar`, `kep`, `sorozat`, `borito`, `suly`, `kiemelt`) VALUES
(1, 'Stonehenge - Az idő katedrálisa', 'Ken Follett', 'Seft, a bányászfiú a Nagy Síkságon járja útját a nyári hőségben, hogy ott legyen a szertartáson, mely az új év kezdetét jelzi. Azért tart az ünnepre, hogy elcserélje kovaköveit egyéb hasznos dolgokra, és megkeresse Neent, a pásztorlányt, akit szeret.\r\nJoia, Neen húga elbűvölve figyeli a nyárközepi szertartást. Minden vágya, hogy ő is a papnők egyike lehessen, és részt vehessen különleges rituális táncaikon, amelyeket egy nagy, fából készült kör körül járnak el.\r\nÁm a dombokon és az erdők lombjai alatt már feszültség gyülemlik. Aszály pusztítja a földeket, egyre nő a bizalmatlanság a pásztorok, a földművesek és az erdőlakók között - mígnem egy kegyetlen tett nyílt háborúhoz vezet...\r\nJoia a békésebb jövő lehetőségét látja meg egy olyan, hatalmas kőkörökből álló szentélyben, amelyet a síkság megosztott népei együtt hoznak létre. Ennek az elképzelésnek a megvalósítása lassan élete céljává válik, melynek elérésében Seft nyújt neki segítő kezet.\r\nA Stonehenge nem csupán történelmi regény - magával ragadó történetmesélés arról, hogy elhivatottsággal, kitartással, az összefogás erejével hogyan születik meg egy új civilizáció.', 6, 'Gabo Könyvkiadó Kft.', 2025, 632, '9789635668748', 1, 7990, 'images/books/stonehenge_az_ido_katedralisa.jpg', 0, 'keménytábla', '740g', 1),
(2, 'Az auschwitzi tetováló', 'Heather Morris', 'Azt hihetnénk, hogy Auschwitz-Birkenauról már mindent tudunk. Túlélők és elkövetők egyaránt vallottak róla. Tudjuk, hogy a \"túlélésre kiválasztottak\" egy fogoly asztala előtt sorakoztak, aki egy számsort tetovált az alkarjukra. De vajon ki volt ez a fogoly?\r\nLale Sokolovnak hívták. Rab volt, akár a többiek, de munkája felruházta bizonyos kiváltságokkal, amelyeket a saját és mások túlélése érdekében használt fel. Szinte mindenütt járt a táborban, saját szemével látta a rablás és megsemmisítés teljes futószalagját. De a története mégsem a borzalmak leltárja. Itt, ebben a földi pokolban lett szerelmes, itt talált rá arra a nőre, akit mindig keresett: Gitára. Lale megfogadta, hogy túl fogja élni, akármi vár is rá, és mindent megtesz azért, hogy Gita is túlélje.', 6, 'Animus Kiadó', 2025, 347, '9789636145712', 1, 4360, 'images/books/az_auschwitzi_tetovalo.jpg', 0, 'puhatáblás', '318g', 0),
(3, 'Gyilkosság az Orient expresszen', 'Agatha Christie', 'A történet a szerzőtől megszokott módon rendkívül csavaros, a feszültség oldalról oldalra nő, a megfejtéstől pedig leesik az állunk. A kor olvasóinak azonban még egy szempontból különleges élményt jelenthetett a regény: a cselekménybe ugyanis Agatha Christie beépítette az évszázad bűnügyének nevezett, brutális gyermekgyilkossági esetet, mely \"a Lindbergh bébi elrablása\" néven híresült el világszerte.\r\n\r\nA híres Orient expressz a hóban vesztegel. Az egyik utas holtan fekszik a kabinjában, testét tizenkét késszúrás járta át. Az ajtó belülről zárva. A vonaton tizenkét utas maradt, a legkülönbözőbb társadalmi osztályból és nemzetiségből, ám mind egyre idegesebbek. Vagy van más is, ami összeköti őket?\r\nHercule Poirot, a legendás nyomozó csak a kis szürke agysejtjeire támaszkodhat a hóviharban rekedt luxusvonaton. Egyetlen dolog biztos: a gyilkos az utasok közt van, és Poirot-nak meg kell találnia, mielőtt újra lesújt...', 1, 'Helikon Kiadó', 2024, 300, '9789636205362', 1, 3799, 'images/books/gyilkossag_az_orient_expresszen.jpg', 1, 'puhatáblás', '254g', 1),
(4, 'Gyilkosság a csendes házban', 'Agatha Christie', 'Az ördög nem alszik, szól a mondás, s valóban: e kötet megmutatja, hogy a bűn nem ismer szabad- és ünnepnapokat - egy rodoszi nyaralás épp úgy tökéletes lehet a gyilkosságra, mint egy Guy Fawkes-napi tűzijáték, főleg, ha ott van a közelben Hercule Poirot. A könyv négy nyomozása során feltűnnek ismerős segítők (Japp főfelügyelő vagy Mr. Satterthwaite), ismerős motívumok (a bezárt szoba rejtélye vagy épp egy sokatmondó gongszó) és ismerős szereplőtípusok (szeszélyes arisztokraták, csábos kémnők és femme fatale-ok) a végeredmény azonban garantáltan tartogat meglepetéseket. A megoldásig vezető úton Poirot virágágyásokat vizsgálgat, cigarettacsikkeken mereng és gázkályhákról diskurál - hogy aztán kis szürke agysejtjei megoldássá rendezzék az apró részleteket. Agatha Christie ebben a kötetben három kisregény mellett egy novellával jelentkezik - utóbbiból Nyaraló gyilkosok címen később regényt is írt.\r\n\r\n\"Semmi kétség, a jó Isten tudja, mit csinál. De azért érthetetlen, miért engedte meg magának, hogy bizonyos emberi lényeket létrehozzon.\"', 1, 'Helikon Kiadó', 2025, 312, '9789636205881', 2, 3999, 'images/books/gyilkossag_a_csendes_hazban.jpg', 1, 'kartonált', '266g', 0),
(5, 'Vaják I. - The Witcher - Az utolsó kívánság', 'Andrzej Sapkowski', 'Geralt a vajákok közé tartozik: mágikus képességeinek köszönhetően, amelyeket hosszan tartó kiképzése és egy rejtélyes elixír csak még tovább csiszolt, zseniális és könyörtelen harcos hírében áll. Ugyanakkor nem hétköznapi gyilkos: célpontjai vérszomjas szörnyetegek és aljas fenevadak, amelyek mindenütt hatalmas pusztítást végeznek, és megtámadják az ártatlanokat.\r\nHiába tűnik azonban valami gonosznak vagy jónak, nem biztos, hogy valóban az - és minden mesében van egy csipetnyi igazság.\r\n\r\nAndrzej Sapkowski 1948-ban született Lengyelországban. Hazája egyik leghíresebb és legsikeresebb szerzőjének számít. A World Fantasy Életműdíjjal kitüntetett szerző Vaják-sorozatával nemzetközi sikert aratott, könyvei alapján képregények és számítógépes játékok is készültek, 2019-ben pedig a Netflix forgatott belőlük sorozatot Henry Cavill főszereplésével.', 4, 'Gabo Könyvkiadó Kft.', 2024, 346, '9789635667024', 1, 4265, 'images/books/vajak1.jpg', 2, 'puhatáblás', '388g', 1),
(6, 'Vaják II. - The Witcher - A végzet kardja', 'Andrzej Sapkowski', 'Az utolsó kívánság nagy sikerű folytatásában Geralt további novellákban küzd szörnyekkel, démonokkal és emberi gonoszsággal...\r\n\r\nGeralt a vajákok közé tartozik: mágikus képességeinek köszönhetően, amelyeket hosszan tartó kiképzése és egy rejtélyes elixír csak még tovább csiszolt, zseniális és könyörtelen harcos hírében áll. Ugyanakkor nem hétköznapi gyilkos: célpontjai vérszomjas szörnyetegek és aljas fenevadak, amelyek mindenütt hatalmas pusztítást végeznek, és megtámadják az ártatlanokat. A birodalmat járva azonban fokozatosan ráébred, hogy bár prédái egy része kétségtelenül elvetemült szörnyeteg, mások azonban bűn, ármány vagy egyszerű ostobaság áldozatai.\r\n\r\nAndrzej Sapkowski 1948-ban született Lengyelországban. Hazája egyik leghíresebb és legsikeresebb szerzőjének számít. A World Fantasy Életműdíjjal kitüntetett szerző Vaják-sorozatával nemzetközi sikert aratott, könyvei alapján képregények és számítógépes játékok is készültek, 2019-ben pedig a Netflix forgatott belőlük sorozatot Henry Cavill főszereplésével.', 4, 'Gabo Könyvkiadó Kft.', 2025, 422, '9786151100356', 3, 5215, 'images/books/vajak2.jpg', 2, 'puhatáblás', '460g', 0),
(7, 'Kincs a toszkán hó alatt - (Különleges kiadás)', 'Anne L. Green', 'KÜLÖNLEGES,ÉLDEKORÁLT KIADÁS\r\n\r\nEgy titkos napló, egy izgalmas kincsvadászat és egy zűrös szerelem\r\n\r\nMadison Crawford, a fiatal régész és műkincs-restaurátor élete váratlan fordulatot vesz, amikor egykori szerelme, Hans egy különös csomagot küld neki, amelyben egy II. világháborús napló lapul. A megsárgult oldalak egy náci tiszt vallomásait rejtik, felbecsülhetetlen értékű olasz műkincsek eltűnésének történetét. Madison nem tud ellenállni a kísértésnek, és egy baráti látogatás ürügyén Toszkánába utazik, hogy kiderítse, valóban igazat írt-e a katona a naplójában. Ám hamar világossá válik számára, nem ő az egyetlen, aki a kincs nyomában jár.\r\n\r\nÉrkezését követően hatalmas meglepetés éri, hiszen a ködbe vesző vidéken nemcsak rejtélyek várják, hanem egy mogorva borász is. Luca Allegrini még a rivális kincsvadászoknál is ijesztőbb, mégis ő jelentheti számára az egyetlen menedéket.\r\n\r\nAhogy a múlt árnyai életre kelnek, az egyre veszélyesebb nyomozás hevében még a szerelem lángja is fellobban, a mesés szépségű vidék titkairól pedig lassan leolvad a hó.\r\n\r\nAnne L. Green regényében a téli Toszkána romantikája a múlt rejtelmeivel fonódik össze egy felejthetetlen történetben.', 2, 'Álomgyár Kiadó', 2025, 351, '9789636831479', 1, 6299, 'images/books/kincs_a_toszkan_ho_alatt.jpg', 0, 'puhatáblás', '292g', 1),
(8, 'Összetört szívek karácsonya', 'Carrie Elks', 'Amikor Gabe Wintert egy nap szokatlan kéréssel keresi fel legjobb barátja, miszerint hadd lakjon nála Winterville-ben néhány hónapig összetört szívű kishúga, a férfi hezitálás nélkül igent mond.\r\nArra azonban nem számított, hogy Nicole ennyire vonzó lesz. Ennyire vicces. És hogy érzéseket ébreszt benne. Érzéseket, melyekről azt hitte, már rég eltemette magában nőcsábász énjével együtt, a színlelt közöny és lazaság álarca mögé.\r\nKisvártatva azonban már együtt töltik a késő estéket, filmnézéssel, összebújva a takaró alatt, némi pop-corn társaságában. És csak néhány centi választja el az ajkukat egymástól.\r\nTudja, hogy helytelen, de képtelen tenni ellene. Érzi, elkerülhetetlen, hogy beleszeressen az egyetlen nőbe, akibe nem lenne szabad.\r\nGabe szinte belefullad a kísértéssel folytatott harcba... de egy pillanatig sem bánja.\r\nA Winterville-sorozat harmadik része visszarepít minket a városba, ahol mindennap karácsony van.', 2, 'Pioneer Books Könyvkiadó Kft.', 2025, 336, '9786156978349', 2, 5669, 'images/books/osszetort_szivek_karacsonya.jpg', 0, 'kartonált', '350g', 0),
(9, 'These Rebel Waves - Lázadó hullámok - Folyami kalózok 1.', 'Sara Raasch', 'Egy lázadó. Egy kalóz. Egy herceg.\r\nHarcba kell szállniuk az országukért, a családjukért, saját magukért - különben olyan háborúval néznek szembe, ami elpusztíthatja a világot.\r\n\r\nAdeluna katona.\r\n\r\nÖt évvel ezelőtt segített felszabadítani Szent Loray mágiával teli szigetét Argrid országának zsarnoki uralma alól. Csakhogy nem volt könnyű visszailleszkednie a háború után. Amikor egy argridi küldött eltűnik Szent Loray új tanácsának béketárgyalásai során, az ország véres igazságszolgáltatást követel. Lu úgy sejti, veszedelmes erők munkálkodnak a háttérben.\r\n\r\nDevereux kalóz.\r\n\r\nA Szent Lorayen portyázó folyami kalózok egyikeként abból él, hogy a sziget mágikus növényeit árulja a feketepiacon. Miközben Argrid a kalózokat gyanúsítja küldöttük elrablásával, Vex célponttá válik. Gyakorlott hajósként beleegyezik, hogy segít Lunak előkeríteni az eltűnt argridit. De amire rábukkannak, sokkal veszedelmesebb lehet bármilyen háborúnál.\r\n\r\nBenat eretnek.\r\n\r\nBen, Argrid koronahercege titokban Szent Loray tiltott mágiájának megszállottja. Amikor apja, a király megbízza őt a meghökkentő feladattal, hogy oszlassa el Argrid mágia iránti félelmét, Ben kénytelen feltenni magának a kérdést, vajon megváltoztathatja-e egy herceg egy egész ország hitét, vagy valójában a saját máglyáját építi.\r\n\r\nLu, Vex és Ben vajon meddig hajlandó elmenni a béke érdekében?\r\nAz is kiderül, hogy miféle fából faragták őket...\r\n\r\nSzereted a Vörös pöttyös könyveket?\r\nVidd haza nyugodtan! Tetszeni fog.\r\n\r\nCsak 18 éven felülieknek!', 3, 'Könyvmolyképző Kiadó Kft.', 2021, 448, '9789633990766', 1, 3704, 'images/books/these_rebel_waves.jpg', 0, 'kartonált', '454g', 1),
(10, 'The Infinities', 'John Banville', 'One long, languid midsummer\'s day, the Godleys gather at the family home of Arden to attend their father\'s bedside. Adam, the elder child, and Petra, only nineteen, find that relations with their stepmother, Ursula, and their dying father, old Adam, are as strained as ever. Adam\'s relationship with his wife, Helen, seems too on the brink of collapse and Petra, fragile and deeply troubled, finds deepest relief in her own pain. The gods, those mischievous spirits, watch silently, flitting through this dark menage. Unable to resist intervening in the mortals\' lives, they spy, tease and seduce, all the while looking upon the antics of their playthings with a mixture of mild bafflement and occasional envy. Old Adam - husband, father and esteemed mathematician - has made his name grappling with the concept of the infinite. His own time on earth seems to be running out, and his mind runs to disquieting memories. Little does he realize, as he lies mute but alert in the Sky room, that the gods are capable of interposing themselves in the action, and even changing time itself when it pleases them.\r\nOverflowing with a bawdy humour, and a deep and refreshing clarity of insight, ,,The Infinities\" is at once a gloriously earthy romp and a delicately poised, infinitely wise look at the terrible and wonderful plight of being human. In electrifying prose, Banville captures the aching intensity, the magic and enchantment, of a single midsummer\'s day in Arden.', 3, 'Picador', 2009, 299, '9780330510882', 2, 3499, 'images/books/the_infinities.jpg', 0, 'kartonált', '322g', 0),
(11, 'Dune', 'Frank Herbert', 'Melange, or \'spice\', is the most valuable - and rarest - element in the universe; a drug that does everything from increasing a person\'s life-span to making intersteller travel possible. And it can only be found on a single planet: the inhospitable desert world Arrakis.\r\n\r\nWhoever controls Arrakis controls the spice. And whoever controls the spice controls the universe.\r\n\r\nWhen the Emperor transfers stewardship of Arrakis from the noble House Harkonnen to House Atreides, the Harkonnens fight back, murdering Duke Leto Atreides. Paul, his son, and Lady Jessica, his concubine, flee into the desert. On the point of death, they are rescued by a band for Fremen, the native people of Arrakis, who control Arrakis\' second great resource: the giant worms that burrow beneath the burning desert sands.\r\n\r\nIn order to avenge his father and retake Arrakis from the Harkonnens, Paul must earn the trust of the Fremen and lead a tiny army against the innumerable forces aligned against them.', 5, 'Hodder And Stoughton', 2023, 577, '9780340960196', 2, 6640, 'images/books/dune.jpg', 3, 'puhatáblás', '408g', 0),
(12, 'A Dűne messiása', 'Frank Herbert', 'Az emberi bolygókat egyesítő Impériumban Paul Muad-Dib, a jövőbe látó messiás uralkodik. Hithű harcosai, a vad fremenek szent dzsihádjukban feldúlták az univerzumot, és mindenhová elvitték a Mahdi szavait. Ám a háború és a vallási fanatizmus ádáz ellenségeket szült, akik mindenüket feláldoznák Muad-Dib bukásáért. Az Impérium régi hatalmai összefognak, hogy egy bonyolult összeesküvéssel törjenek az új Császár életére, aki maga sincs meggyőződve róla, hogy valóban egy jobb világot teremtett az emberiség számára.\r\n\r\nA Dűne messiásában Frank Herbert továbbviszi a magával ragadó Dűne történetét. Tizenkét évvel az első regény eseményei után a régi és az új világrend csap össze, a középpontban pedig olyan emberek állnak, akiknek minden erejükre szükségük van, hogy megbirkózzanak a rájuk váró sorssal. Herbert lenyűgöző gondolatisága és mély emberismerete emlékezetes karaktereken keresztül mutatja be, hogy sokszor a megváltó maga is lehet áldozat.', 5, 'Gabo Könyvkiadó Kft.', 2024, 344, '9789635667284', 1, 6640, 'images/books/dune2.jpg', 3, 'keménytábla', '504g', 1),
(13, 'We Hunt the Flame - Lángvadászok - (Különleges kiadás)', 'Hafsah Faizal', 'Amikor egy nő öl, emberéletek menekülnek meg a haláltól, és emberek halnak meg amiatt, hogy egy bizonyos férfi él.\r\n\r\nZafira, a Vadász, magát férfinak álcázva az elátkozott Arz erdőbe merészkedik, hogy élelmet szerezzen a népének. Nasir a Halál Hercege, aki legyilkolja azokat, akik elkövetik azt az ostobaságot, hogy szembeszállnak apjával, a szultánnal. Ha Zafiráról kiderülne, hogy lány, minden szerzeményét elutasítanák. Ha Nasir kimutatná az együttérzését, az apja a lehető legbrutálisabb büntetésnek tenné ki. Mind Zafira, mind Nasir Arawiya királyságának legendái - de egyikük sem akar az lenni.\r\n\r\nHáború készülődik, és az Arz napról napra egyre közelebb kúszik a Birodalomhoz, mindent árnyékba borítva maga körül. Amikor Zafira arra vállalkozik, hogy felkutasson egy elveszett amulettet, ami visszaállíthatja a mágiát balsorsú világában, és megállíthatja az Arzot, a szultán Nasirt küldi ellene: neki kell megszereznie az amulettet, és megölnie a Vadászt. Azonban az útjuk során feléled egy ősi gonosz is, és a küldetésük vágyott jutalma nagyobb veszélyt jelenthet rájuk, mint azt el tudnák képzelni.\r\n\r\nHafsah Faizal kétrészes sorozatának első kötete, amely az ókori Arábia által inspirált, gazdag részletességgel ábrázolt világban játszódik, magával ragadó regény felfedezésekről és a félelmek legyőzéséről.', 3, 'Ventus Libro Kiadó', 2024, 539, '9786156407191', 1, 4549, 'images/books/we_hunt_the_flame.jpg', 0, 'puhatáblás', '600g', 1),
(14, 'Jane Eyre', 'Charlotte Bronte', 'Jane Eyre, a lowoodi árva tébolyult szerelmének története ez a méltán népszerű, kortalan regény. Jane a bentlakásos intézetben megtanulja, hogy egy vagyontalan fiatal lány senkire sem számíthat, egyedül kell boldogulnia a világban. Amikor Mr. Rochester nevelőnőként alkalmazza gyámleánya, Adele mellett, szabadabb világ tárul ki előtte, és lassan elhiszi, hogy rátalálhat a boldogság. Ám Thornfield Hall falai sötét titkot rejtenek, és a legszebb álom is rémálommá válhat... Jane-nek döntenie kell, hogy összetört szívvel mindent maga mögött hagyva kezdjen-e új életet, vagy ismét a nehezebb utat válassza. A bátor és tiszta lelkű Jane története nem csak a szerelem, de a XIX. századi Anglia világának sötét és csillogó oldalát is képes úgy megmutatni, hogy Charlotte Brontë regénye máig a világirodalom egyik legfontosabb és legszívettépőbb romantikus műve legyen.', 2, 'Menő Könyvek', 2024, 607, '9789634039495', 1, 5690, 'images/books/jane_eyre.jpg', 0, 'keménytábla', '592g', 1),
(30, 'Vaják III. - The Witcher - Tündevér', 'Andrzej Sapkowski', 'Több mint egy évszázada élnek viszonylagos békében az emberek, törpök és tündék. Az idők azonban változnak, és ahogy az indulatok egyre magasabbra csapnak, ismét vér áztatja a földet.\r\nRíviai Geralt, a vaják, egy megjövendölt gyermek születésére vár, akinek hatalma az egész világot képes lesz megváltoztatni - de hogy jobbá vagy rosszabbá teszi, még nem tudni.\r\nMiközben háború árnyéka borul a világra, a gyermeket különleges hatalma miatt többen is üldözőbe veszik, és Geraltra hárul a feladat, hogy megvédje - a vaják pedig soha nem adja fel.\r\n\r\nAndrzej Sapkowski 1948-ban született Lengyelországban. Hazája egyik leghíresebb és legsikeresebb szerzőjének számít. A World Fantasy Életműdíjjal kitüntetett szerző Vaják-sorozatával nemzetközi sikert aratott, könyvei alapján képregények és számítógépes játékok is készültek, 2019-ben pedig a Netflix forgatott belőlük sorozatot Henry Cavill főszereplésével. A Tündevérrel egy ötkötetes saga veszi kezdetét a Vaják-sorozaton belül.', 4, 'Gabo Könyvkiadó kft.', 2025, 371, '9789635668779', 1, 4265, 'images/books/vajak_3.jpg', 2, 'puhatáblás', '404g', 0),
(31, 'Solaris', 'Stanislaw Lem', '\"Ti akartok az óceánnal szót érteni, mikor egymást sem értitek?\"\r\n\r\nStanisław Lem születésének századik évfordulójára jelentetjük meg minden idők egyik legsikeresebb, legvarázslatosabb, legnagyobb hatású sci-fijét, amelyből már három film is készült.\r\nKris Kelvin pszichológus megérkezik egy távoli égitest, a Solaris felszíne fölött lebegő űrállomásra. A bolygót plazmaóceán borítja, amely különös intelligencia jeleit mutatja, de az emberek mindeddig sikertelenül próbáltak kapcsolatot teremteni vele.\r\nA pszichológus lassan felismeri a bolygó működésének titkát - vagy legalábbis megsejti, hogy milyen veszély leselkedik az emberekre: a plazmaóceán az őrületbe hajszolja a kutatókat: személyiségük legbelső, eltitkolt démonait szabadítja rájuk.', 5, 'Helikon Kiadó', 2025, 268, '9789636207120', 1, 4749, 'images/books/solaris.jpg', 0, 'kartonált', '311g', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `konyv_mufajok`
--

CREATE TABLE `konyv_mufajok` (
  `mufaj_id` int(6) NOT NULL,
  `mufaj_megnevezes` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `mufaj_ikon` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `konyv_mufajok`
--

INSERT INTO `konyv_mufajok` (`mufaj_id`, `mufaj_megnevezes`, `mufaj_ikon`) VALUES
(1, 'krimi', '<i class=\"fa-solid fa-user-secret\"></i>'),
(2, 'romantikus', '<i class=\"fa-solid fa-heart\"></i>'),
(3, 'akció, kaland', '<i class=\"fa-solid fa-bomb\"></i>'),
(4, 'fantasy', '<i class=\"fa-solid fa-dragon\"></i>'),
(5, 'sci-fi', '<i class=\"fa-solid fa-atom\"></i>'),
(6, 'történelmi', '<i class=\"fa-solid fa-landmark\"></i>');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `konyv_sorozatok`
--

CREATE TABLE `konyv_sorozatok` (
  `sorozat_id` int(6) NOT NULL,
  `sorozat_megnevezes` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `konyv_sorozatok`
--

INSERT INTO `konyv_sorozatok` (`sorozat_id`, `sorozat_megnevezes`) VALUES
(1, 'poirot'),
(2, 'the witcher'),
(3, 'dűne');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendeles_adatok`
--

CREATE TABLE `megrendeles_adatok` (
  `megrendeles_id` int(8) NOT NULL,
  `megrendelo_id` int(6) NOT NULL,
  `szallitasi_mod` int(3) NOT NULL,
  `fizetesi_mod` int(11) NOT NULL,
  `adoalany` int(11) NOT NULL,
  `idopont` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `megrendeles_adatok`
--

INSERT INTO `megrendeles_adatok` (`megrendeles_id`, `megrendelo_id`, `szallitasi_mod`, `fizetesi_mod`, `adoalany`, `idopont`) VALUES
(1, 1, 1, 2, 1, '2025-11-13 16:06:08'),
(2, 2, 3, 2, 1, '2025-11-18 13:10:50'),
(3, 3, 0, 0, 0, '2025-11-18 13:42:22'),
(4, 4, 1, 1, 2, '2025-11-18 13:52:36'),
(5, 1, 2, 2, 1, '2025-11-18 13:56:20'),
(6, 1, 1, 1, 1, '2025-11-18 13:58:06'),
(7, 1, 1, 1, 1, '2025-11-19 11:51:16'),
(8, 1, 1, 2, 2, '2025-11-19 11:54:27'),
(9, 5, 2, 2, 1, '2025-11-19 11:57:56'),
(10, 6, 1, 1, 1, '2025-11-19 12:00:50'),
(11, 7, 1, 1, 1, '2025-11-19 12:03:59'),
(12, 1, 2, 2, 1, '2025-11-19 12:30:31'),
(13, 1, 3, 2, 1, '2025-11-27 16:32:02'),
(14, 8, 3, 2, 1, '2025-12-04 09:52:02');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendeles_tetelek`
--

CREATE TABLE `megrendeles_tetelek` (
  `tetel_id` int(8) NOT NULL,
  `cikkszam` int(8) NOT NULL,
  `ar` int(9) NOT NULL,
  `quantity` int(9) NOT NULL,
  `megrendeles_id` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `megrendeles_tetelek`
--

INSERT INTO `megrendeles_tetelek` (`tetel_id`, `cikkszam`, `ar`, `quantity`, `megrendeles_id`) VALUES
(6, 5, 4265, 1, 1),
(7, 9, 3704, 2, 1),
(8, 11, 6640, 1, 2),
(9, 12, 6640, 1, 2),
(10, 14, 5690, 1, 2),
(11, 5, 4265, 1, 5),
(12, 4, 3999, 1, 5),
(13, 2, 4360, 2, 5),
(14, 9, 3704, 1, 6),
(15, 7, 6299, 1, 6),
(16, 9, 3704, 1, 8),
(17, 7, 6299, 1, 8),
(18, 3, 3799, 1, 9),
(19, 5, 4265, 1, 9),
(20, 1, 7990, 1, 11),
(21, 5, 4265, 2, 12),
(22, 6, 5215, 1, 12),
(23, 31, 4749, 1, 13),
(24, 30, 4265, 2, 13),
(25, 1, 7990, 2, 14),
(26, 9, 3704, 1, 14);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `megrendelok`
--

CREATE TABLE `megrendelok` (
  `megrendelo_id` int(6) NOT NULL,
  `nev` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `jelszo` varchar(32) NOT NULL,
  `mobil` varchar(20) NOT NULL,
  `szall_cim` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `adoszam` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `megrendelok`
--

INSERT INTO `megrendelok` (`megrendelo_id`, `nev`, `email`, `jelszo`, `mobil`, `szall_cim`, `adoszam`) VALUES
(1, 'Menyhárt Patrik', 'mpatrik@gmail.com', '005f47cddf568dacb8d03e20ba682cf9', '06306898818', 'Deszk', '2347482911'),
(2, 'Kis Géza', 'kgeza@gmail.com', '005f47cddf568dacb8d03e20ba682cf9', '12372375', 'Szolnok, Magyar u. 2', '31937123'),
(8, 'Teszt Elek', 'tesztelek@gmail.com', '005f47cddf568dacb8d03e20ba682cf9', '06303465127', 'Szeged, Teszt u. 123', '123456789');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `nyelvek`
--

CREATE TABLE `nyelvek` (
  `nyelv_id` int(6) NOT NULL,
  `nyelv_megnevezes` varchar(20) NOT NULL,
  `nyelv_ikon` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `nyelvek`
--

INSERT INTO `nyelvek` (`nyelv_id`, `nyelv_megnevezes`, `nyelv_ikon`) VALUES
(1, 'magyar', 'images/language_icons/hungary.png'),
(2, 'angol', 'images/language_icons/united_kingdom.png'),
(3, 'lengyel', 'images/language_icons/poland.png');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szallitasi_modok`
--

CREATE TABLE `szallitasi_modok` (
  `szallmod_id` int(3) NOT NULL,
  `szallmod_megnev` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- A tábla adatainak kiíratása `szallitasi_modok`
--

INSERT INTO `szallitasi_modok` (`szallmod_id`, `szallmod_megnev`) VALUES
(1, 'Személyes átvétel'),
(2, 'Futár'),
(3, 'Csomagpont');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `adoalany`
--
ALTER TABLE `adoalany`
  ADD PRIMARY KEY (`adoalany_id`);

--
-- A tábla indexei `felhasznalok`
--
ALTER TABLE `felhasznalok`
  ADD PRIMARY KEY (`felhasznalo_id`);

--
-- A tábla indexei `fizetesi_modok`
--
ALTER TABLE `fizetesi_modok`
  ADD PRIMARY KEY (`fizmod_id`);

--
-- A tábla indexei `konyvek`
--
ALTER TABLE `konyvek`
  ADD PRIMARY KEY (`cikkszam`);

--
-- A tábla indexei `konyv_mufajok`
--
ALTER TABLE `konyv_mufajok`
  ADD PRIMARY KEY (`mufaj_id`);

--
-- A tábla indexei `konyv_sorozatok`
--
ALTER TABLE `konyv_sorozatok`
  ADD PRIMARY KEY (`sorozat_id`);

--
-- A tábla indexei `megrendeles_adatok`
--
ALTER TABLE `megrendeles_adatok`
  ADD PRIMARY KEY (`megrendeles_id`);

--
-- A tábla indexei `megrendeles_tetelek`
--
ALTER TABLE `megrendeles_tetelek`
  ADD PRIMARY KEY (`tetel_id`);

--
-- A tábla indexei `megrendelok`
--
ALTER TABLE `megrendelok`
  ADD PRIMARY KEY (`megrendelo_id`);

--
-- A tábla indexei `nyelvek`
--
ALTER TABLE `nyelvek`
  ADD PRIMARY KEY (`nyelv_id`);

--
-- A tábla indexei `szallitasi_modok`
--
ALTER TABLE `szallitasi_modok`
  ADD PRIMARY KEY (`szallmod_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `adoalany`
--
ALTER TABLE `adoalany`
  MODIFY `adoalany_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `felhasznalok`
--
ALTER TABLE `felhasznalok`
  MODIFY `felhasznalo_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `fizetesi_modok`
--
ALTER TABLE `fizetesi_modok`
  MODIFY `fizmod_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `konyvek`
--
ALTER TABLE `konyvek`
  MODIFY `cikkszam` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT a táblához `konyv_mufajok`
--
ALTER TABLE `konyv_mufajok`
  MODIFY `mufaj_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `konyv_sorozatok`
--
ALTER TABLE `konyv_sorozatok`
  MODIFY `sorozat_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `megrendeles_adatok`
--
ALTER TABLE `megrendeles_adatok`
  MODIFY `megrendeles_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT a táblához `megrendeles_tetelek`
--
ALTER TABLE `megrendeles_tetelek`
  MODIFY `tetel_id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT a táblához `megrendelok`
--
ALTER TABLE `megrendelok`
  MODIFY `megrendelo_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT a táblához `nyelvek`
--
ALTER TABLE `nyelvek`
  MODIFY `nyelv_id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `szallitasi_modok`
--
ALTER TABLE `szallitasi_modok`
  MODIFY `szallmod_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
