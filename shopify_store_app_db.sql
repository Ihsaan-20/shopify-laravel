-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2024 at 02:35 PM
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
-- Database: `shopify_store_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `charges`
--

CREATE TABLE `charges` (
  `id` int(10) UNSIGNED NOT NULL,
  `charge_id` bigint(20) NOT NULL,
  `test` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `interval` varchar(255) DEFAULT NULL,
  `capped_amount` decimal(8,2) DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `billing_on` timestamp NULL DEFAULT NULL,
  `activated_on` timestamp NULL DEFAULT NULL,
  `trial_ends_on` timestamp NULL DEFAULT NULL,
  `cancelled_on` timestamp NULL DEFAULT NULL,
  `expires_on` timestamp NULL DEFAULT NULL,
  `plan_id` int(10) UNSIGNED DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `reference_charge` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2020_01_29_010501_create_plans_table', 1),
(6, '2020_01_29_230905_create_shops_table', 1),
(7, '2020_01_29_231006_create_charges_table', 1),
(8, '2020_07_03_211514_add_interval_column_to_charges_table', 1),
(9, '2020_07_03_211854_add_interval_column_to_plans_table', 1),
(10, '2021_04_21_103633_add_password_updated_at_to_users_table', 1),
(11, '2022_06_09_104819_add_theme_support_level_to_users_table', 1),
(12, '2024_02_29_111216_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `interval` varchar(255) DEFAULT NULL,
  `capped_amount` decimal(8,2) DEFAULT NULL,
  `terms` varchar(255) DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `test` tinyint(1) NOT NULL DEFAULT 0,
  `on_install` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body_html` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `template_suffix` varchar(255) DEFAULT NULL,
  `published_scope` varchar(255) DEFAULT NULL,
  `tags` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `admin_graphql_api_id` varchar(255) DEFAULT NULL,
  `variants` longtext DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `images` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `store_id`, `title`, `body_html`, `vendor`, `product_type`, `handle`, `template_suffix`, `published_scope`, `tags`, `status`, `admin_graphql_api_id`, `variants`, `options`, `images`, `image`, `created_at`, `updated_at`) VALUES
(1, '999', 'The Minimal Snowboard', NULL, 'Quickstart (eaa7987a)', '', 'the-minimal-snowboard', NULL, 'web', '', 'active', 'gid://shopify/Product/7937815707798', '[{\"id\":43169086144662,\"product_id\":7937815707798,\"title\":\"Default Title\",\"price\":\"885.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:20-05:00\",\"updated_at\":\"2024-02-28T13:00:20-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682708118,\"inventory_quantity\":50,\"old_inventory_quantity\":50,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086144662\",\"image_id\":null}]', '[{\"id\":10081313095830,\"product_id\":7937815707798,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[]', 'null', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(2, '999', 'The Videographer Snowboard', NULL, 'Quickstart (eaa7987a)', '', 'the-videographer-snowboard', NULL, 'web', '', 'active', 'gid://shopify/Product/7937815740566', '[{\"id\":43169086177430,\"product_id\":7937815740566,\"title\":\"Default Title\",\"price\":\"885.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:20-05:00\",\"updated_at\":\"2024-02-28T13:00:20-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682740886,\"inventory_quantity\":50,\"old_inventory_quantity\":50,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086177430\",\"image_id\":null}]', '[{\"id\":10081313128598,\"product_id\":7937815740566,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011274390,\"alt\":\"The top and bottom view of a snowboard. The top has view is turquoise and black with graphics of\\n        trees. The bottom view is turquoise with the word hydrogen written in cursive.\",\"position\":1,\"product_id\":7937815740566,\"created_at\":\"2024-02-28T13:00:20-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011274390\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/files\\/Main.jpg?v=1709143222\",\"variant_ids\":[]}]', '{\"id\":35660011274390,\"alt\":\"The top and bottom view of a snowboard. The top has view is turquoise and black with graphics of\\n        trees. The bottom view is turquoise with the word hydrogen written in cursive.\",\"position\":1,\"product_id\":7937815740566,\"created_at\":\"2024-02-28T13:00:20-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011274390\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/files\\/Main.jpg?v=1709143222\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(3, '999', 'The Archived Snowboard', NULL, 'Snowboard Vendor', '', 'the-archived-snowboard', NULL, 'web', 'Archived, Premium, Snow, Snowboard, Sport, Winter', 'archived', 'gid://shopify/Product/7937815773334', '[{\"id\":43169086210198,\"product_id\":7937815773334,\"title\":\"Default Title\",\"price\":\"629.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682773654,\"inventory_quantity\":50,\"old_inventory_quantity\":50,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086210198\",\"image_id\":null}]', '[{\"id\":10081313161366,\"product_id\":7937815773334,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660010913942,\"alt\":\"The top and bottom view of a snowboard.The top view is a gradient light purple and dark purple with\\n          a cube geometric pattern. The bottom view blue with light blue octagon geometric pattern.\",\"position\":1,\"product_id\":7937815773334,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660010913942\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_52f8e304-92d9-4a36-82af-50df8fe31c69.jpg?v=1709143221\",\"variant_ids\":[]}]', '{\"id\":35660010913942,\"alt\":\"The top and bottom view of a snowboard.The top view is a gradient light purple and dark purple with\\n          a cube geometric pattern. The bottom view blue with light blue octagon geometric pattern.\",\"position\":1,\"product_id\":7937815773334,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660010913942\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_52f8e304-92d9-4a36-82af-50df8fe31c69.jpg?v=1709143221\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(4, '999', 'The Draft Snowboard', NULL, 'Snowboard Vendor', '', 'the-draft-snowboard', NULL, 'web', '', 'draft', 'gid://shopify/Product/7937815806102', '[{\"id\":43169086242966,\"product_id\":7937815806102,\"title\":\"Default Title\",\"price\":\"2629.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682806422,\"inventory_quantity\":20,\"old_inventory_quantity\":20,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086242966\",\"image_id\":null}]', '[{\"id\":10081313194134,\"product_id\":7937815806102,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660010946710,\"alt\":\"Top and bottom view of a snowboard.The top view shows the text \\u201chydrogen\\u201d in overlapping blue, pink\\n          and black font. The bottom view is a purple to blue gradient with white geometric pattern overlay.\",\"position\":1,\"product_id\":7937815806102,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660010946710\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_5127218a-8f6c-498f-b489-09242c0fab0a.jpg?v=1709143221\",\"variant_ids\":[]}]', '{\"id\":35660010946710,\"alt\":\"Top and bottom view of a snowboard.The top view shows the text \\u201chydrogen\\u201d in overlapping blue, pink\\n          and black font. The bottom view is a purple to blue gradient with white geometric pattern overlay.\",\"position\":1,\"product_id\":7937815806102,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660010946710\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_5127218a-8f6c-498f-b489-09242c0fab0a.jpg?v=1709143221\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(5, '999', 'The Collection Snowboard: Hydrogen', NULL, 'Hydrogen Vendor', '', 'the-collection-snowboard-hydrogen', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937815838870', '[{\"id\":43169086275734,\"product_id\":7937815838870,\"title\":\"Default Title\",\"price\":\"600.00\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682839190,\"inventory_quantity\":50,\"old_inventory_quantity\":50,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086275734\",\"image_id\":null}]', '[{\"id\":10081313226902,\"product_id\":7937815838870,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660010979478,\"alt\":\"Top and bottom view of a snowboard. The top view shows stylized hydrogen bonds and the bottom view\\n        shows \\u201cH2\\u201d in a brush script typeface.\",\"position\":1,\"product_id\":7937815838870,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660010979478\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_0a40b01b-5021-48c1-80d1-aa8ab4876d3d.jpg?v=1709143221\",\"variant_ids\":[]}]', '{\"id\":35660010979478,\"alt\":\"Top and bottom view of a snowboard. The top view shows stylized hydrogen bonds and the bottom view\\n        shows \\u201cH2\\u201d in a brush script typeface.\",\"position\":1,\"product_id\":7937815838870,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660010979478\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_0a40b01b-5021-48c1-80d1-aa8ab4876d3d.jpg?v=1709143221\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(6, '999', 'Gift Card', 'This is a gift card for the store', 'Snowboard Vendor', '', 'gift-card', NULL, 'web', '', 'active', 'gid://shopify/Product/7937815871638', '[{\"id\":43169086308502,\"product_id\":7937815871638,\"title\":\"$10\",\"price\":\"10.00\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"gift_card\",\"inventory_management\":null,\"option1\":\"$10\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":false,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682871958,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":false,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086308502\",\"image_id\":null},{\"id\":43169086341270,\"product_id\":7937815871638,\"title\":\"$25\",\"price\":\"25.00\",\"sku\":\"\",\"position\":2,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"gift_card\",\"inventory_management\":null,\"option1\":\"$25\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":false,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682904726,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":false,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086341270\",\"image_id\":null},{\"id\":43169086374038,\"product_id\":7937815871638,\"title\":\"$50\",\"price\":\"50.00\",\"sku\":\"\",\"position\":3,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"gift_card\",\"inventory_management\":null,\"option1\":\"$50\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":false,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682937494,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":false,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086374038\",\"image_id\":null},{\"id\":43169086406806,\"product_id\":7937815871638,\"title\":\"$100\",\"price\":\"100.00\",\"sku\":\"\",\"position\":4,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"gift_card\",\"inventory_management\":null,\"option1\":\"$100\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":false,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266682970262,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":false,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086406806\",\"image_id\":null}]', '[{\"id\":10081313259670,\"product_id\":7937815871638,\"name\":\"Denominations\",\"position\":1,\"values\":[\"$10\",\"$25\",\"$50\",\"$100\"]}]', '[{\"id\":35660011012246,\"alt\":\"Gift card that shows text: Generated data gift card\",\"position\":1,\"product_id\":7937815871638,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011012246\",\"width\":2881,\"height\":2881,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/gift_card.png?v=1709143221\",\"variant_ids\":[]}]', '{\"id\":35660011012246,\"alt\":\"Gift card that shows text: Generated data gift card\",\"position\":1,\"product_id\":7937815871638,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011012246\",\"width\":2881,\"height\":2881,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/gift_card.png?v=1709143221\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(7, '999', 'The Hidden Snowboard', NULL, 'Snowboard Vendor', '', 'the-hidden-snowboard', NULL, 'web', 'Premium, Snow, Snowboard, Sport, Winter', 'active', 'gid://shopify/Product/7937815904406', '[{\"id\":43169086439574,\"product_id\":7937815904406,\"title\":\"Default Title\",\"price\":\"749.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683035798,\"inventory_quantity\":50,\"old_inventory_quantity\":50,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086439574\",\"image_id\":null}]', '[{\"id\":10081313292438,\"product_id\":7937815904406,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011045014,\"alt\":\"The top view and bottom view of a snowboard. The top view is black with a singular peach cube.\\n          The bottom view has a graphic of a stack of blocks in a gradient from light blue, to pink to peach.\",\"position\":1,\"product_id\":7937815904406,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011045014\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_c8ff0b5d-c712-429a-be00-b29bd55cbc9d.jpg?v=1709143221\",\"variant_ids\":[]}]', '{\"id\":35660011045014,\"alt\":\"The top view and bottom view of a snowboard. The top view is black with a singular peach cube.\\n          The bottom view has a graphic of a stack of blocks in a gradient from light blue, to pink to peach.\",\"position\":1,\"product_id\":7937815904406,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011045014\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_c8ff0b5d-c712-429a-be00-b29bd55cbc9d.jpg?v=1709143221\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(8, '999', 'The Inventory Not Tracked Snowboard', NULL, 'Quickstart (eaa7987a)', '', 'the-inventory-not-tracked-snowboard', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937815937174', '[{\"id\":43169086472342,\"product_id\":7937815937174,\"title\":\"Default Title\",\"price\":\"949.95\",\"sku\":\"sku-untracked-1\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":null,\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683003030,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086472342\",\"image_id\":null}]', '[{\"id\":10081313325206,\"product_id\":7937815937174,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011077782,\"alt\":\"Top and bottom view of a snowboard. The top view shows a centred hexagonal logo for Hydrogen that\\n          appears to radiate outwards, as well as some overlapping hexagons at the bottom. The bottom view shows an\\n          abstract angular grid in purples.\",\"position\":1,\"product_id\":7937815937174,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011077782\",\"width\":3097,\"height\":3908,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/snowboard_purple_hydrogen.png?v=1709143221\",\"variant_ids\":[]}]', '{\"id\":35660011077782,\"alt\":\"Top and bottom view of a snowboard. The top view shows a centred hexagonal logo for Hydrogen that\\n          appears to radiate outwards, as well as some overlapping hexagons at the bottom. The bottom view shows an\\n          abstract angular grid in purples.\",\"position\":1,\"product_id\":7937815937174,\"created_at\":\"2024-02-28T13:00:21-05:00\",\"updated_at\":\"2024-02-28T13:00:21-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011077782\",\"width\":3097,\"height\":3908,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/snowboard_purple_hydrogen.png?v=1709143221\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(9, '999', 'The Out of Stock Snowboard', NULL, 'Quickstart (eaa7987a)', '', 'the-out-of-stock-snowboard', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937815969942', '[{\"id\":43169086505110,\"product_id\":7937815969942,\"title\":\"Default Title\",\"price\":\"885.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683068566,\"inventory_quantity\":0,\"old_inventory_quantity\":0,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086505110\",\"image_id\":null}]', '[{\"id\":10081313357974,\"product_id\":7937815969942,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011110550,\"alt\":\"Top and bottom view of a snowboard. The top view shows a toggle at the top in shades of blue and\\n        yellow. The bottom view shows an abstract illustration of toggles in blues and yellows.\",\"position\":1,\"product_id\":7937815969942,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011110550\",\"width\":3908,\"height\":3908,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_f44a9605-cd62-464d-b095-d45cdaa0d0d7.jpg?v=1709143222\",\"variant_ids\":[]}]', '{\"id\":35660011110550,\"alt\":\"Top and bottom view of a snowboard. The top view shows a toggle at the top in shades of blue and\\n        yellow. The bottom view shows an abstract illustration of toggles in blues and yellows.\",\"position\":1,\"product_id\":7937815969942,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011110550\",\"width\":3908,\"height\":3908,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_f44a9605-cd62-464d-b095-d45cdaa0d0d7.jpg?v=1709143222\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(10, '999', 'The Complete Snowboard', 'This <b>PREMIUM</b> <i>snowboard</i> is so <b>SUPER</b><i>DUPER</i> awesome!', 'Snowboard Vendor', 'snowboard', 'the-complete-snowboard', NULL, 'web', 'Premium, Snow, Snowboard, Sport, Winter', 'active', 'gid://shopify/Product/7937816002710', '[{\"id\":43169086537878,\"product_id\":7937816002710,\"title\":\"Ice\",\"price\":\"699.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Ice\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":4536,\"weight\":10,\"weight_unit\":\"lb\",\"inventory_item_id\":45266683134102,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086537878\",\"image_id\":null},{\"id\":43169086570646,\"product_id\":7937816002710,\"title\":\"Dawn\",\"price\":\"699.95\",\"sku\":\"\",\"position\":2,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Dawn\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":4536,\"weight\":10,\"weight_unit\":\"lb\",\"inventory_item_id\":45266683166870,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086570646\",\"image_id\":null},{\"id\":43169086603414,\"product_id\":7937816002710,\"title\":\"Powder\",\"price\":\"699.95\",\"sku\":\"\",\"position\":3,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Powder\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":4536,\"weight\":10,\"weight_unit\":\"lb\",\"inventory_item_id\":45266683199638,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086603414\",\"image_id\":null},{\"id\":43169086636182,\"product_id\":7937816002710,\"title\":\"Electric\",\"price\":\"699.95\",\"sku\":\"\",\"position\":4,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Electric\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":4536,\"weight\":10,\"weight_unit\":\"lb\",\"inventory_item_id\":45266683232406,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086636182\",\"image_id\":null},{\"id\":43169086668950,\"product_id\":7937816002710,\"title\":\"Sunset\",\"price\":\"699.95\",\"sku\":\"\",\"position\":5,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Sunset\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":4536,\"weight\":10,\"weight_unit\":\"lb\",\"inventory_item_id\":45266683265174,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086668950\",\"image_id\":null}]', '[{\"id\":10081313390742,\"product_id\":7937816002710,\"name\":\"Color\",\"position\":1,\"values\":[\"Ice\",\"Dawn\",\"Powder\",\"Electric\",\"Sunset\"]}]', '[{\"id\":35660011143318,\"alt\":\"Top and bottom view of a snowboard. The top view shows abstract circles and lines in shades of teal.\\n          The bottom view shows abstract circles and lines in shades of purple and blue with the text \\u201cSHOPIFY\\u201d in a\\n          sans serif typeface on top.\",\"position\":1,\"product_id\":7937816002710,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011143318\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_589fc064-24a2-4236-9eaf-13b2bd35d21d.jpg?v=1709143222\",\"variant_ids\":[]}]', '{\"id\":35660011143318,\"alt\":\"Top and bottom view of a snowboard. The top view shows abstract circles and lines in shades of teal.\\n          The bottom view shows abstract circles and lines in shades of purple and blue with the text \\u201cSHOPIFY\\u201d in a\\n          sans serif typeface on top.\",\"position\":1,\"product_id\":7937816002710,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011143318\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_589fc064-24a2-4236-9eaf-13b2bd35d21d.jpg?v=1709143222\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(11, '999', 'The Compare at Price Snowboard', NULL, 'Quickstart (eaa7987a)', '', 'the-compare-at-price-snowboard', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937816035478', '[{\"id\":43169086701718,\"product_id\":7937816035478,\"title\":\"Default Title\",\"price\":\"785.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":\"885.95\",\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683101334,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086701718\",\"image_id\":null}]', '[{\"id\":10081313423510,\"product_id\":7937816035478,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011176086,\"alt\":\"Top and bottom view of a snowboard. The top view shows pixelated clouds, with the top-most one being\\n        the shape of the Shopify bag logo. The bottom view has a pixelated cloudy sky with blue, pink and purple\\n        colours.\",\"position\":1,\"product_id\":7937816035478,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011176086\",\"width\":3097,\"height\":3908,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/snowboard_sky.png?v=1709143222\",\"variant_ids\":[]}]', '{\"id\":35660011176086,\"alt\":\"Top and bottom view of a snowboard. The top view shows pixelated clouds, with the top-most one being\\n        the shape of the Shopify bag logo. The bottom view has a pixelated cloudy sky with blue, pink and purple\\n        colours.\",\"position\":1,\"product_id\":7937816035478,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011176086\",\"width\":3097,\"height\":3908,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/snowboard_sky.png?v=1709143222\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(12, '999', 'The Multi-location Snowboard', NULL, 'Quickstart (eaa7987a)', '', 'the-multi-location-snowboard', NULL, 'web', 'Premium, Snow, Snowboard, Sport, Winter', 'active', 'gid://shopify/Product/7937816101014', '[{\"id\":43169086767254,\"product_id\":7937816101014,\"title\":\"Default Title\",\"price\":\"729.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:27-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683330710,\"inventory_quantity\":100,\"old_inventory_quantity\":100,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086767254\",\"image_id\":null}]', '[{\"id\":10081313489046,\"product_id\":7937816101014,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011208854,\"alt\":\"Top and bottom view of a snowboard. The top view shows a pixelated Shopify bag logo and a pixelated\\n          character reviewing a clipboard with a questioning expression with a bright green-blue background. The bottom\\n          view is a pattern of many pixel characters with a bright green-blue background.\",\"position\":1,\"product_id\":7937816101014,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011208854\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_0a4e9096-021a-4c1e-8750-24b233166a12.jpg?v=1709143222\",\"variant_ids\":[]}]', '{\"id\":35660011208854,\"alt\":\"Top and bottom view of a snowboard. The top view shows a pixelated Shopify bag logo and a pixelated\\n          character reviewing a clipboard with a questioning expression with a bright green-blue background. The bottom\\n          view is a pattern of many pixel characters with a bright green-blue background.\",\"position\":1,\"product_id\":7937816101014,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011208854\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_0a4e9096-021a-4c1e-8750-24b233166a12.jpg?v=1709143222\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(13, '999', 'The 3p Fulfilled Snowboard', NULL, 'Quickstart (eaa7987a)', '', 'the-3p-fulfilled-snowboard', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937816133782', '[{\"id\":43169086800022,\"product_id\":7937816133782,\"title\":\"Default Title\",\"price\":\"2629.95\",\"sku\":\"sku-hosted-1\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:28-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683363478,\"inventory_quantity\":20,\"old_inventory_quantity\":20,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086800022\",\"image_id\":null}]', '[{\"id\":10081313521814,\"product_id\":7937816133782,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011241622,\"alt\":\"Top and bottom view of a snowboard. The top view shows 7 stacked hexagons and the bottom view shows\\n          a small, centred hexagonal logo for Hydrogen.\",\"position\":1,\"product_id\":7937816133782,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011241622\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_b9e0da7f-db89-4d41-83f0-7f417b02831d.jpg?v=1709143222\",\"variant_ids\":[]}]', '{\"id\":35660011241622,\"alt\":\"Top and bottom view of a snowboard. The top view shows 7 stacked hexagons and the bottom view shows\\n          a small, centred hexagonal logo for Hydrogen.\",\"position\":1,\"product_id\":7937816133782,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011241622\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_b9e0da7f-db89-4d41-83f0-7f417b02831d.jpg?v=1709143222\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(14, '999', 'The Multi-managed Snowboard', NULL, 'Multi-managed Vendor', '', 'the-multi-managed-snowboard', NULL, 'web', 'Premium, Snow, Snowboard, Sport, Winter', 'active', 'gid://shopify/Product/7937816166550', '[{\"id\":43169086832790,\"product_id\":7937816166550,\"title\":\"Default Title\",\"price\":\"629.95\",\"sku\":\"sku-managed-1\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:27-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683396246,\"inventory_quantity\":100,\"old_inventory_quantity\":100,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086832790\",\"image_id\":null}]', '[{\"id\":10081313554582,\"product_id\":7937816166550,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011307158,\"alt\":\"Top and bottom view of a snowboard. The top view shows an illustration with varied outlined shapes\\n          in black. The bottom view shows a black box character with an H pointing, and surrounded by black outlined\\n          illustrative elements.\",\"position\":1,\"product_id\":7937816166550,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011307158\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_9129b69a-0c7b-4f66-b6cf-c4222f18028a.jpg?v=1709143222\",\"variant_ids\":[]}]', '{\"id\":35660011307158,\"alt\":\"Top and bottom view of a snowboard. The top view shows an illustration with varied outlined shapes\\n          in black. The bottom view shows a black box character with an H pointing, and surrounded by black outlined\\n          illustrative elements.\",\"position\":1,\"product_id\":7937816166550,\"created_at\":\"2024-02-28T13:00:22-05:00\",\"updated_at\":\"2024-02-28T13:00:22-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011307158\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_9129b69a-0c7b-4f66-b6cf-c4222f18028a.jpg?v=1709143222\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(15, '999', 'The Collection Snowboard: Oxygen', NULL, 'Hydrogen Vendor', '', 'the-collection-snowboard-oxygen', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937816199318', '[{\"id\":43169086865558,\"product_id\":7937816199318,\"title\":\"Default Title\",\"price\":\"1025.00\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:23-05:00\",\"updated_at\":\"2024-02-28T13:00:23-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683429014,\"inventory_quantity\":50,\"old_inventory_quantity\":50,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086865558\",\"image_id\":null}]', '[{\"id\":10081313587350,\"product_id\":7937816199318,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011339926,\"alt\":\"Top and bottom view of a snowboard. The top view shows a stylized scene of trees, mountains, sky and\\n        a sun in red colours. The bottom view has blue wavy lines in the background with the text \\u201cOxygen\\u201d in a\\n        stylized script typeface.\",\"position\":1,\"product_id\":7937816199318,\"created_at\":\"2024-02-28T13:00:23-05:00\",\"updated_at\":\"2024-02-28T13:00:23-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011339926\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_d624f226-0a89-4fe1-b333-0d1548b43c06.jpg?v=1709143223\",\"variant_ids\":[]}]', '{\"id\":35660011339926,\"alt\":\"Top and bottom view of a snowboard. The top view shows a stylized scene of trees, mountains, sky and\\n        a sun in red colours. The bottom view has blue wavy lines in the background with the text \\u201cOxygen\\u201d in a\\n        stylized script typeface.\",\"position\":1,\"product_id\":7937816199318,\"created_at\":\"2024-02-28T13:00:23-05:00\",\"updated_at\":\"2024-02-28T13:00:23-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011339926\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_d624f226-0a89-4fe1-b333-0d1548b43c06.jpg?v=1709143223\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(16, '999', 'Selling Plans Ski Wax', NULL, 'Quickstart (eaa7987a)', '', 'selling-plans-ski-wax', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937816232086', '[{\"id\":43169086931094,\"product_id\":7937816232086,\"title\":\"Selling Plans Ski Wax\",\"price\":\"24.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Selling Plans Ski Wax\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":57,\"weight\":2,\"weight_unit\":\"oz\",\"inventory_item_id\":45266683494550,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086931094\",\"image_id\":35660011405462},{\"id\":43169086963862,\"product_id\":7937816232086,\"title\":\"Special Selling Plans Ski Wax\",\"price\":\"49.95\",\"sku\":\"\",\"position\":2,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Special Selling Plans Ski Wax\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":71,\"weight\":2.5,\"weight_unit\":\"oz\",\"inventory_item_id\":45266683527318,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086963862\",\"image_id\":35660011438230},{\"id\":43169086996630,\"product_id\":7937816232086,\"title\":\"Sample Selling Plans Ski Wax\",\"price\":\"9.95\",\"sku\":\"\",\"position\":3,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Sample Selling Plans Ski Wax\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":14,\"weight\":0.5,\"weight_unit\":\"oz\",\"inventory_item_id\":45266683560086,\"inventory_quantity\":10,\"old_inventory_quantity\":10,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169086996630\",\"image_id\":35660011470998}]', '[{\"id\":10081313620118,\"product_id\":7937816232086,\"name\":\"Title\",\"position\":1,\"values\":[\"Selling Plans Ski Wax\",\"Special Selling Plans Ski Wax\",\"Sample Selling Plans Ski Wax\"]}]', '[{\"id\":35660011405462,\"alt\":\"A bar of golden yellow wax\",\"position\":1,\"product_id\":7937816232086,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011405462\",\"width\":2881,\"height\":2881,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/snowboard_wax.png?v=1709143224\",\"variant_ids\":[43169086931094]},{\"id\":35660011438230,\"alt\":\"A bar of purple wax\",\"position\":2,\"product_id\":7937816232086,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011438230\",\"width\":2881,\"height\":2881,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/wax-special.png?v=1709143224\",\"variant_ids\":[43169086963862]},{\"id\":35660011470998,\"alt\":\"a small cube of wax\",\"position\":3,\"product_id\":7937816232086,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011470998\",\"width\":2881,\"height\":2881,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/sample-normal-wax.png?v=1709143224\",\"variant_ids\":[43169086996630]}]', '{\"id\":35660011405462,\"alt\":\"A bar of golden yellow wax\",\"position\":1,\"product_id\":7937816232086,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011405462\",\"width\":2881,\"height\":2881,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/snowboard_wax.png?v=1709143224\",\"variant_ids\":[43169086931094]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(17, '999', 'The Collection Snowboard: Liquid', NULL, 'Hydrogen Vendor', '', 'the-collection-snowboard-liquid', NULL, 'web', 'Accessory, Sport, Winter', 'active', 'gid://shopify/Product/7937816264854', '[{\"id\":43169087029398,\"product_id\":7937816264854,\"title\":\"Default Title\",\"price\":\"749.95\",\"sku\":\"\",\"position\":1,\"inventory_policy\":\"deny\",\"compare_at_price\":null,\"fulfillment_service\":\"manual\",\"inventory_management\":\"shopify\",\"option1\":\"Default Title\",\"option2\":null,\"option3\":null,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"taxable\":true,\"barcode\":null,\"grams\":0,\"weight\":0,\"weight_unit\":\"kg\",\"inventory_item_id\":45266683592854,\"inventory_quantity\":50,\"old_inventory_quantity\":50,\"requires_shipping\":true,\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductVariant\\/43169087029398\",\"image_id\":null}]', '[{\"id\":10081313652886,\"product_id\":7937816264854,\"name\":\"Title\",\"position\":1,\"values\":[\"Default Title\"]}]', '[{\"id\":35660011503766,\"alt\":\"Top and bottom view of a snowboard. The top view shows a stylized scene of water, trees, mountains,\\n        sky and a moon in blue colours. The bottom view has a blue liquid, drippy background with the text \\u201cliquid\\u201d in\\n        a stylized script typeface.\",\"position\":1,\"product_id\":7937816264854,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011503766\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_b13ad453-477c-4ed1-9b43-81f3345adfd6.jpg?v=1709143224\",\"variant_ids\":[]}]', '{\"id\":35660011503766,\"alt\":\"Top and bottom view of a snowboard. The top view shows a stylized scene of water, trees, mountains,\\n        sky and a moon in blue colours. The bottom view has a blue liquid, drippy background with the text \\u201cliquid\\u201d in\\n        a stylized script typeface.\",\"position\":1,\"product_id\":7937816264854,\"created_at\":\"2024-02-28T13:00:24-05:00\",\"updated_at\":\"2024-02-28T13:00:24-05:00\",\"admin_graphql_api_id\":\"gid:\\/\\/shopify\\/ProductImage\\/35660011503766\",\"width\":1600,\"height\":1600,\"src\":\"https:\\/\\/cdn.shopify.com\\/s\\/files\\/1\\/0635\\/4386\\/9590\\/products\\/Main_b13ad453-477c-4ed1-9b43-81f3345adfd6.jpg?v=1709143224\",\"variant_ids\":[]}', '2024-02-29 08:11:41', '2024-02-29 08:11:41'),
(18, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(19, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(20, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(21, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(22, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(23, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:19:22', '2024-03-02 02:19:22'),
(32, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(33, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(34, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(35, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41');
INSERT INTO `products` (`id`, `store_id`, `title`, `body_html`, `vendor`, `product_type`, `handle`, `template_suffix`, `published_scope`, `tags`, `status`, `admin_graphql_api_id`, `variants`, `options`, `images`, `image`, `created_at`, `updated_at`) VALUES
(36, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(37, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:19:41', '2024-03-02 02:19:41'),
(46, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(47, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(48, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(49, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(50, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(51, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(52, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:27:03', '2024-03-02 02:27:03'),
(60, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(61, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(62, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(63, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(64, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(65, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(66, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(70, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(71, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:27:18', '2024-03-02 02:27:18'),
(74, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(75, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(76, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(77, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(78, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(79, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(80, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(81, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:29:19', '2024-03-02 02:29:19'),
(88, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:31', '2024-03-02 02:29:31'),
(89, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:31', '2024-03-02 02:29:31'),
(90, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:31', '2024-03-02 02:29:31'),
(91, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:31', '2024-03-02 02:29:31'),
(92, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(93, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(95, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:29:32', '2024-03-02 02:29:32'),
(102, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(103, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(104, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(105, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(106, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(107, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(115, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:30:00', '2024-03-02 02:30:00'),
(116, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(117, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(118, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(119, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(120, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(121, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(122, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(123, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(124, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(125, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(126, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(127, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(128, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(129, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:32:13', '2024-03-02 02:32:13'),
(130, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(131, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(132, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(133, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(134, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(135, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(136, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(137, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(140, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(142, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(143, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:33:46', '2024-03-02 02:33:46'),
(144, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:22', '2024-03-02 02:34:22'),
(145, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(146, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(147, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(148, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(149, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(150, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(151, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(152, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(153, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(154, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(155, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(156, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(157, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:34:23', '2024-03-02 02:34:23'),
(158, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:17', '2024-03-02 02:35:17'),
(159, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(160, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(161, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(162, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(163, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(164, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(165, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(166, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(167, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(168, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(169, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"name\":\"Size\",\"values\":[\"Small\",\"Medium\",\"Large\"]},{\"name\":\"Color\",\"values\":[\"Red\",\"Green\",\"Blue\"]}]', NULL, NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(170, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"src\":\"image1.jpg\",\"alt\":\"Image 1\"},{\"src\":\"image2.jpg\",\"alt\":\"Image 2\"}]', NULL, '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(171, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"src\":\"dummy-image.jpg\"}', '2024-03-02 02:35:18', '2024-03-02 02:35:18'),
(172, NULL, 'Dummy Title', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(173, NULL, NULL, '<p>Dummy description</p>', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(174, NULL, NULL, NULL, 'Dummy Vendor', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(175, NULL, NULL, NULL, NULL, 'Dummy Product Type', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(176, NULL, NULL, NULL, NULL, NULL, 'dummy-handle', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(177, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy-template', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(178, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'global', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(179, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'dummy, tags', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(180, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'draft', NULL, NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(181, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'gid://shopify/Product/123456789', NULL, NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37'),
(182, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[{\"option1\":\"Red\",\"price\":10.99},{\"option1\":\"Blue\",\"price\":12.99}]', NULL, NULL, NULL, '2024-03-02 02:36:37', '2024-03-02 02:36:37');

-- --------------------------------------------------------

--
-- Table structure for table `products_shop`
--

CREATE TABLE `products_shop` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `added_by` varchar(6) NOT NULL DEFAULT 'admin',
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `photos` varchar(2000) DEFAULT NULL,
  `thumbnail_img` varchar(100) DEFAULT NULL,
  `video_provider` varchar(20) DEFAULT NULL,
  `video_link` varchar(100) DEFAULT NULL,
  `tags` varchar(500) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `unit_price` double(20,2) NOT NULL,
  `purchase_price` double(20,2) DEFAULT NULL,
  `variant_product` int(1) NOT NULL DEFAULT 0,
  `attributes` varchar(1000) NOT NULL DEFAULT '[]',
  `choice_options` mediumtext DEFAULT NULL,
  `colors` mediumtext DEFAULT NULL,
  `variations` text DEFAULT NULL,
  `todays_deal` int(11) NOT NULL DEFAULT 0,
  `published` int(11) NOT NULL DEFAULT 1,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `stock_visibility_state` varchar(10) NOT NULL DEFAULT 'quantity',
  `cash_on_delivery` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = On, 0 = Off',
  `featured` int(11) NOT NULL DEFAULT 0,
  `seller_featured` int(11) NOT NULL DEFAULT 0,
  `current_stock` int(10) NOT NULL DEFAULT 0,
  `unit` varchar(20) DEFAULT NULL,
  `weight` double(8,2) NOT NULL DEFAULT 0.00,
  `min_qty` int(11) NOT NULL DEFAULT 1,
  `low_stock_quantity` int(11) DEFAULT NULL,
  `discount` double(20,2) DEFAULT NULL,
  `discount_type` varchar(10) DEFAULT NULL,
  `discount_start_date` int(11) DEFAULT NULL,
  `discount_end_date` int(11) DEFAULT NULL,
  `tax` double(20,2) DEFAULT NULL,
  `tax_type` varchar(10) DEFAULT NULL,
  `shipping_type` varchar(20) DEFAULT 'flat_rate',
  `shipping_cost` double(20,2) NOT NULL DEFAULT 0.00,
  `is_quantity_multiplied` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Mutiplied with shipping cost',
  `est_shipping_days` int(11) DEFAULT NULL,
  `num_of_sale` int(11) NOT NULL DEFAULT 0,
  `meta_title` mediumtext DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_img` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `slug` mediumtext NOT NULL,
  `rating` double(8,2) NOT NULL DEFAULT 0.00,
  `barcode` varchar(255) DEFAULT NULL,
  `digital` int(1) NOT NULL DEFAULT 0,
  `auction_product` int(1) NOT NULL DEFAULT 0,
  `file_name` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `external_link` varchar(500) DEFAULT NULL,
  `external_link_btn` varchar(255) DEFAULT 'Buy Now',
  `wholesale_product` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products_shop`
--

INSERT INTO `products_shop` (`id`, `name`, `added_by`, `user_id`, `category_id`, `brand_id`, `photos`, `thumbnail_img`, `video_provider`, `video_link`, `tags`, `description`, `unit_price`, `purchase_price`, `variant_product`, `attributes`, `choice_options`, `colors`, `variations`, `todays_deal`, `published`, `approved`, `stock_visibility_state`, `cash_on_delivery`, `featured`, `seller_featured`, `current_stock`, `unit`, `weight`, `min_qty`, `low_stock_quantity`, `discount`, `discount_type`, `discount_start_date`, `discount_end_date`, `tax`, `tax_type`, `shipping_type`, `shipping_cost`, `is_quantity_multiplied`, `est_shipping_days`, `num_of_sale`, `meta_title`, `meta_description`, `meta_img`, `pdf`, `slug`, `rating`, `barcode`, `digital`, `auction_product`, `file_name`, `file_path`, `external_link`, `external_link_btn`, `wholesale_product`, `created_at`, `updated_at`) VALUES
(1, 'MAYBELLINE - COLOSSAL MAGNUM MASCARA BLK AS', 'seller', 3, 1, 1, '2', '2', 'youtube', 'https://youtu.be/pjJg1yoobvk?si=KNjrnDGhsPoXsqiW', 'Maybelline,Mascara', '<ul><li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">The Colossal Mascara delivers bold, fast, and colossal volume instantly. The Mega Brush</li><li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\"><br></li><li style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">and collagen-infused formula deliver our most massive volume in just one coat!</li></ul>', 49.99, NULL, 1, '[]', '[]', '[\"#FFFF00\"]', NULL, 0, 1, 1, 'quantity', 1, 0, 1, 10, '2.5', 2.00, 1, 1, 2.00, 'percent', NULL, NULL, NULL, NULL, 'flat_rate', 10.00, 1, NULL, 0, 'MAYBELLINE - COLOSSAL MAGNUM MASCARA BLK AS', 'The Colossal Mascara delivers bold, fast, and colossal volume instantly. The Mega Brushand collagen-infused formula deliver our most massive volume in just one coat!', '2', NULL, 'maybelline-colossal-magnum-mascara-blk-as', 0.00, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, '2024-02-24 03:34:00', '2024-02-24 07:47:26'),
(2, 'HAVOLINE MOTOR OIL SAE 20W-50 (4 L)', 'seller', 10, 1, 1, '3', '3', 'youtube', 'https://www.youtube.com/watch?v=UTHi17Zqx4M', 'okay,two,three,four', '<h2 class=\"pdp-mod-section-title outer-title\" data-spm-anchor-id=\"a2a0e.pdp.0.i4.23d64870srCVi4\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px 24px; font-family: Roboto-Medium; font-size: 14px; line-height: 52px; color: rgb(33, 33, 33); overflow: hidden; text-overflow: ellipsis; text-wrap: nowrap; height: 52px; background: rgb(250, 250, 250);\">Product details of HAVOLINE MOTOR OIL SAE 20W-50 (4 L)</h2><div class=\"pdp-product-detail\" data-spm=\"product_detail\" style=\"margin: 0px; padding: 0px; position: relative; font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, sans-serif;\"><div class=\"pdp-product-desc \" style=\"margin: 0px; padding: 5px 14px 5px 24px; height: auto; overflow-y: hidden;\"><div class=\"html-content pdp-product-highlights\" style=\"margin: 0px; padding: 11px 0px 16px; word-break: break-word; border-bottom: 1px solid rgb(239, 240, 245); overflow: hidden;\"><ul class=\"\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; margin-block-start: 1em; font-size: 14px; list-style: none; overflow: hidden; columns: 2; column-gap: 32px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid; column-span: all;\">Havoline® Motor Oil is a quality engine oil for use in a wide range of passenger car and light-duty commercial vehicle gasoline engines where API SG or lower performance lubricants are required.</li></ul></div><div class=\"html-content detail-content\" style=\"margin: 16px 0px 0px; padding: 0px 0px 16px; word-break: break-word; position: relative; height: auto; line-height: 19px; overflow-y: hidden; border-bottom: 1px solid rgb(239, 240, 245);\"><ul class=\"ul\" style=\"margin-right: 0px; margin-bottom: 1.56em; margin-left: 0px; margin-block-start: 1em; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 16px; line-height: 1.4; font-family: itcfranklingothicstdbook, helvetica, arial, sans-serif; list-style-position: initial; list-style-image: initial; background: 0px center; padding: 0px; border: 0px; color: rgb(40, 40, 40); vertical-align: baseline; box-sizing: inherit;\"><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\"><p style=\"padding: 0px; margin-block: 1em; background: 0px center; margin-right: 0px; margin-bottom: 0.75em; margin-left: 0px; border: 0px; vertical-align: baseline; box-sizing: inherit;\"><u style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">BENEFITS</span></u></p></li><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; font-weight: 600; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\">Long engine life</span></li><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\">Proven metallo-organic anti-wear additive system protects engines under all operating conditions by providing excellent wear control in even the most sophisticated valve train mechanisms, including those with variable valve timing. Multigrade viscosity provides additional protection against wear at start-up and under high temperature operating conditions.</li><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; font-weight: 600; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\">Preserves power and performance</span><br style=\"margin: 0px; padding: 0px; box-sizing: inherit;\">Metallic detergent and ashless dispersant additive system preserves power and performance by providing good control of piston and ring deposits.</li><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\"><span style=\"margin: 0px; padding: 0px; font-weight: 600; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\">Saves on maintenance</span><br style=\"margin: 0px; padding: 0px; box-sizing: inherit;\">Good thermal and oxidation stability resists in-service oil degradation that contributes to filter blocking and sludge formation.</li></ul><p style=\"padding: 0px; margin-block: 1em; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; margin-right: 0px; margin-bottom: 0.75em; margin-left: 0px; vertical-align: baseline;\"></p><ul class=\"ul\" style=\"margin-right: 0px; margin-bottom: 1.56em; margin-left: 0px; margin-block-start: 1em; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 16px; line-height: 1.4; font-family: itcfranklingothicstdbook, helvetica, arial, sans-serif; list-style-position: initial; list-style-image: initial; background: 0px center; padding: 0px; border: 0px; color: rgb(40, 40, 40); vertical-align: baseline; box-sizing: inherit;\"><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: 0px center; border: 0px; vertical-align: baseline; box-sizing: inherit;\"><u style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">FEATURES</span></u></li><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: 0px center; border: 0px; vertical-align: baseline; box-sizing: inherit;\"><span style=\"margin: 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal;\">Havoline® Motor Oil is a quality engine oil for use in a wide range of passenger car and light-duty commercial vehicle gasoline engines where API SG or lower performance lubricants are required.</span></li></ul><p style=\"padding: 0px; margin-block: 1em; background: 0px center; margin-right: 0px; margin-bottom: 0.75em; margin-left: 0px; border: 0px; vertical-align: baseline; box-sizing: inherit;\"></p><ul class=\"ul\" style=\"margin-right: 0px; margin-bottom: 1.56em; margin-left: 0px; margin-block-start: 1em; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-variant-position: normal; font-stretch: normal; font-size: 16px; line-height: 1.4; font-family: itcfranklingothicstdbook, helvetica, arial, sans-serif; list-style-position: initial; list-style-image: initial; background: 0px center; padding: 0px; border: 0px; color: rgb(40, 40, 40); vertical-align: baseline; box-sizing: inherit;\"><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: 0px center; border: 0px; vertical-align: baseline; box-sizing: inherit;\"><u style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-weight: bolder;\">APPLICATIONS</span></u></li><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\">Passenger car and light truck gasoline engines where oils of up to API SG performance are required.</li><li style=\"margin: 0px 0px 0.75em; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\">Industrial and marine applications of passenger car type gasoline engines where oils of up to API SG performance are required.</li></ul><p style=\"padding: 0px; margin-block: 1em; font-size: 16px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; color: rgb(40, 40, 40); font-family: itcfranklingothicstdbook, helvetica, arial, sans-serif; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; line-height: 1.4; margin-right: 0px; margin-bottom: 1.56em; margin-left: 0px; vertical-align: baseline;\"><i style=\"margin: 0px; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\">Not recommended for use in gasoline engines that require API SH or higher performance or ACEA-classified oils, or in any gas-fuelled (CNG or LPG) engines, in any diesel engines or in any motorcycle engines. API SG performance oils are intended for use in vehicles manufactured before 1994</i></p><p style=\"padding: 0px; margin-block: 1em; font-size: 16px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; color: rgb(40, 40, 40); font-family: itcfranklingothicstdbook, helvetica, arial, sans-serif; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-variant-position: normal; line-height: 1.4; margin-right: 0px; margin-bottom: 1.56em; margin-left: 0px; vertical-align: baseline;\"><i data-spm-anchor-id=\"a2a0e.pdp.product_detail.i2.23d64870srCVi4\" style=\"margin: 0px; padding: 0px; background: none 0px 50% / auto repeat scroll padding-box border-box transparent; border-color: currentcolor; border-style: none; border-width: 0px; border-image: none 100% / 1 / 0 stretch; box-sizing: inherit; vertical-align: baseline;\"><img alt=\"Product PDS MO.jpg\" src=\"https://static-01.daraz.pk/p/7e8f139ebc091ca9b12a44bcde343f23.jpg\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.23d64870srCVi4\" style=\"margin: 0px; padding: 0px; display: block; max-width: 100%; height: 1244px; width: 576px;\"></i></p></div></div></div>', 250.00, NULL, 0, '[]', '[]', '[]', NULL, 0, 1, 1, 'quantity', 1, 0, 1, 5, 'kg', 1.00, 1, 1, 15.00, 'amount', 1709078400, 1709164799, NULL, NULL, 'free', 0.00, 0, 5, 5, 'Aut et quia blanditi', 'Product details of HAVOLINE MOTOR OIL SAE 20W-50 (4 L)\r\nHavoline® Motor Oil is a quality engine oil for use in a wide range of passenger car and light-duty commercial vehicle gasoline engines where API SG or lower performance lubricants are required.', '3', NULL, 'havoline-motor-oil-sae-20w-50-4-l', 0.00, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, '2024-02-28 05:24:05', '2024-02-28 07:52:20'),
(3, 'Lemon Max Dishwash Long Bar 265g', 'seller', 3, 1, 2, '6,7,8,9', '7', 'youtube', 'https://www.youtube.com/watch?v=UTHi17Zqx4M', 'lemon,max,long,bar', '<p><span style=\"color: rgb(92, 95, 98); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">enable your app to embed transactional workflows that display as modals. These actions let users interact with your app directly from key pages of the Shopify admin, such as the&nbsp;</span><span style=\"transition: var(--motion-base-transition-theme-modes); font-weight: 600; color: rgb(92, 95, 98); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">Products</span><span style=\"color: rgb(92, 95, 98); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">,&nbsp;</span><span style=\"transition: var(--motion-base-transition-theme-modes); font-weight: 600; color: rgb(92, 95, 98); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">Customers</span><span style=\"color: rgb(92, 95, 98); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">, and&nbsp;</span><span style=\"transition: var(--motion-base-transition-theme-modes); font-weight: 600; color: rgb(92, 95, 98); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">Orders</span><span style=\"color: rgb(92, 95, 98); font-family: Inter, -apple-system, BlinkMacSystemFont, &quot;San Francisco&quot;, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, sans-serif; font-size: 16px;\">&nbsp;pages.</span><br></p>', 250.00, NULL, 1, '[]', '[]', '[\"#F0F8FF\",\"#9966CC\",\"#FAEBD7\",\"#00FFFF\"]', NULL, 0, 1, 1, 'quantity', 1, 0, 0, 0, 'KG', 1.50, 1, 10, 50.00, 'amount', NULL, NULL, NULL, NULL, 'free', 0.00, 0, 1, 0, 'Aut et quia blanditi', 'enable your app to embed transactional workflows that display as modals. These actions let users interact with your app directly from key pages of the Shopify admin, such as the Products, Customers, and Orders pages.', '6', NULL, 'lemon-max-dishwash-long-bar-265g', 0.00, NULL, 0, 0, NULL, NULL, 'http://127.0.0.1:8000/shopify', 'Incididunt quos Nam', 0, '2024-03-02 03:22:35', '2024-03-02 03:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant` varchar(255) NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `price` double(20,2) NOT NULL DEFAULT 0.00,
  `qty` int(11) NOT NULL DEFAULT 0,
  `image` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `variant`, `sku`, `price`, `qty`, `image`, `created_at`, `updated_at`) VALUES
(2, 1, 'Yellow', NULL, 49.99, 10, NULL, '2024-02-24 07:47:26', '2024-02-24 07:47:26'),
(3, 2, '', 'sku-oil', 250.00, 1, NULL, '2024-02-28 05:24:05', '2024-02-28 07:29:25'),
(4, 3, 'AliceBlue', 'abc', 250.00, 10, 6, '2024-03-02 03:22:35', '2024-03-02 03:22:35'),
(5, 3, 'Amethyst', 'def', 250.00, 10, 7, '2024-03-02 03:22:35', '2024-03-02 03:22:35'),
(6, 3, 'AntiqueWhite', 'ghi', 250.00, 10, 8, '2024-03-02 03:22:35', '2024-03-02 03:22:35'),
(7, 3, 'Aqua', 'jkl', 250.00, 10, 9, '2024-03-02 03:22:35', '2024-03-02 03:22:35');

-- --------------------------------------------------------

--
-- Table structure for table `uploads`
--

CREATE TABLE `uploads` (
  `id` int(11) NOT NULL,
  `file_original_name` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `file_size` int(11) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `type` varchar(15) DEFAULT NULL,
  `external_link` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uploads`
--

INSERT INTO `uploads` (`id`, `file_original_name`, `file_name`, `user_id`, `file_size`, `extension`, `type`, `external_link`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'ad75bf31f5f9ed5459c3734babc4a031.jpg_750x750.jpg_', 'uploads/all/N3VZnvRVCad3Ls2zivAHmk4LIMeWre6VX1PrqLZw.webp', 3, 32552, 'webp', 'image', NULL, '2024-02-24 03:24:41', '2024-02-24 03:24:41', NULL),
(2, 'ad75bf31f5f9ed5459c3734babc4a031.jpg_750x750.jpg_', 'uploads/all/6bpJy3CEHNu6fNxBmZpeYL3Z1oOANjqYRk8Y7BHC.webp', 3, 32552, 'webp', 'image', NULL, '2024-02-24 07:46:49', '2024-02-24 07:46:49', NULL),
(3, '2652d75c77ba0e316ff65bb41b4f344d.jpg_750x750.jpg_', 'uploads/all/0d0fc5qrmRsiiDdESyELlJTyZPSyYPJya1JMMMwM.webp', 10, 29742, 'webp', 'image', NULL, '2024-02-28 05:01:37', '2024-02-28 05:01:37', NULL),
(4, '2652d75c77ba0e316ff65bb41b4f344d.jpg_750x750.jpg_', 'uploads/all/rwUGdiICJ99WmvwFYGYFamkb5Mxnb8RLQZZ4JinZ.webp', 8, 29742, 'webp', 'image', NULL, '2024-02-28 06:12:37', '2024-02-28 06:12:37', NULL),
(5, 'Screenshot (8)', 'uploads/all/8pz2AhTb66B16EmajB4TTDqwlaDy6wbO5ouaYQuH.png', 9, 429509, 'png', 'image', NULL, '2024-02-28 07:52:04', '2024-02-28 07:52:04', NULL),
(6, '62f093e9c5f22dee5b1e6f44ee38ed21.png_750x750.jpg_', 'uploads/all/m0aWJ3lMD3zS2l1Jw8aK3dm0E35TeOZkCNiQtfoC.webp', 3, 42274, 'webp', 'image', NULL, '2024-03-02 03:19:34', '2024-03-02 03:19:34', NULL),
(7, '619ee11f469c4677b71045e35ae589dc.jpg_750x750.jpg_', 'uploads/all/1Rp9a6JfibfO6Dnp1PWH28krWz3aLiBdd8CLLTbl.webp', 3, 43064, 'webp', 'image', NULL, '2024-03-02 03:19:34', '2024-03-02 03:19:34', NULL),
(8, 'b635e1c89e99c8a595bf61fdcc2e493e.jpg_750x750.jpg_', 'uploads/all/9mceTuuCset1GSnGEtnBsJilldmHLMcEmHmWDPPm.webp', 3, 31306, 'webp', 'image', NULL, '2024-03-02 03:19:34', '2024-03-02 03:19:34', NULL),
(9, 'fb9ce5ec0603ce6f5fec07c7de96bf9c.png_750x750.jpg_', 'uploads/all/56eBsZsj6i7giv2JJ9ttI1SzGn5svOYvJEyfDdBI.webp', 3, 30758, 'webp', 'image', NULL, '2024-03-02 03:19:34', '2024-03-02 03:19:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `shopify_grandfathered` tinyint(1) NOT NULL DEFAULT 0,
  `shopify_namespace` varchar(255) DEFAULT NULL,
  `shopify_freemium` tinyint(1) NOT NULL DEFAULT 0,
  `plan_id` int(10) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `password_updated_at` date DEFAULT NULL,
  `theme_support_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `shopify_grandfathered`, `shopify_namespace`, `shopify_freemium`, `plan_id`, `deleted_at`, `password_updated_at`, `theme_support_level`) VALUES
(1, 'quickstart-eaa7987a.myshopify.com', 'shop@quickstart-eaa7987a.myshopify.com', NULL, '', NULL, '2024-03-02 06:28:05', '2024-03-02 06:28:05', 0, NULL, 0, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `charges`
--
ALTER TABLE `charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `charges_user_id_foreign` (`user_id`),
  ADD KEY `charges_plan_id_foreign` (`plan_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_plan_id_foreign` (`plan_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `charges`
--
ALTER TABLE `charges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `charges`
--
ALTER TABLE `charges`
  ADD CONSTRAINT `charges_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`),
  ADD CONSTRAINT `charges_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_plan_id_foreign` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
