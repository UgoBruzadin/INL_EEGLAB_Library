%This code was made by Ugo Bruzadin Nunes on 2019-04-21
%Throw this code on the a folder and run
%It will create an excel table and .mat table from all the data give to the fileMatrix variable

clc
clear

fileMatrix = dir('*.dat'); %This Matrix stores all the files, could be any format (change .dat to .txt, .csv, .xls, etc.)

TemporaryTable = {};
FinalTable = {};% this is an empty matrix for the final Matrix

for i = 1:length(fileMatrix) %runs this loop /for/ as many .dat filels in the current folder
    TemporaryTable = readtable(fileMatrix(i).name);
    FinalTable = cat(1,FinalTable,TemporaryTable); % the function cat adds the table from file #(i) to the FinalTable matrix
end %ends loop

save('FinalTable.mat','FinalTable'); %saves the table in .mat format
writetable(FinalTable,'FinalTable.xls'); %this line makes the .mat table into .xls; can be changed to any format (.csv, .txt, .dat, etc)