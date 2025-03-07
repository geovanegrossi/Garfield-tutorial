//------------------------------------------------------------------------------------------------------------------
// 	Arquivo de geometria de Thick-Gems criadas por Geovane Grossi Araujo de Souza - HEPIC USP Esse arquivo especificamente é ideal 
//      para visualizar vetores de campo
//	
//	Nesse arquivo é possivel trocar alguns dos valores referêntes a geometria do detector
//	Não é necessario fazer todas as definições pelo arquivo de texto, a interface gráfica também foi utilizada
//	Pontos são declarados com 4 entradas r=(x,y,z,ref) 

ref= 8; // Essa grandeza diz respeito ao refinamento da mesh que será gerada. Quando menor o valor de ref maior o refinamento

R_c=35; //Raio do buraco do cobre 

R_d=25; //Raio do buraco no centro do dieletrico

E_c=5; //Espessura da camada de cobre

E_d=50;	//Espessura do total do dieletrico

a=140;	//Comprimento do vetor que liga o centro de 2 buracos

x=70;	//Componente horizontal da distancia entre 2 buracos. Definido para assimetrias

h=Sqrt((a*a)-(x*x)); //Componente vertical da distancia entre 2 buracos. Definido para assimetrias

Z_k=0; //origem do sistema no eixo z

Z_c=500; //Distancia do catodo (cede elétrons) ao topo do cobre

Z_a=-1000; //Distancia do anodo (recebe elétrons) ao cobre de baixo

//-------Z_k-----------------------------------------------------------------------------------------------
Point(101) = {0, 0, Z_k, ref};
Point(102) = {0, R_d, Z_k, ref};
Point(103) = {0, h, Z_k, ref};
Point(104) = {-x+R_d, h, Z_k, ref};
Point(105) = {-x, h, Z_k, ref};
Point(106) = {-x, h-R_d, Z_k, ref};
Point(107) = {-x, 0, Z_k, ref};
Point(108) = {-R_d, 0, Z_k, ref};


//-------Z_k+E_d/2-----------------------------------------------------------------------------------------------
Point(201) = {0, 0, Z_k+E_d/2, ref};
Point(202) = {0, R_c, Z_k+E_d/2, ref};
Point(203) = {0, h, Z_k+E_d/2, ref};
Point(204) = {-x+R_c, h, Z_k+E_d/2, ref};
Point(205) = {-x, h, Z_k+E_d/2, ref};
Point(206) = {-x, h-R_c, Z_k+E_d/2, ref};
Point(207) = {-x, 0, Z_k+E_d/2, ref};
Point(208) = {-R_c, 0, Z_k+E_d/2, ref};

//-------Z_k-E_d/2-----------------------------------------------------------------------------------------------
Point(301) = {0, 0, Z_k-E_d/2, ref};
Point(302) = {0, R_c, Z_k-E_d/2, ref};
Point(303) = {0, h, Z_k-E_d/2, ref};
Point(304) = {-x+R_c, h, Z_k-E_d/2, ref};
Point(305) = {-x, h, Z_k-E_d/2, ref};
Point(306) = {-x, h-R_c, Z_k-E_d/2, ref};
Point(307) = {-x, 0, Z_k-E_d/2, ref};
Point(308) = {-R_c, 0, Z_k-E_d/2, ref};

//-------Z_k+E_d/2+E_c-----------------------------------------------------------------------------------------------
Point(401) = {0, 0, Z_k+E_d/2+E_c, ref};
Point(402) = {0, R_c, Z_k+E_d/2+E_c, ref};
Point(403) = {0, h, Z_k+E_d/2+E_c, ref};
Point(404) = {-x+R_c, h, Z_k+E_d/2+E_c, ref};
Point(405) = {-x, h, Z_k+E_d/2+E_c, ref};
Point(406) = {-x, h-R_c, Z_k+E_d/2+E_c, ref};
Point(407) = {-x, 0, Z_k+E_d/2+E_c, ref};
Point(408) = {-R_c, 0, Z_k+E_d/2+E_c, ref};

//-------Z_k-E_d/2-E_c-----------------------------------------------------------------------------------------------
Point(501) = {0, 0, Z_k-E_d/2-E_c, ref};
Point(502) = {0, R_c, Z_k-E_d/2-E_c, ref};
Point(503) = {0, h, Z_k-E_d/2-E_c, ref};
Point(504) = {-x+R_c, h, Z_k-E_d/2-E_c, ref};
Point(505) = {-x, h, Z_k-E_d/2-E_c, ref};
Point(506) = {-x, h-R_c, Z_k-E_d/2-E_c, ref};
Point(507) = {-x, 0, Z_k-E_d/2-E_c, ref};
Point(508) = {-R_c, 0, Z_k-E_d/2-E_c, ref};

//-------Z_c+E_d/2+E_c-----------------------------------------------------------------------------------------------
Point(601) = {0, 0, Z_c+E_d/2+E_c, ref};
Point(603) = {0, h, Z_c+E_d/2+E_c, ref};
Point(605) = {-x, h, Z_c+E_d/2+E_c, ref};
Point(607) = {-x, 0, Z_c+E_d/2+E_c, ref};


//-------Z_a-E_d/2-E_c-----------------------------------------------------------------------------------------------
Point(701) = {0, 0, Z_a-E_d/2-E_c, ref};
Point(703) = {0, h, Z_a-E_d/2-E_c, ref};
Point(705) = {-x, h, Z_a-E_d/2-E_c, ref};
Point(707) = {-x, 0, Z_a-E_d/2-E_c, ref};


//+
Line(1) = {605, 603};
//+
Line(2) = {603, 601};
//+
Line(3) = {601, 607};
//+
Line(4) = {607, 605};
//+
Line(5) = {405, 404};
//+
Line(6) = {404, 403};
//+
Line(7) = {403, 402};
//+
Line(8) = {402, 401};
//+
Line(9) = {401, 408};
//+
Line(10) = {408, 407};
//+
Line(11) = {407, 406};
//+
Line(12) = {406, 405};
//+
Line(13) = {205, 204};
//+
Line(14) = {204, 203};
//+
Line(15) = {203, 202};
//+
Line(16) = {202, 201};
//+
Line(17) = {201, 208};
//+
Line(18) = {208, 207};
//+
Line(19) = {207, 206};
//+
Line(20) = {206, 205};
//+
Line(21) = {103, 102};
//+
Line(22) = {102, 101};
//+
Line(23) = {101, 108};
//+
Line(24) = {108, 107};
//+
Line(25) = {107, 106};
//+
Line(26) = {106, 105};
//+
Line(27) = {105, 104};
//+
Line(28) = {104, 103};
//+
Line(29) = {305, 304};
//+
Line(30) = {304, 303};
//+
Line(31) = {303, 302};
//+
Line(32) = {302, 301};
//+
Line(33) = {301, 308};
//+
Line(34) = {308, 307};
//+
Line(35) = {307, 306};
//+
Line(36) = {306, 305};
//+
Line(37) = {505, 504};
//+
Line(38) = {504, 503};
//+
Line(39) = {503, 502};
//+
Line(40) = {502, 501};
//+
Line(41) = {501, 508};
//+
Line(42) = {508, 507};
//+
Line(43) = {507, 506};
//+
Line(44) = {506, 505};
//+
Line(45) = {705, 703};
//+
Line(46) = {703, 701};
//+
Line(47) = {701, 707};
//+
Line(48) = {707, 705};
//+
Line(49) = {607, 407};
//+
Line(50) = {407, 207};
//+
Line(51) = {207, 107};
//+
Line(52) = {107, 307};
//+
Line(53) = {307, 507};
//+
Line(54) = {507, 707};
//+
Line(55) = {701, 501};
//+
Line(56) = {301, 501};
//+
Line(57) = {101, 301};
//+
Line(58) = {201, 101};
//+
Line(59) = {401, 201};
//+
Line(60) = {401, 601};
//+
Line(61) = {603, 403};
//+
Line(62) = {403, 203};
//+
Line(63) = {203, 103};
//+
Line(64) = {103, 303};
//+
Line(65) = {303, 503};
//+
Line(66) = {503, 703};
//+
Line(67) = {705, 505};
//+
Line(68) = {505, 305};
//+
Line(69) = {305, 105};
//+
Line(70) = {105, 205};
//+
Line(71) = {205, 405};
//+
Line(72) = {405, 605};
//+
Circle(73) = {402, 401, 408};
//+
Circle(74) = {202, 201, 208};
//+
Circle(75) = {102, 101, 108};
//+
Circle(76) = {302, 301, 308};
//+
Circle(77) = {502, 501, 508};
//+
Circle(78) = {404, 405, 406};
//+
Circle(79) = {204, 205, 206};
//+
Circle(80) = {104, 105, 106};
//+
Circle(81) = {304, 305, 306};
//+
Circle(82) = {504, 505, 506};
//+
Line(83) = {408, 208};
//+
Line(84) = {402, 202};
//+
Line(85) = {404, 204};
//+
Line(86) = {308, 508};
//+
Line(87) = {302, 502};
//+
Line(88) = {204, 104};
//+
Line(89) = {206, 106};
//+
Line(90) = {106, 306};
//+
Line(91) = {304, 104};
//+
Line(92) = {406, 206};
//+
Line(93) = {306, 506};
//+
Line(94) = {304, 504};
//+
Line(95) = {208, 108};
//+
Line(96) = {202, 102};
//+
Line(97) = {108, 308};
//+
Line(98) = {102, 302};
//+
Curve Loop(1) = {79, 89, -80, -88};
//+
Surface(1) = {1};
//+
Curve Loop(2) = {95, -75, -96, 74};
//+
Surface(2) = {2};
//+
Curve Loop(3) = {98, 76, -97, -75};
//+
Surface(3) = {3};
//+
Curve Loop(4) = {80, 90, -81, 91};
//+
Surface(4) = {4};
//+
Curve Loop(5) = {92, -79, -85, 78};
//+
Surface(5) = {5};
//+
Curve Loop(6) = {94, 82, -93, -81};
//+
Surface(6) = {6};
//+
Curve Loop(7) = {76, 86, -77, -87};
//+
Surface(7) = {7};
//+
Curve Loop(8) = {83, -74, -84, 73};
//+
Surface(8) = {8};
//+
//+
Curve Loop(9) = {11, 92, -19, -50};
//+
Plane Surface(9) = {9};
//+
Curve Loop(11) = {12, -71, -20, -92};
//+
Plane Surface(11) = {11};
//+
Curve Loop(12) = {71, 5, 85, -13};
//+
Plane Surface(12) = {12};
//+
Curve Loop(13) = {85, 14, -62, -6};
//+
Plane Surface(13) = {13};
//+
Curve Loop(14) = {62, 15, -84, -7};
//+
Plane Surface(14) = {14};
//+
Curve Loop(15) = {84, 16, -59, -8};
//+
Plane Surface(15) = {15};
//+
Curve Loop(16) = {95, -23, -58, 17};
//+
Plane Surface(16) = {16};
//+
Curve Loop(17) = {58, -22, -96, 16};
//+
Plane Surface(17) = {17};
//+
Curve Loop(18) = {57, 33, -97, -23};
//+
Plane Surface(18) = {18};
//+
Curve Loop(19) = {57, -32, -98, 22};
//+
Plane Surface(19) = {19};
//+
Curve Loop(20) = {87, 40, -56, -32};
//+
Plane Surface(20) = {20};
//+
Curve Loop(21) = {56, 41, -86, -33};
//+
Plane Surface(21) = {21};
//+
Curve Loop(22) = {86, 42, -53, -34};
//+
Plane Surface(22) = {22};
//+
Curve Loop(23) = {53, 43, -93, -35};
//+
Plane Surface(23) = {23};
//+
Curve Loop(24) = {93, 44, 68, -36};
//+
Plane Surface(24) = {24};
//+
Curve Loop(25) = {90, 36, 69, -26};
//+
Plane Surface(25) = {25};
//+
Curve Loop(26) = {20, -70, -26, -89};
//+
Plane Surface(26) = {26};
//+
Curve Loop(27) = {13, 88, -27, 70};
//+
Plane Surface(27) = {27};
//+
Curve Loop(28) = {27, -91, -29, 69};
//+
Plane Surface(28) = {28};
//+
Curve Loop(29) = {94, -37, 68, 29};
//+
Plane Surface(29) = {29};
//+
Curve Loop(30) = {94, 38, -65, -30};
//+
Plane Surface(30) = {30};
//+
Curve Loop(31) = {91, 28, 64, -30};
//+
Plane Surface(31) = {31};
//+
Curve Loop(32) = {88, 28, -63, -14};
//+
Plane Surface(32) = {32};
//+
Curve Loop(33) = {64, 31, -98, -21};
//+
Plane Surface(33) = {33};
//+
Curve Loop(34) = {63, 21, -96, -15};
//+
Plane Surface(34) = {34};
//+
Curve Loop(35) = {97, 34, -52, -24};
//+
Plane Surface(35) = {35};
//+
Curve Loop(36) = {95, 24, -51, -18};
//+
Plane Surface(36) = {36};
//+
Curve Loop(37) = {51, 25, -89, -19};
//+
Plane Surface(37) = {37};
//+
Curve Loop(38) = {52, 35, -90, -25};
//+
Plane Surface(38) = {38};
//+
Curve Loop(39) = {38, 39, 77, 42, 43, -82};
//+
Plane Surface(39) = {39};
//+
Curve Loop(40) = {30, 31, 76, 34, 35, -81};
//+
Plane Surface(40) = {40};
//+
Curve Loop(41) = {6, 7, 73, 10, 11, -78};
//+
Plane Surface(41) = {41};
//+
Curve Loop(42) = {15, 74, 18, 19, -79, 14};
//+
Plane Surface(42) = {42};
//+
Curve Loop(43) = {65, 39, -87, -31};
//+
Plane Surface(43) = {43};
//+
Curve Loop(44) = {3, 4, 1, 2};
//+
Plane Surface(44) = {44};
//+
Curve Loop(45) = {2, -60, -8, -7, -61};
//+
Plane Surface(45) = {45};
//+
Curve Loop(46) = {5, 6, -61, -1, -72};
//+
Plane Surface(46) = {46};
//+
Curve Loop(47) = {12, 72, -4, 49, 11};
//+
Plane Surface(47) = {47};
//+
Curve Loop(48) = {10, -49, -3, -60, 9};
//+
Plane Surface(48) = {48};
//+
Curve Loop(49) = {39, 40, -55, -46, -66};
//+
Plane Surface(49) = {49};
//+
Curve Loop(50) = {45, -66, -38, -37, -67};
//+
Plane Surface(50) = {50};
//+
Curve Loop(51) = {44, -67, -48, -54, 43};
//+
Plane Surface(51) = {51};
//+
Curve Loop(52) = {47, -54, -42, -41, -55};
//+
Plane Surface(52) = {52};
//+
Curve Loop(53) = {45, 46, 47, 48};
//+
Plane Surface(53) = {53};
//+
Curve Loop(54) = {50, -18, -83, 10};
//+
Plane Surface(54) = {54};
//+
Curve Loop(55) = {83, -17, -59, 9};
//+
Plane Surface(55) = {55};
//+
Surface Loop(1) = {47, 11, 12, 46, 45, 44, 48, 55, 16, 18, 19, 20, 49, 52, 53, 50, 29, 24, 51, 25, 28, 27, 26, 21, 17, 15, 8, 41, 5, 2, 3, 1, 4, 6, 39, 7};

//Volumes--------------------------------------------------------------------------------------------------------

Volume(1) = {1};
//+
Surface Loop(2) = {41, 8, 5, 14, 13, 42, 9, 54};
//+
Volume(2) = {2};
//+
Surface Loop(3) = {40, 23, 22, 6, 39, 7, 43, 30};
//+
Volume(3) = {3};
//+
Surface Loop(4) = {1, 4, 2, 3, 40, 35, 38, 37, 36, 42, 34, 32, 31, 33};
//+
Volume(4) = {4};

//Surfaces--------------------------------------------------------------------------------------------------------

Physical Surface(1) = {44}; //Catodo
//+
Physical Surface(2) = {8, 41, 5}; //Top
//+
Physical Surface(3) = {7, 39, 6}; //Bottom
//+
Physical Surface(4) = {53}; //Anodo
//+
Physical Volume(1) = {1};
//+
Physical Volume(2) = {2};
//+
Physical Volume(3) = {3};
//+
Physical Volume(4) = {4};
