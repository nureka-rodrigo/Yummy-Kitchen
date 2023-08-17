-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2023 at 11:59 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_recipe`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `Category_Id` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_Id`, `Name`) VALUES
(1, 'Vege'),
(2, 'Non-Veg'),
(3, 'Sea-Food');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `Feedback_Id` int(11) NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Subject` varchar(128) NOT NULL,
  `Message` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `Recipe_Id` int(11) NOT NULL,
  `Category_Id` int(11) NOT NULL,
  `Title` varchar(64) NOT NULL,
  `Description` varchar(1024) NOT NULL,
  `Serving_Size` int(11) NOT NULL,
  `Prep_Time` int(11) NOT NULL,
  `Ingredients` varchar(1024) NOT NULL,
  `Instructions` varchar(2048) NOT NULL,
  `Image` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`Recipe_Id`, `Category_Id`, `Title`, `Description`, `Serving_Size`, `Prep_Time`, `Ingredients`, `Instructions`, `Image`) VALUES
(6, 1, 'Ratatouille', 'This traditional vegetable stew originated in Nice. This version lightly caramelizes the onions and peppers before adding them to the rest of the dish, giving it a fantastic complex flavor without much additional effort.', 12, 95, '1 pound eggplant, cut into cubes,\r\n2 1/2 teaspoons salt, divided,\r\n2 1/2 pounds tomatoes, peeled,\r\n3 cloves garlic, crushed and chopped,\r\n1/2 teaspoon freshly ground black pepper,\r\n1/4 cup fresh basil, loosely packed, chopped,\r\n3/4 cup flat-leaf parsley, loosely packed, chopped,\r\n1 1/2 pounds white onions, thinly sliced,\r\n3 bell peppers, red or yellow, cored, seeded, and chopped,\r\n2 tablespoons olive oil, good-quality extra-virgin, plus additional for serving,\r\n2 pounds zucchini, cut lengthwise and then into 1/2-inch slices,\r\n2 pounds yellow squash, cut lengthwise and then into 1/2-inch slices,\r\n1/3 cup dry white wine', 'Gather the ingredients. Place a single layer of paper towels on 2 large plates. Put the cubed eggplant onto the plates and sprinkle with 1 3/4 teaspoons of the salt. Allow the eggplant to sit for 20 minutes; this process is known as degorgement, in which the salt extracts liquid from the eggplant, and the liquid is then absorbed by the paper, making the dish less soggy. In a large saucepan, gently cook the tomatoes, garlic, black pepper, basil, and parsley, uncovered, over medium heat. Do not boil the vegetables, as this will turn them into a soggy mess; cooked slowly, each of the vegetables will remain distinct. In a large skillet, sautÃ© the onions and bell peppers in a small amount of olive oil over medium-high heat for 10 minutes, stirring occasionally, until the vegetables are lightly browned. Remove the skillet from the heat, and transfer the browned vegetables to the tomato mixture. Pat the eggplant dry with a fresh paper towel and add it along with the zucchini and yellow squash to the tomato mixture. Cover the pot and cook the stew over low-medium heat for 45 minutes, until the vegetables are tender. Add the white wine and remaining 3/4 teaspoon salt and cook for an additional 5 minutes. Enjoy.', 'ratatouille-recipe-1375502-11-5b3fd43246e0fb003716c8c3.webp'),
(7, 1, 'Roquefort and Carmelized Onion Tart', 'This classic Roquefort and caramelized onion tart recipe is layered with complex flavors: salty, piquant cheese, mellow, sweet onions, and rich eggs and cream. Baked into a  pastry shell, the combination is nothing less than irresistible. ', 8, 110, '1 pastry dough,\r\n3 medium onions, thinly sliced,\r\n2 tablespoons unsalted butter,\r\n1 teaspoon granulated sugar,\r\n2/3 cup Roquefort cheese, crumbled,\r\n4 large eggs,\r\n1 cup (0.24 l) half-and-half,\r\n1/2 teaspoon crushed dried thyme,\r\n1/4 teaspoon salt,\r\n1/4 teaspoon freshly ground black pepper', 'Preheat the oven to 375 F.\r\n\r\nRoll out and line the pastry into a deep-dish pie pan. Line the pastry with parchment paper, fill it with dry beans and then bake it for 15 minutes. Remove the pan from the oven and allow it to cool for 10 minutes. Remove and place the beans to one side to store and use again once cooled. \r\n\r\nIn a large skillet set over low heat, melt the butter and cook the onions in it for 20 minutes, until they\'re tender but not browned and taking care to make sure they do not burn. Turn the heat up to medium-high and sprinkle the sugar over the onions. SautÃ© the onions and sugar until the mixture turns golden brown. Remove the onions from the pan and leave to cool slightly. \r\n\r\nLayer the caramelized onions and crumbled Roquefort cheese onto the bottom layer of the pastry. Beat together the eggs, half-and-half, thyme, salt, and pepper (be careful not to use too much dried herb or it will overpower the dish).\r\n\r\nPour the egg mixture over the onions and cheese. Bake the tart for 35 to 40 minutes, until the eggs are set in the middle. Cool slightly and serve.', 'GettyImages-157610395-581617635f9b581c0bf17e79.webp'),
(8, 1, 'Truffled French Fries Recipe', 'Ruffled French fries have become something of a controversy on foodie forums, igniting debates over flavor and if they live up to the culinary hype. For those who don\'t mind this, these are delicious and not easily forgotten.', 4, 90, '4 large waxy potatoes, peeled,\r\n4 cups (0.95 l) water, plus 2 cups (0.47 l) of ice,\r\n4 to 5 cups (1.18 l) vegetable oil, for frying,\r\n3/4 teaspoon kosher salt,\r\n1 1/2 tablespoons white or black truffle oil,\r\n4 tablespoons freshly grated Parmesan cheese, optional,\r\n2 tablespoons minced parsley, optional,\r\n1 clove garlic, sliced, optional', 'Gather the ingredients. Cut the peeled potatoes lengthwise into thin strips, about 1/3-inch wide. Add the water and ice to a medium-sized bowl and soak the potatoes for one hour. Drain and pat completely dry. Heat up the oil in a deep-fryer or deep skillet to 325 F and blanch the potatoes for 2 minutes by frying them in batches. Drain the fries on fresh kitchen towels or paper towels. Bring the oil to 375 F. Cook the potatoes for the second time. This time, leave them for 1 1/2 minutes. Drain the fries on baking sheets lined with fresh kitchen towels or paper towels. Sprinkle them with salt to taste. Drizzle the truffle oil over and dust with the optional grated Parmesan cheese. Sprinkle the optional parsley for a colorful addition. ', 'easy-homemade-truffle-fries-recipe-1375725-hero-02-a9d4ccb2e72544469c044f6ddd728bf3.webp');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `User_Id` int(11) NOT NULL,
  `Username` varchar(64) NOT NULL,
  `Password` varchar(256) NOT NULL,
  `Role` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`User_Id`, `Username`, `Password`, `Role`) VALUES
(1, 'Guest1', '6aab07fe733b3ee93024dfeab31189ca', 'Guest'),
(2, 'Guest2', 'c5c5eadf2ff46153af6e3622eaf1f8e7', 'Guest'),
(3, 'Guest3', '1d3a4e394fcd87440c109dcd64805866', 'Guest'),
(7, 'Admin1', '2e33a9b0b06aa0a01ede70995674ee23', 'Admin'),
(8, 'Admin2', '21eed4f2e9ab214fdbf00a2a091d63c4', 'Admin'),
(9, 'Admin3', '84ff2c4b8b18c28f042557c0637c8528', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `User_Detail_Id` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Fname` varchar(64) NOT NULL,
  `Lname` varchar(64) NOT NULL,
  `Email` varchar(64) NOT NULL,
  `Tel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`User_Detail_Id`, `User_Id`, `Fname`, `Lname`, `Email`, `Tel`) VALUES
(1, 1, 'John', 'Doe', 'Guest1@gmail.com', 123456789),
(2, 2, 'Mike', 'Joshua', 'Guest2@gmail.com', 123456789),
(3, 3, 'Peter', 'Williamson', 'Guest3@gmail.com', 123456789);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_Id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`Feedback_Id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`Recipe_Id`),
  ADD KEY `Category_Id` (`Category_Id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`User_Id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`User_Detail_Id`),
  ADD KEY `User_Id` (`User_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `Category_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `Feedback_Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `Recipe_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `User_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `User_Detail_Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`Category_Id`) REFERENCES `category` (`Category_Id`);

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `user_details_ibfk_1` FOREIGN KEY (`User_Id`) REFERENCES `user` (`User_Id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
