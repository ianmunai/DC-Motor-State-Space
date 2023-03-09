clear
clc
close all

% -------------------STATE SPACE REP OF A DC MOTOR-----------------------

syms R Kv Kt Rm La c Jm
%define constants
R=0.05;
Kv=0.09854;
Kt=0.09584;
Rm=1.5398;
La=0.0015581;
c=0.00039719;
Jm=0.00137;

%`A is an n*n matrix where n is the number of states
% B is an n*m matrix where m is the number of inputs
% C is a p*n matrix. p is the number of outputs
% D is a p*m matrix. m is the number of inputs

  
A= [0      1       0; 
    0   -c/Jm     Kt/Jm;
    0   -Kv/La  -(Rm+R)/La];

B=[  0      1;
      0     -1/Jm; 
     1/La    0    ];
    
C=[ 0 1 0;
    1 0 0;
    0 0 Kt];

D=[ 0 0;
    0 0;
    0 0];

% [num,den]=ss2tf(A,B,C,D,1);
[num,den]=ss2tf(A,B(:,1),C(1,:),D(1,1));
%first column for B and first row for C.
sys=tf(num,den);
sysmin=minreal(sys);

%alternatively
sys1=ss(A,B,C,D);
sys2=tf(sys1)

