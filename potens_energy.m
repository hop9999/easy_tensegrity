clc
clear all
close all

x = sym('x',[2,1]);
x1 = sym('x1',[2,1]);
x2 = sym('x2',[2,1]);
x3 = sym('x3',[2,1]);
l = sym('l',[3,1]);
k = sym('k',[3,1]);

P1 =  k(1)*(norm(x1 - x) - l(1))
P2 =  k(2)*(norm(x2 - x) - l(2))
P3 =  k(3)*(norm(x3 - x) - l(3))
P = P1 + P2 + P3