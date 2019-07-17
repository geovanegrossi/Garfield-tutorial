//------------------------------------------------------------------------------------------------------------------
// 	GEM geometry file created by Geovane Grossi - High Energy Physics and Instrumentation Center IFUSP
//	In this unitary cell, we are not using the standard hexagonal pattern of holes.
//	All the lengths are given in microns.
//------------------------------------------------------------------------------------------------------------------	

ref= 5; // Mesh refinement number

R_c=35; //Cooper hole radius

R_d=25; //Dielectric hole radius

E_c=5; //Cooper thickness 

E_d=50;	//Dielectric thickness

a=140;	//Pitch

Z_c=500; //Drift Region thickness

Z_a=-500; //Induction Region thickness

//------------------------------------------------------------------------------------------------------

Point(1) = {0, 0, 0, ref};
Point(2) = {0, R_d, 0, ref};
Point(3) = {R_d, 0, 0, ref};
Point(4) = {-R_d, 0, 0, ref};
Point(5) = {0, -R_d, 0, ref};
Point(6) = {a/2, a/2, 0, ref};
Point(7) = {-a/2, a/2, 0, ref};
Point(8) = {-a/2, -a/2, 0, ref};
Point(9) = {a/2, -a/2, 0, ref};

//------------------------------------------------------------------------------------------------------

Point(11) = {0, 0, E_d/2, ref};
Point(12) = {0, R_c, E_d/2, ref};
Point(13) = {R_c, 0, E_d/2, ref};
Point(14) = {-R_c, 0, E_d/2, ref};
Point(15) = {0, -R_c, E_d/2, ref};
Point(16) = {a/2, a/2, E_d/2, ref};
Point(17) = {-a/2, a/2, E_d/2, ref};
Point(18) = {-a/2, -a/2, E_d/2, ref};
Point(19) = {a/2, -a/2, E_d/2, ref};

//------------------------------------------------------------------------------------------------------

Point(21) = {0, 0, -E_d/2, ref};
Point(22) = {0, R_c, -E_d/2, ref};
Point(23) = {R_c, 0, -E_d/2, ref};
Point(24) = {-R_c, 0, -E_d/2, ref};
Point(25) = {0, -R_c, -E_d/2, ref};
Point(26) = {a/2, a/2, -E_d/2, ref};
Point(27) = {-a/2, a/2, -E_d/2, ref};
Point(28) = {-a/2, -a/2, -E_d/2, ref};
Point(29) = {a/2, -a/2, -E_d/2, ref};

//------------------------------------------------------------------------------------------------------

Point(31) = {0, 0, E_d/2, ref};
Point(32) = {0, R_c, E_d/2, ref};
Point(33) = {R_c, 0, E_d/2, ref};
Point(34) = {-R_c, 0, E_d/2, ref};
Point(35) = {0, -R_c, E_d/2, ref};
Point(36) = {a/2, a/2, E_d/2, ref};
Point(37) = {-a/2, a/2, E_d/2, ref};
Point(38) = {-a/2, -a/2, E_d/2, ref};
Point(39) = {a/2, -a/2, E_d/2, ref};

//------------------------------------------------------------------------------------------------------

Point(41) = {0, 0, E_d/2+E_c, ref};
Point(42) = {0, R_c, E_d/2+E_c, ref};
Point(43) = {R_c, 0, E_d/2+E_c, ref};
Point(44) = {-R_c, 0, E_d/2+E_c, ref};
Point(45) = {0, -R_c, E_d/2+E_c, ref};
Point(46) = {a/2, a/2, E_d/2+E_c, ref};
Point(47) = {-a/2, a/2, E_d/2+E_c, ref};
Point(48) = {-a/2, -a/2, E_d/2+E_c, ref};
Point(49) = {a/2, -a/2, E_d/2+E_c, ref};

//------------------------------------------------------------------------------------------------------

Point(51) = {0, 0, -E_d/2+E_c, ref};
Point(52) = {0, R_c, -E_d/2+E_c, ref};
Point(53) = {R_c, 0, -E_d/2+E_c, ref};
Point(54) = {-R_c, 0, -E_d/2+E_c, ref};
Point(55) = {0, -R_c, -E_d/2+E_c, ref};
Point(56) = {a/2, a/2, -E_d/2+E_c, ref};
Point(57) = {-a/2, a/2, -E_d/2+E_c, ref};
Point(58) = {-a/2, -a/2, -E_d/2+E_c, ref};
Point(59) = {a/2, -a/2, -E_d/2+E_c, ref};

//------------------------------------------------------------------------------------------------------

Point(61) = {a/2, a/2, Z_c, ref};
Point(62) = {a/2, -a/2, Z_c, ref};
Point(63) = {-a/2, a/2, Z_c, ref};
Point(64) = {-a/2, -a/2, Z_c, ref};

Point(65) = {a/2, a/2, Z_a, ref};
Point(66) = {a/2, -a/2, Z_a, ref};
Point(67) = {-a/2, a/2, Z_a, ref};
Point(68) = {-a/2, -a/2, Z_a, ref};

//--------------------------generating the lines--------------------------------------------------------

Line(1) = {63, 61};
Line(2) = {61, 62};
Line(3) = {62, 64};
Line(4) = {64, 63};
Line(5) = {47, 46};
Line(6) = {46, 49};
Line(7) = {49, 48};
Line(8) = {48, 47};
Line(9) = {17, 16};
Line(10) = {16, 19};
Line(11) = {19, 18};
Line(12) = {18, 17};
Line(13) = {7, 6};
Line(14) = {6, 9};
Line(15) = {9, 8};
Line(16) = {8, 7};
Line(17) = {57, 56};
Line(18) = {56, 59};
Line(19) = {59, 58};
Line(20) = {58, 57};
Line(21) = {27, 26};
Line(22) = {26, 29};
Line(23) = {29, 28};
Line(24) = {28, 27};
Line(25) = {67, 68};
Line(26) = {68, 66};
Line(27) = {66, 65};
Line(28) = {65, 67};
Circle(29) = {42, 41, 43};
Circle(30) = {43, 41, 45};
Circle(31) = {45, 41, 44};
Circle(32) = {44, 41, 42};
Circle(33) = {12, 11, 13};
Circle(34) = {13, 11, 15};
Circle(35) = {15, 11, 14};
Circle(36) = {14, 11, 12};
Circle(37) = {2, 1, 3};
Circle(38) = {3, 1, 5};
Circle(39) = {5, 1, 4};
Circle(40) = {4, 1, 2};
Circle(41) = {55, 51, 53};
Circle(42) = {53, 51, 52};
Circle(43) = {52, 51, 54};
Circle(44) = {54, 51, 55};
Circle(45) = {22, 21, 23};
Circle(46) = {23, 21, 25};
Circle(47) = {25, 21, 24};
Circle(48) = {24, 21, 22};
Line(49) = {61, 46};
Line(50) = {46, 16};
Line(51) = {16, 6};
Line(52) = {6, 56};
Line(53) = {56, 26};
Line(54) = {26, 65};
Line(55) = {63, 47};
Line(56) = {47, 17};
Line(57) = {17, 7};
Line(58) = {7, 57};
Line(59) = {57, 27};
Line(60) = {27, 67};
Line(61) = {68, 28};
Line(62) = {28, 58};
Line(63) = {58, 8};
Line(64) = {8, 18};
Line(65) = {18, 48};
Line(66) = {48, 64};
Line(67) = {62, 49};
Line(68) = {49, 19};
Line(69) = {19, 9};
Line(70) = {9, 59};
Line(71) = {59, 29};
Line(72) = {29, 66};
Line(73) = {45, 15};
Line(74) = {15, 5};
Line(75) = {5, 55};
Line(76) = {42, 12};
Line(77) = {12, 2};
Line(78) = {2, 52};
Line(79) = {52, 22};
Line(80) = {24, 54};
Line(81) = {54, 4};
Line(82) = {4, 14};
Line(83) = {14, 44};
Line(84) = {55, 25};
Line(85) = {43, 13};
Line(86) = {13, 3};
Line(87) = {3, 53};
Line(88) = {53, 23};

//--------------------------generating the surfaces-----------------------------------------------------

Line Loop(89) = {3, 4, 1, 2};
//+
Plane Surface(90) = {89};
//+
Line Loop(91) = {5, -49, -1, 55};
//+
Plane Surface(92) = {91};
//+
Line Loop(93) = {4, 55, -8, 66};
//+
Plane Surface(94) = {93};
//+
Line Loop(95) = {7, 66, -3, 67};
//+
Plane Surface(95) = {95};
//+
Line Loop(96) = {6, -67, -2, 49};
//+
Plane Surface(96) = {96};
//+
Line Loop(97) = {5, 6, 7, 8};
//+
Line Loop(98) = {30, 31, 32, 29};
//+
Plane Surface(97) = {97, 98};
//+
Line Loop(99) = {33, 34, 35, 36};
//+
Line Loop(100) = {11, 12, 9, 10};
//+
Plane Surface(98) = {99, 100};
//+
Line Loop(101) = {6, 68, -10, -50};
//+
Plane Surface(99) = {101};
//+
Line Loop(102) = {56, 9, -50, -5};
//+
Plane Surface(100) = {102};
//+
Line Loop(103) = {56, -12, 65, 8};
//+
Plane Surface(101) = {103};
//+
Line Loop(104) = {65, -7, 68, 11};
//+
Plane Surface(102) = {104};
//+
Line Loop(105) = {42, 43, 44, 41};
//+
Line Loop(106) = {18, 19, 20, 17};
//+
Plane Surface(103) = {105, 106};
//+
Line Loop(107) = {46, 47, 48, 45};
//+
Line Loop(108) = {21, 22, 23, 24};
//+
Plane Surface(104) = {107, 108};
//+
Line Loop(109) = {62, -19, 71, 23};
//+
Plane Surface(105) = {109};
//+
Line Loop(110) = {71, -22, -53, 18};
//+
Plane Surface(106) = {110};
//+
Line Loop(111) = {53, -21, -59, 17};
//+
Plane Surface(107) = {111};
//+
Line Loop(112) = {51, 14, -69, -10};
//+
Plane Surface(108) = {112};
//+
Line Loop(113) = {61, -23, 72, -26};
//+
Plane Surface(109) = {113};
//+
Line Loop(114) = {25, 61, 24, 60};
//+
Plane Surface(110) = {114};
//+
Line Loop(115) = {60, -28, -54, -21};
//+
Plane Surface(111) = {115};
//+
Line Loop(116) = {72, 27, -54, 22};
//+
Plane Surface(112) = {116};
//+
Line Loop(117) = {27, 28, 25, 26};
//+
Plane Surface(113) = {117};
//+
Line Loop(118) = {14, 70, -18, -52};
//+
Plane Surface(114) = {118};
//+
Line Loop(119) = {15, -63, -19, -70};
//+
Plane Surface(115) = {119};
//+
Line Loop(120) = {63, 16, 58, -20};
//+
Plane Surface(116) = {120};
//+
Line Loop(121) = {57, -16, 64, 12};
//+
Plane Surface(117) = {121};
//+
Line Loop(122) = {20, 59, -24, 62};
//+
Plane Surface(118) = {122};
//+
Line Loop(123) = {57, 13, -51, -9};
//+
Plane Surface(119) = {123};
//+
Line Loop(124) = {13, 52, -17, -58};
//+
Plane Surface(120) = {124};
//+
Line Loop(125) = {11, -64, -15, -69};
//+
Plane Surface(121) = {125};
//+
Line Loop(126) = {32, 76, -36, 83};
//+
Ruled Surface(122) = {126};
//+
Line Loop(127) = {76, 33, -85, -29};
//+
Ruled Surface(123) = {127};
//+
Line Loop(128) = {83, -31, 73, 35};
//+
Ruled Surface(124) = {128};
//+
Line Loop(129) = {73, -34, -85, 30};
//+
Ruled Surface(125) = {129};
//+
Line Loop(130) = {86, 38, -74, -34};
//+
Ruled Surface(126) = {130};
//+
Line Loop(131) = {35, -82, -39, -74};
//+
Ruled Surface(127) = {131};
//+
Line Loop(132) = {82, 36, 77, -40};
//+
Ruled Surface(128) = {132};
//+
Line Loop(133) = {77, 37, -86, -33};
//+
Ruled Surface(129) = {133};
//+
Line Loop(134) = {39, -81, 44, -75};
//+
Ruled Surface(130) = {134};
//+
Line Loop(135) = {40, 78, 43, 81};
//+
Ruled Surface(131) = {135};
//+
Line Loop(136) = {37, 87, 42, -78};
//+
Ruled Surface(132) = {136};
//+
Line Loop(137) = {38, 75, 41, -87};
//+
Ruled Surface(133) = {137};
//+
Line Loop(138) = {41, 88, 46, -84};
//+
Ruled Surface(134) = {138};
//+
Line Loop(139) = {44, 84, 47, 80};
//+
Ruled Surface(135) = {139};
//+
Line Loop(140) = {80, -43, 79, -48};
//+
Ruled Surface(136) = {140};
//+
Line Loop(141) = {88, -45, -79, -42};
//+
Ruled Surface(137) = {141};
//+
Surface Loop(1) = {92, 96, 95, 94, 90, 97, 123, 122, 124, 125, 129, 128, 127, 130, 131, 132, 133, 126, 113, 112, 109, 110, 111, 104, 134, 137, 136, 135};
//+
//-------------------------------generating volumes -----------------------------------------------------------------------------

Volume(1) = {1}; //Gas volume
//+
Surface Loop(2) = {99, 102, 101, 100, 97, 123, 122, 124, 125, 98};
//+
Volume(2) = {2}; //Upper cooper
//+
Surface Loop(3) = {137, 134, 104, 135, 136, 103, 105, 118, 107, 106};
//+
Volume(3) = {3}; //Lower cooper
//+
Surface Loop(4) = {108, 119, 117, 116, 115, 121, 114, 120, 98, 103, 129, 128, 127, 130, 131, 132, 133, 126};
//+
Volume(4) = {4}; //Dielectric

//------------------------------------------------------------------------------------------------------------------------------
//Physical Bodies

Physical Volume(1) = {1};
//+
Physical Volume(2) = {2};
//+
Physical Volume(3) = {3};
//+
Physical Volume(4) = {4};
//+
//------------------------------------------------------------------------------------------------------------------------------
//Physical surfaces

Physical Surface(142) = {90};  //cathode

Physical Surface(143) = {99}; //Top electrode
Physical Surface(144) = {100}; //Top electrode
Physical Surface(145) = {101}; //Top electrode
Physical Surface(146) = {102}; //Top electrode
Physical Surface(147) = {97}; //Top electrode
Physical Surface(148) = {98}; //Top electrode
Physical Surface(149) = {122}; //Top electrode
Physical Surface(150) = {123}; //Top electrode
Physical Surface(151) = {124}; //Top electrode
Physical Surface(152) = {125}; //Top electrode

Physical Surface(153) = {103}; //Bottom electrode
Physical Surface(154) = {104}; //Bottom electrode
Physical Surface(155) = {118}; //Bottom electrode
Physical Surface(156) = {106}; //Bottom electrode
Physical Surface(157) = {105}; //Bottom electrode
Physical Surface(158) = {107}; //Bottom electrode
Physical Surface(159) = {134}; //Bottom electrode
Physical Surface(160) = {135}; //Bottom electrode
Physical Surface(161) = {136}; //Bottom electrode
Physical Surface(162) = {137}; //Bottom electrode

Physical Surface(163) = {113};  //anode

//Side boundaries 

Physical Surface(201) = {95, 102, 121, 115, 105, 109}; //side 1 
Physical Surface(202) = {92, 100, 119, 120, 107, 111};	//side 2, oposite to 1

Physical Surface(203) = {94, 101, 117, 116, 118, 110};	//side 3	
Physical Surface(204) = {96, 99, 108, 114, 106, 112};	//side 4, oposite to 3


