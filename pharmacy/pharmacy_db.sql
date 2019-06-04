-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 25, 2019 at 04:51 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacy_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `quantity` int(11) NOT NULL,
  `checkedout` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `product_id`, `user_email`, `quantity`, `checkedout`) VALUES
(50, 9, 'rutali@gmail.com', 1, 0),
(51, 4, 'simrana@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL,
  `category_status` enum('0','1') NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_status`) VALUES
(1, 'Flue & Cold', '1'),
(2, 'Vitamins & Supplements', '1');

-- --------------------------------------------------------

--
-- Table structure for table `deal`
--

DROP TABLE IF EXISTS `deal`;
CREATE TABLE IF NOT EXISTS `deal` (
  `deal_name` varchar(50) NOT NULL,
  `deal_cost` int(15) NOT NULL,
  `deal_count` int(5) DEFAULT NULL,
  PRIMARY KEY (`deal_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deal`
--

INSERT INTO `deal` (`deal_name`, `deal_cost`, `deal_count`) VALUES
('', 1, NULL),
('bigsaving', 5, 14),
('smartdeal', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`email`, `password`, `full_name`, `phone_number`) VALUES
('rutali@gmail.com', '$2y$10$nE3VGZM6bT3wSCsRM3kApO.zEAr6zokEJO45ujsjSBRXuV2g72ZqW', 'RutaliBandivadekar', '1452148875'),
('rutalib@gmail.com', 'abcd123', 'Rutali', '9898989898'),
('sagar@gmail.com', 'Sagarabcd@123', 'Sagar', '8977584521'),
('simran@gmail.com', 'Simranarora@12', 'SimranArora', '9875845896'),
('simrana@gmail.com', '$2y$10$sipQ/pXv5Gp7h4ypEWowfuY58w8oNt3cCUnQ1gG.6xji.JJ6BXllO', 'Simran Arora', '5498658754'),
('yash@gmail.com', 'Yashabcd@12', 'YashModi', '4521578954');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `address` varchar(5000) NOT NULL,
  `state_country` varchar(50) NOT NULL,
  `postalcode` varchar(6) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(10) NOT NULL,
  `deal_code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `order_id` int(5) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(50) CHARACTER SET utf8 NOT NULL,
  `total` varchar(10) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `deal_code` (`deal_code`),
  KEY `customer_id` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`fname`, `lname`, `address`, `state_country`, `postalcode`, `email`, `phone_number`, `deal_code`, `order_id`, `customer_id`, `total`) VALUES
('Rutali', 'Bandivadekar', '7575 Frankford Road', 'Texas', '75252', 'rutalib@gmail.com', '8787878589', 'smartdeal', 14, 'rutalib@gmail.com', '$58.00'),
('Simran', 'Arora', '7575 Frankford Road', 'Texas', '75252', 'simran@gmail.com', '7878744555', 'smartdeal', 24, 'rutalib@gmail.com', '$58.00'),
('Rutali', 'Bandivadekar', '7575 Frankford Road', 'Texas', '75252', 'rutali@gmail.com', '5896547854', 'smartdeal', 25, 'rutali@gmail.com', '$26.00'),
('Yash', 'Modi', 'Cambell', 'Texas', '752452', 'yash@gmail.com', '8756896541', 'bigsaving', 28, 'rutali@gmail.com', '$2.75.00'),
('Simran', 'Arora', '7575 Frankford Road', 'United States', '752521', 'simran@gmail.com', '8765986587', 'smartdeal', 34, 'rutali@gmail.com', '$11.99.00'),
('Sagar', 'Kawthankar', 'Mccallum', 'United States', '578874', 'sagar@gmail.com', '8989875645', '', 47, 'rutali@gmail.com', '$32.99.00'),
('Rutali', 'Bandivadekar', 'University of Texas at Dallas', 'Texas', '752520', 'rutali@gmail.com', '9898876598', '', 48, 'rutali@gmail.com', '$34.75.00'),
('Yash', 'Modi', 'Campbell', 'United States', '985895', 'yash@gmail.com', '8765549854', 'smartdeal', 49, 'rutali@gmail.com', '$12.00');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_cost` float NOT NULL,
  `product_description` varchar(512) NOT NULL,
  `product_image` varchar(10000) NOT NULL,
  `product_count` int(10) NOT NULL,
  `product_characteristic` varchar(8096) NOT NULL,
  `product_category` int(11) NOT NULL,
  `product_status` enum('0','1') NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `product_category` (`product_category`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_cost`, `product_description`, `product_image`, `product_count`, `product_characteristic`, `product_category`, `product_status`) VALUES
(1, 'Crocin', 10, 'Crocin is a carotenoid chemical compound that is found in the flowers crocus and gardenia. Crocin is the chemical primarily responsible for the color of saffron. Chemically, crocin is the diester formed from the disaccharide gentiobiose and the dicarboxylic acid crocetin.', 'https://5.imimg.com/data5/VW/SR/MY-17376909/crocin-tablet-500x500.jpg', 300, '', 1, '1'),
(2, 'Febrex', 12.5, 'Febrex 500 MG Tablet is used to temporarily relieve fever and mild to moderate pain such as muscle ache, headache, toothache, arthritis, and backache. This medicine should be used with caution in patients with liver diseases due to the increased risk of severe adverse effects.', 'http://www.internationaldrugmart.com/drug-images/big/otc_febrex_plus_indoco_pharma.jpg', 100, '', 1, '1'),
(3, 'Advil', 11.75, 'Make pain a distant memory. Advil® is the #1 selling pain reliever,* providing safe, effective pain relief for over 30 years. So whether you have a headache, muscle aches, backaches, menstrual pain, minor arthritis and other joint pain, or aches and pains from the common cold, nothing\'s stronger or longer lasting. The medicine in Advil® is #1 doctor recommended for pain relief.', 'https://images-na.ssl-images-amazon.com/images/I/81hknMLHlAL._SY355_.jpg', 100, '', 1, '1'),
(4, 'Tylenol', 13, 'An estimated 50 million Americans use acetaminophen each week to treat conditions such as pain, fever and aches and pains associated with cold and flu symptoms. To help encourage the safe use of acetaminophen, the makers of TYLENOL® have lowered the maximum daily dose for single-ingredient Extra Strength TYLENOL® (acetaminophen) products sold in the U.S. from 8 pills per day (4,000 mg) to 6 pills per day (3,000 mg). ', 'https://images-na.ssl-images-amazon.com/images/I/81kgWgArqML._SL1500_.jpg', 8, '', 1, '1'),
(5, 'Sudafed', 11.08, 'Reach for products from the makers of SUDAFED® to rescue you from your sinus symptoms and sinus related problems, like allergies and colds. You can find our products either behind the counter, in the cold and allergy aisle, or online.', 'https://pics.drugstore.com/prodimg/563691/900.jpg', 9, '', 1, '1'),
(6, 'Benadryl', 14.12, 'Benadryl Dry Cough & Nasal Congestion is used to relieve the symptoms of cold and cough such as runny nose, nasal congestion and dry cough. Dextromethorphan is a cough suppressant that acts on the cough centre in the brain to suppress a dry cough.', 'https://4.imimg.com/data4/EQ/DM/MY-33400885/cough-medicine-250x250.jpg', 7, '', 1, '1'),
(7, 'Mucinex DM', 14, 'Mucinex DM is a cough medicine that contains dextromethorphan, a cough suppressant, and guaifenesin, an expectorant. This combination of two drugs helps loosen mucus and phlegm, and thin out bronchial secretions, making coughs more productive.', 'https://cdn.shopify.com/s/files/1/0049/2725/8742/products/huemtxst4gf7ppgzyujn_800x.jpg?v=1533341585', 6, '', 1, '1'),
(8, 'Theraflu', 13.99, 'Theraflu Nighttime Severe Cold And Cough (Acetaminophen / Diphenhydramine / Phenylephrine) is good for treating multiple cold and flu symptoms, but it won\'t relieve coughing. ', 'https://pics.drugstore.com/prodimg/601378/900.jpg', 8, '', 1, '1'),
(9, 'Omega 3', 18, 'Omega-3 fish oil contains both docosahexaenoic acid (DHA) and eicosapentaenoic acid (EPA). Omega-3 fatty acids are essential nutrients that are important in preventing and managing heart disease. ', 'https://res.cloudinary.com/nordic-naturals/image/upload/c_fit,g_center,h_970,w_970,f_auto,q_auto/ecommerce/retail/Omega-3_soft-gel-liquid.jpg', 8, '', 2, '1'),
(10, 'Vitamin', 25.5, 'The health benefits of vitamins include their ability to prevent and treat various diseases including heart problems, high cholesterol levels, and eye and skin disorders. Most vitamins facilitate many of the body’s mechanisms and perform functions which cannot be performed by any other nutrients.\r\n', 'https://www.costco.com/wcsstore/CostcoUSBCCatalogAssetStore/category-tiles/adult-multi-letter-vitamins.jpg', 8, '', 2, '1'),
(11, 'Whey Protein', 34.99, 'Whey is the liquid remaining after milk has been curdled and strained. It is a byproduct of the manufacture of cheese or casein and has several commercial uses. Sweet whey is a byproduct produced during the manufacture of rennet types of hard cheese, like Cheddar or Swiss cheese.', 'https://i5.walmartimages.com/asr/59f9e9cb-0bfe-46af-ae8c-eb02644ab1b7_1.2677468ad0026f4b9763ea1a9714ee2d.jpeg', 9, '', 2, '1'),
(12, 'BCAA', 21.75, 'Branched-chain amino acids (BCAAs) are a group of three essential amino acids: leucine, isoleucine and valine. BCAA supplements are commonly taken in order to boost muscle growth and enhance exercise performance. They may also help with weight loss and reduce fatigue after exercise.', 'https://images-na.ssl-images-amazon.com/images/I/51XGoUk3VfL._SY355_.jpg', 9, '', 2, '1'),
(13, 'Creatine', 11.2, 'Creatine is an organic compound with the nominal formula CNCH₂CO₂H. This species exists in various modifications in solution. Creatine is found in vertebrates where it facilitates recycling of adenosine triphosphate, the energy currency of the cell, primarily in muscle and brain tissue.', 'https://www.gnc.com/on/demandware.static/-/Sites-master-catalog-gnc/default/dw07bea2c2/hi-res/350140_1.jpg', 9, '', 2, '1'),
(14, 'Glutamine', 9.75, 'Glutamine is an α-amino acid that is used in the biosynthesis of proteins. Its side chain is similar to that of glutamic acid, except the carboxylic acid group is replaced by an amide. It is classified as a charge-neutral, polar amino acid. ', 'https://images-na.ssl-images-amazon.com/images/I/81XL9drFZsL._SY355_.jpg', 10, '', 2, '1'),
(15, 'Minerals', 7.75, 'A mineral is, broadly speaking, a solid chemical compound that occurs naturally in pure form. A rock may consist of a single mineral, or may be an aggregate of two or more different minerals, spacially segregated into distinct phases.', 'https://images-na.ssl-images-amazon.com/images/I/71-s8qSGa5L._SY355_.jpg', 9, '', 2, '1');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`user_email`) REFERENCES `login` (`email`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `login` (`email`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`deal_code`) REFERENCES `deal` (`deal_name`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`product_category`) REFERENCES `category` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
