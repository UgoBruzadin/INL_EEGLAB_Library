clc
clear
path1 = pwd;
%cd ..
path2 = pwd;
%cd(path1);
FileList = dir('*.set');
for i=1:length(FileList)
    EEG = pop_loadset(FileList(i).name, path1,  'all','all','all','all','auto');
    NumICs = num2str(size(EEG.icaweights,1))
    NumEpochs = num2str(EEG.trials)
    EEG = pop_saveset(EEG, [FileList(i).name(1:end-4),'_ICs',NumICs,'EPs',NumEpochs,'.set'], path2);
end