% author: Ugo Bruzadin nunes on 8/7/2019
% using a script made by author Thokare Nitin D.
% found on the web.
% add scripts ClearPipeline, ReadFilenames and ReadJustNames to a folder
% and it will move all files with extensions defined below
% to a folder called OLD in the this folder.
% good to clear pipelines!

clc
clear

extList={'fdt','set','edf','raw','jpg','.sc','sph','wts','xls','asv','mat'};
ThisFolder = pwd;
FileList = ReadJustNames(ThisFolder, extList);
FullFileList = ReadFileNames(ThisFolder, extList);

if numel(FileList)~=0
    
    t = [datetime('now')];
    DateString = datestr(t);
    newOld = strcat('\OLD', DateString);
    newOld = strrep(newOld,' ','-');
    newOld = strrep(newOld,':','-');

    try mkdir (ThisFolder, newOld)
    catch
    end

    DumpFolder = strcat(ThisFolder, newOld, '\');

   
    save('OriginalListOfFiles.mat','FullFileList'); %saves the table in .mat format
    writecell(FullFileList,'OriginalListOfFiles.xls'); %this line makes the .mat table into .xls; can be changed to any format (.csv, .txt, .dat, etc)  
    for i=1:numel(FileList)
        TF = contains(FullFileList(i).name,'OLD')
        if TF == 0
            DumpedFile = strcat(DumpFolder, FileList{i});
            if(strcmpi(DumpedFile,FullFileList{i})==0)
                movefile (FullFileList{i}, DumpedFile);
            end
        end    
    end    
end
