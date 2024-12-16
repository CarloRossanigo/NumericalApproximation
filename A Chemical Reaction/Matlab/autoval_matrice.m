clear all
close all
format shortE

A=7.89e-10;
B=1.1e7;
C=1.13e3;
M=1e6;
Mat_sist_linearizzato=[-A, 0, 0, 0; A, 0, 0, 0; A, 0, 0, C ;0, 0, 0, -C];


Autval=eig(Mat_sist_linearizzato) %-A,0,0,-C
