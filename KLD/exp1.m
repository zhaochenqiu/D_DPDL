clear all
close all
clc


X = [1 2 3000 3 4]';
P1 = ones(5,1)/5;
P2 = [0 0 .5 .2 .3]' + eps; 
X = [];
KL = kldiv(X,P1,P2)
