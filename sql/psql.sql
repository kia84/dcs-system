
CREATE ROLE device_control_server WITH
	SUPERUSER
	LOGIN
	REPLICATION
	ENCRYPTED PASSWORD 'dcs';

CREATE DATABASE device_control_database WITH
	OWNER = device_control_server
	ENCODING = 'UTF8';

CREATE TABLE IF NOT EXISTS computers(
	id		integer	PRIMARY KEY,
--	db_id		integer,	-- Local cache only
--	md5sum		varchar(32),	-- Local cache only
	domen_name	varchar(256) NOT NULL CHECK (domen_name <> ''),
	created_at	timestamp DEFAULT current_timestamp,
	accepted_at	timestamp,
	deleted_at	timestamp
);

--UPDATE computers SET accepted_at = '2012-12-05 14:00:53' WHERE id = 1;

CREATE TABLE IF NOT EXISTS details(
	id		integer	PRIMARY KEY,
	vendor_id	integer REFERENCES vendors(id),
	device_id	integer,
	subsystem_id	integer REFERENCES subsystems(id),
	revision	integer,
	serial		varchar(128),
	created_at	timestamp DEFAULT current_timestamp,
	accepted_at	timestamp,
	deleted_at	timestamp
);

CREATE TABLE IF NOT EXISTS computers_details(
	id		integer	PRIMARY KEY,
	computer_id	integer REFERENCES computers(id),
	detail_id	integer REFERENCES details(id),
	created_at	timestamp DEFAULT current_timestamp,
	accepted_at	timestamp DEFAULT NULL,
	deleted_at	timestamp DEFAULT NULL
);

INSERT INTO computers VALUES (1,	60,	'63985036671a91cb4406498fda70027f',	'monster1@msiu.ru'),
(2,	63,	'6cb7acf6f5f1cdb6c9bf7b7851762aca',	'monster2@msiu.ru'),
(3,	69,	'04130b1df34bfa1943403e83f247b752',	'monster3@msiu.ru'),
(4,	9,	'c186962cfd9f0bc9a732aaa90fac3142',	'monster4@msiu.ru'),
(5,	52,	'34d066155b981d7d97314c302d6c7a7c',	'monster5@msiu.ru'),
(6,	6,	'ebca9f93b632bb728b2aa68e3b877696',	'monster6@msiu.ru'),
(7,	28,	'82d2c1f0b78e90c10dd88c6e87c01a72',	'monster7@msiu.ru'),
(8,	41,	'd19a63b399e0e265b346542b6995defb',	'monster8@msiu.ru'),
(9,	72,	'1542e943c02b7aa2e4c2935854c2e27f',	'monster9@msiu.ru'),
(10,	19,	'49e54001a1dd726381dcd67a8e9542a3',	'monster10@msiu.ru'),
(11,	46,	'80c55051ae3e39e3c874f6564e9d219e',	'monster11@msiu.ru'),
(12,	97,	'dc157a0bb5e66e016801f6f7761f5c39',	'monster12@msiu.ru'),
(13,	27,	'61ab54aced8289716674689ac0765583',	'monster13@msiu.ru'),
(14,	47,	'3a1a5fa361fbd0f8e109be3c92d13d4d',	'monster14@msiu.ru'),
(15,	74,	'a986855a643de4a96a8683fd95479df4',	'monster15@msiu.ru'),
(16,	1,	'bd562e5f6963ffd1e0ef4c0ace90eedd',	'monster16@msiu.ru'),
(17,	99,	'fbc2dc3d86c37652d340d770fd9158e7',	'monster17@msiu.ru'),
(18,	33,	'8c425d8e674cd13aac41305829b168ad',	'monster18@msiu.ru'),
(19,	8,	'197d5d7544ca03087040fe6f5538e81f',	'monster19@msiu.ru'),
(20,	70,	'2c5ab6cb0980cc7e9b79c0b035e75dd6',	'monster20@msiu.ru');

INSERT INTO details VALUES (1,	1293,	41941,	536),
(2,	4122,	59417,	2627),
(3,	684,	36319,	DEFAULT),
(4,	4100,	55875,	452),
(5,	4147,	1291,	DEFAULT),
(6,	1941,	20075,	1282),
(7,	4131,	40090,	3259),
(8,	771,	61343,	DEFAULT),
(9,	1647,	50173,	DEFAULT),
(10,	539,	52959,	DEFAULT),
(11,	3669,	10773,	DEFAULT),
(12,	4108,	36722,	DEFAULT),
(13,	736,	23468,	3901),
(14,	771,	38291,	DEFAULT),
(15,	4138,	12501,	3361),
(16,	1653,	40082,	4042),
(17,	4139,	32037,	192),
(18,	4151,	12115,	1283),
(19,	4115,	3250,	DEFAULT),
(20,	4130,	58516,	DEFAULT),
(21,	4129,	55223,	DEFAULT),
(22,	4098,	10887,	DEFAULT),
(23,	112,	26317,	DEFAULT),
(24,	4118,	24472,	DEFAULT),
(25,	167,	31492,	2938),
(26,	4115,	50788,	673),
(27,	61,	53055,	3980),
(28,	1231,	53981,	DEFAULT),
(29,	28,	14744,	DEFAULT),
(30,	657,	39847,	2760),
(31,	3601,	21344,	DEFAULT),
(32,	4110,	43512,	DEFAULT),
(33,	1994,	5402,	DEFAULT),
(34,	4123,	57838,	DEFAULT),
(35,	855,	46206,	DEFAULT),
(36,	4141,	15601,	2460),
(37,	4147,	37250,	DEFAULT),
(38,	4112,	36549,	DEFAULT),
(39,	2697,	61633,	DEFAULT),
(40,	1293,	17969,	1703),
(41,	112,	23013,	DEFAULT),
(42,	4104,	58538,	DEFAULT),
(43,	2000,	130,	DEFAULT),
(44,	245,	52551,	DEFAULT),
(45,	4147,	44917,	DEFAULT),
(46,	167,	29791,	1890),
(47,	16,	4488,	DEFAULT),
(48,	1653,	14211,	DEFAULT),
(49,	4102,	42137,	DEFAULT),
(50,	4124,	21187,	DEFAULT),
(51,	167,	25940,	360),
(52,	1293,	26616,	639),
(53,	1027,	48748,	DEFAULT),
(54,	4128,	62481,	3703),
(55,	4132,	42155,	DEFAULT),
(56,	1118,	9535,	DEFAULT),
(57,	149,	59619,	1609),
(58,	3756,	35151,	DEFAULT),
(59,	4132,	40770,	DEFAULT),
(60,	2766,	13609,	DEFAULT),
(61,	4123,	50781,	DEFAULT),
(62,	4145,	7171,	DEFAULT),
(63,	291,	59669,	DEFAULT),
(64,	61,	27499,	898),
(65,	4102,	15303,	951),
(66,	16,	21736,	430),
(67,	539,	52123,	DEFAULT),
(68,	4139,	1729,	DEFAULT),
(69,	4139,	10490,	DEFAULT),
(70,	89,	55523,	1200),
(71,	2827,	27534,	DEFAULT),
(72,	2497,	60390,	DEFAULT),
(73,	855,	33861,	DEFAULT),
(74,	1423,	7510,	DEFAULT),
(75,	4115,	25968,	DEFAULT),
(76,	879,	51150,	DEFAULT),
(77,	684,	46100,	DEFAULT),
(78,	1423,	61052,	DEFAULT),
(79,	4124,	65192,	DEFAULT),
(80,	4119,	56369,	DEFAULT),
(81,	1293,	40571,	DEFAULT),
(82,	1027,	29886,	DEFAULT),
(83,	4122,	50543,	DEFAULT),
(84,	3617,	5832,	DEFAULT),
(85,	1449,	20228,	DEFAULT),
(86,	4109,	22543,	DEFAULT),
(87,	4115,	50451,	DEFAULT),
(88,	4100,	54915,	3731),
(89,	1647,	63355,	DEFAULT),
(90,	1449,	15705,	DEFAULT),
(91,	4110,	35160,	DEFAULT),
(92,	4139,	52497,	1914),
(93,	61,	9713,	DEFAULT),
(94,	2497,	21502,	DEFAULT),
(95,	1653,	27722,	DEFAULT),
(96,	4101,	28389,	DEFAULT),
(97,	4139,	47739,	3294),
(98,	4114,	15570,	DEFAULT),
(99,	2697,	47152,	DEFAULT),
(100,	4149,	11028,	DEFAULT);

INSERT INTO computers_details VALUES
(1,	15,	94),	(2,	10,	85),	(3,	15,	41),	(4,	1,	12),	(5,	4,	46),	(6,	1,	70),	(7,	1,	74),	(8,	10,	82),	(9,	14,	11),	(10,	2,	49),
(11,	6,	8),	(12,	17,	45),	(13,	5,	98),	(14,	7,	91),	(15,	18,	44),	(16,	10,	49),	(17,	13,	80),	(18,	7,	84),	(19,	10,	45),	(20,	2,	6),
(21,	1,	24),	(22,	15,	87),	(23,	15,	31),	(24,	20,	51),	(25,	7,	37),	(26,	12,	60),	(27,	7,	47),	(28,	11,	4),	(29,	9,	80),	(30,	1,	22),
(31,	9,	66),	(32,	12,	69),	(33,	1,	99),	(34,	18,	65),	(35,	5,	88),	(36,	12,	83),	(37,	17,	60),	(38,	20,	59),	(39,	4,	90),	(40,	7,	5),
(41,	14,	58),	(42,	20,	17),	(43,	9,	61),	(44,	16,	82),	(45,	10,	16),	(46,	9,	15),	(47,	9,	84),	(48,	6,	51),	(49,	11,	45),	(50,	12,	73),
(51,	3,	4),	(52,	4,	46),	(53,	13,	35),	(54,	3,	82),	(55,	3,	77),	(56,	16,	55),	(57,	10,	92),	(58,	8,	13),	(59,	6,	10),	(60,	1,	98),
(61,	2,	15),	(62,	19,	31),	(63,	20,	38),	(64,	19,	86),	(65,	12,	40),	(66,	11,	62),	(67,	8,	50),	(68,	16,	43),	(69,	15,	40),	(70,	7,	91),
(71,	14,	100),	(72,	19,	50),	(73,	12,	69),	(74,	15,	15),	(75,	3,	68),	(76,	10,	79),	(77,	6,	57),	(78,	10,	71),	(79,	14,	90),	(80,	1,	20),
(81,	17,	20),	(82,	4,	12),	(83,	17,	82),	(84,	10,	75),	(85,	8,	57),	(86,	12,	17),	(87,	11,	11),	(88,	4,	28),	(89,	7,	99),	(90,	20,	49),
(91,	11,	42),	(92,	10,	29),	(93,	11,	57),	(94,	20,	67),	(95,	10,	7),	(96,	1,	80),	(97,	12,	97),	(98,	7,	98),	(99,	18,	46),	(100,	2,	1),
(101,	1,	43),	(102,	12,	81),	(103,	16,	85),	(104,	13,	45),	(105,	10,	40),	(106,	3,	51),	(107,	16,	76),	(108,	20,	71),	(109,	8,	71),	(110,	3,	43),
(111,	4,	41),	(112,	2,	25),	(113,	19,	68),	(114,	5,	32),	(115,	19,	71),	(116,	17,	30),	(117,	20,	56),	(118,	3,	89),	(119,	1,	36),	(120,	9,	34),
(121,	17,	88),	(122,	1,	34),	(123,	17,	99),	(124,	1,	50),	(125,	14,	34),	(126,	19,	2),	(127,	19,	68),	(128,	16,	2),	(129,	17,	93),	(130,	9,	54),
(131,	16,	4),	(132,	19,	42),	(133,	13,	36),	(134,	11,	99),	(135,	19,	14),	(136,	14,	45),	(137,	16,	42),	(138,	16,	48),	(139,	10,	46),	(140,	10,	5),
(141,	14,	34),	(142,	8,	16),	(143,	18,	54),	(144,	17,	1),	(145,	13,	34),	(146,	19,	40),	(147,	2,	35),	(148,	6,	83),	(149,	9,	87),	(150,	10,	18),
(151,	3,	64),	(152,	1,	96),	(153,	19,	57),	(154,	19,	74),	(155,	19,	75),	(156,	8,	4),	(157,	18,	38),	(158,	14,	91),	(159,	15,	43),	(160,	4,	10),
(161,	15,	60),	(162,	5,	7),	(163,	10,	16),	(164,	18,	53),	(165,	18,	86),	(166,	8,	82),	(167,	4,	67),	(168,	13,	82),	(169,	5,	29),	(170,	7,	99),
(171,	19,	91),	(172,	17,	73),	(173,	10,	21),	(174,	15,	42),	(175,	9,	43),	(176,	20,	57),	(177,	12,	72),	(178,	8,	9),	(179,	11,	87),	(180,	18,	4),
(181,	6,	82),	(182,	12,	98),	(183,	8,	65),	(184,	20,	77),	(185,	13,	31),	(186,	11,	100),	(187,	9,	99),	(188,	16,	76),	(189,	20,	15),	(190,	7,	20),
(191,	8,	98),	(192,	6,	8),	(193,	19,	45),	(194,	3,	55),	(195,	19,	29),	(196,	9,	86),	(197,	5,	30),	(198,	8,	43),	(199,	7,	37),	(200,	3,	70),
(201,	12,	85),	(202,	9,	9),	(203,	19,	93),	(204,	20,	54),	(205,	16,	89),	(206,	19,	12),	(207,	8,	64),	(208,	10,	57),	(209,	8,	62),	(210,	10,	94),
(211,	8,	48),	(212,	11,	62),	(213,	10,	58),	(214,	19,	95),	(215,	3,	56),	(216,	16,	10),	(217,	20,	59),	(218,	2,	8),	(219,	8,	9),	(220,	13,	94),
(221,	1,	34),	(222,	10,	63),	(223,	13,	38),	(224,	16,	73),	(225,	6,	75),	(226,	12,	11),	(227,	10,	3),	(228,	16,	49),	(229,	3,	91),	(230,	8,	91),
(231,	12,	13),	(232,	3,	32),	(233,	16,	87),	(234,	16,	41),	(235,	10,	34),	(236,	12,	59),	(237,	4,	73),	(238,	11,	12),	(239,	8,	5),	(240,	9,	8),
(241,	4,	71),	(242,	19,	95),	(243,	12,	83),	(244,	20,	87),	(245,	17,	30),	(246,	9,	58),	(247,	13,	51),	(248,	8,	33),	(249,	20,	2),	(250,	12,	35),
(251,	13,	93),	(252,	7,	24),	(253,	16,	7),	(254,	4,	96),	(255,	12,	87),	(256,	1,	51),	(257,	1,	39),	(258,	12,	68),	(259,	5,	43),	(260,	10,	40),
(261,	2,	62),	(262,	1,	41),	(263,	12,	41),	(264,	5,	54),	(265,	18,	53),	(266,	10,	27),	(267,	18,	57),	(268,	5,	90),	(269,	4,	87),	(270,	10,	62),
(271,	17,	44),	(272,	13,	24),	(273,	18,	87),	(274,	10,	60),	(275,	16,	9),	(276,	11,	97),	(277,	7,	54),	(278,	9,	44),	(279,	5,	81),	(280,	17,	74),
(281,	1,	94),	(282,	16,	57),	(283,	14,	89),	(284,	6,	3),	(285,	9,	5),	(286,	18,	73),	(287,	8,	34),	(288,	18,	26),	(289,	16,	73),	(290,	14,	71),
(291,	11,	37),	(292,	2,	23),	(293,	7,	74),	(294,	16,	61),	(295,	9,	11),	(296,	18,	93),	(297,	13,	83),	(298,	15,	18),	(299,	14,	65),	(300,	9,	97),
(301,	1,	42),	(302,	9,	54),	(303,	8,	100),	(304,	16,	41),	(305,	19,	17),	(306,	1,	5),	(307,	4,	20),	(308,	8,	75),	(309,	18,	31),	(310,	17,	11),
(311,	13,	93),	(312,	3,	99),	(313,	20,	100),	(314,	7,	62),	(315,	3,	37),	(316,	11,	32),	(317,	12,	69),	(318,	15,	41),	(319,	11,	59),	(320,	8,	54),
(321,	1,	81),	(322,	11,	29),	(323,	15,	54),	(324,	6,	21),	(325,	13,	98),	(326,	9,	77),	(327,	13,	85),	(328,	3,	75),	(329,	2,	11),	(330,	16,	15),
(331,	2,	31),	(332,	2,	81),	(333,	14,	23),	(334,	20,	72),	(335,	12,	30),	(336,	12,	86),	(337,	13,	99),	(338,	11,	49),	(339,	17,	55),	(340,	11,	11),
(341,	16,	70),	(342,	19,	18),	(343,	7,	81),	(344,	18,	32),	(345,	14,	22),	(346,	4,	4),	(347,	5,	80),	(348,	11,	35),	(349,	14,	10),	(350,	19,	74),
(351,	6,	71),	(352,	6,	46),	(353,	13,	28),	(354,	7,	84),	(355,	9,	90),	(356,	16,	53),	(357,	17,	11),	(358,	1,	39),	(359,	15,	2),	(360,	10,	66),
(361,	16,	43),	(362,	7,	80),	(363,	13,	86),	(364,	2,	95),	(365,	18,	98),	(366,	19,	83),	(367,	20,	50),	(368,	17,	21),	(369,	7,	98),	(370,	19,	46),
(371,	16,	61),	(372,	7,	69),	(373,	17,	11),	(374,	6,	38),	(375,	19,	98),	(376,	6,	100),	(377,	5,	29),	(378,	11,	96),	(379,	4,	29),	(380,	17,	8),
(381,	1,	82),	(382,	16,	2),	(383,	4,	70),	(384,	10,	22),	(385,	6,	7),	(386,	1,	72),	(387,	8,	4),	(388,	1,	64),	(389,	14,	44),	(390,	7,	65),
(391,	13,	39),	(392,	14,	70),	(393,	1,	98),	(394,	14,	27),	(395,	14,	65),	(396,	14,	71),	(397,	20,	80),	(398,	10,	13),	(399,	6,	28),	(400,	5,	8),
(401,	8,	32),	(402,	12,	27),	(403,	17,	98),	(404,	13,	34),	(405,	11,	14),	(406,	18,	32),	(407,	16,	69),	(408,	17,	17),	(409,	5,	5),	(410,	10,	31),
(411,	5,	83),	(412,	19,	80),	(413,	1,	79),	(414,	10,	3),	(415,	3,	96),	(416,	4,	49),	(417,	5,	68),	(418,	8,	27),	(419,	20,	60),	(420,	16,	7),
(421,	10,	57),	(422,	15,	73),	(423,	5,	50),	(424,	11,	8),	(425,	10,	19),	(426,	20,	73),	(427,	18,	17),	(428,	2,	27),	(429,	4,	26),	(430,	7,	85),
(431,	12,	64),	(432,	11,	64),	(433,	5,	50),	(434,	19,	29),	(435,	7,	81),	(436,	20,	96),	(437,	2,	76),	(438,	7,	88),	(439,	14,	63),	(440,	15,	1),
(441,	2,	68),	(442,	16,	55),	(443,	11,	89),	(444,	3,	44),	(445,	15,	91),	(446,	1,	77),	(447,	5,	52),	(448,	4,	9),	(449,	16,	56),	(450,	9,	99),
(451,	3,	36),	(452,	8,	20),	(453,	10,	21),	(454,	18,	82),	(455,	9,	5),	(456,	14,	6),	(457,	4,	77),	(458,	17,	62),	(459,	1,	18),	(460,	18,	82),
(461,	17,	56),	(462,	16,	48),	(463,	15,	98),	(464,	8,	29),	(465,	15,	29),	(466,	1,	46),	(467,	19,	52),	(468,	2,	22),	(469,	1,	33),	(470,	20,	93),
(471,	5,	50),	(472,	15,	39),	(473,	18,	20),	(474,	2,	84),	(475,	3,	58),	(476,	14,	10),	(477,	7,	60),	(478,	12,	61),	(479,	18,	58),	(480,	18,	46),
(481,	5,	3),	(482,	5,	76),	(483,	5,	57),	(484,	8,	48),	(485,	11,	76),	(486,	1,	57),	(487,	5,	53),	(488,	17,	10),	(489,	18,	26),	(490,	15,	31),
(491,	13,	27),	(492,	13,	46),	(493,	8,	72),	(494,	16,	59),	(495,	13,	40),	(496,	2,	28),	(497,	3,	87),	(498,	18,	26),	(499,	1,	86),	(500,	15,	84);

UPDATE computers SET accepted_at = '2012-11-05 17:52:17.873655' WHERE id IN (3, 4, 5, 6, 24, 29, 30, 31, 32, 35, 36, 38, 39, 40, 42, 46, 49, 51, 54, 59, 62, 68, 69, 71, 78, 84, 89, 90, 91, 95);
UPDATE computers SET deleted_at  = '2012-09-20 13:19:47.625728' WHERE id IN (1, 8, 9, 10, 13, 19);
UPDATE details SET accepted_at = '2012-01-26 08:22:45.977218' WHERE id IN (4, 8, 9, 14, 21, 25, 28, 30, 32, 36, 37, 39, 41, 44, 46, 48, 50, 51, 52, 57, 59, 63, 67, 69, 70, 72, 73, 75, 76, 77, 79, 85, 86, 88, 89, 91, 92, 93, 95, 97, 99);
UPDATE details SET deleted_at = '2012-10-02 14:02:55.546286' WHERE id IN (4, 7, 12, 15, 16, 18, 20, 27, 28, 31, 34, 36, 39, 40, 49, 55, 56, 57, 61, 63, 64, 67, 69, 70, 72, 73, 74, 77, 79, 86, 88, 89, 92, 93, 95, 96, 97, 100);
UPDATE computers_details SET deleted_at = '2012-12-19 06:46:39.181696' WHERE id IN (2, 6, 7, 11, 15, 17, 18, 33, 34, 35, 38, 39, 41, 44, 46, 49, 51, 53, 54, 56, 59, 61, 62, 63, 64, 65, 67, 68, 69, 73, 76, 77, 79, 81, 82, 86, 87, 88, 90, 91, 92, 94, 96, 97, 98, 100, 107, 108, 110, 111, 112, 114, 120, 123, 124, 127, 128, 134, 136, 141, 142, 143, 146, 151, 153, 155, 158, 160, 163, 165, 166, 167, 169, 175, 176, 177, 181, 187, 193, 195, 196, 200, 207, 208, 211, 214, 215, 216, 218, 223, 225, 226, 228, 230, 231, 232, 236, 237, 238, 244, 245, 251, 254, 258, 259, 267, 268, 269, 272, 273, 275, 276, 277, 279, 280, 281, 284, 287, 289, 290, 295, 298, 300, 301, 303, 306, 307, 310, 311, 314, 316, 318, 319, 320, 321, 324, 325, 326, 327, 332, 333, 335, 339, 342, 343, 346, 347, 348, 362, 367, 369, 371, 373, 375, 376, 377, 380, 381, 384, 388, 395, 396, 398, 401, 402, 405, 406, 407, 408, 409, 410, 411, 412, 415, 416, 418, 419, 421, 424, 426, 429, 431, 432, 434, 435, 437, 438, 439, 441, 442, 446, 447, 449, 451, 452, 456, 457, 461, 462, 467, 468, 469, 471, 472, 478, 481, 487, 492, 494, 496, 498, 500);
UPDATE computers_details SET accepted_at = '2012-12-04 11:04:13.14438' WHERE id IN (2, 3, 4, 5, 6, 9, 12, 14, 16, 19, 20, 21, 24, 27, 29, 30, 31, 32, 37, 40, 44, 48, 56, 59, 61, 62, 64, 69, 72, 73, 74, 75, 83, 87, 89, 91, 92, 93, 95, 97, 99, 102, 103, 111, 114, 115, 117, 118, 119, 121, 122, 123, 129, 134, 135, 137, 138, 139, 144, 149, 152, 154, 156, 157, 159, 162, 165, 167, 168, 170, 171, 178, 180, 181, 182, 187, 189, 192, 194, 196, 199, 202, 205, 206, 207, 214, 215, 217, 218, 221, 222, 226, 230, 245, 247, 248, 251, 252, 259, 260, 262, 263, 264, 266, 270, 272, 273, 274, 279, 282, 283, 289, 303, 304, 312, 316, 322, 327, 329, 332, 333, 336, 338, 339, 341, 342, 344, 345, 349, 350, 351, 352, 355, 356, 357, 358, 361, 364, 365, 366, 367, 370, 371, 372, 377, 378, 381, 383, 385, 387, 390, 391, 395, 397, 398, 403, 405, 408, 413, 416, 417, 421, 422, 424, 425, 427, 433, 435, 438, 439, 440, 448, 449, 450, 451, 454, 459, 464, 465, 472, 493, 499, 500);