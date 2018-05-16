clc
clear
close all

filename='triangle.jpg';
newSize=[100;100];
singleLineMorph(filename, [10 25; 93 25], [55 20; 55 95],newSize );
% singleLineMorph(filename,[30 81; 273 81], [50 100; 200 100],newSize);