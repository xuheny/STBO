x1=1:1:200;
plot(x1,S1(1,1:200),'k');
hold on;
x2=201:1:700;
plot(x2,S1(1,201:700),'b');
hold on;
x3=701:1:1000;
plot(x3,S1(1,701:1000),'r');
hold on;


x4=1:1:1000;
plot(x4,S2(1,1:1000),'k');
hold on;
plot(x4,ones(1,1000)*0.1609,'b--');
hold on;
plot(x4,ones(1,1000)*0.0278,'r--');


x5=[0 
3 
5 
7 
12 
27 
45 
84 
103 
200
600
800
1000]';

y5=[39869.56522
30130.43478
19934.78261
13391.30435
7456.521739
4260.869565
2586.956522
1065.217391
608.6956522
456.5217391
1.96E-03
1.96E-03
1.96E-03
]';
plot(x5,y5);
hold on;

x6=[0 
7 
13 
29 
47 
57 
94 
135 
172 
256 
155 
360 
600
800
1000
]';

y6=[68782.6087
64826.08696
61326.08696
51739.13043
41543.47826
35000
22521.73913
13391.30435
7913.043478
2282.608696
913.0434783
608.6956522
2.90E-03
2.90E-03
2.90E-03
]';

plot(x6,y6);
hold on;

a=[1,2,3,4,5,6];
a1=[4.61E-07	4.40E-08	1.08E-08	4.50E-10	2.16E-12	5.56E-07];
a2=[8.72 	8.44 	8.57 	6.70 	4.76 	9.78 ];
