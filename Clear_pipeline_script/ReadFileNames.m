%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [ FullFileList ] = ReadFileNames(DataFolder, extList)
% Author: Thokare Nitin D.
%
% This function reads all file names contained in Datafolder and it's subfolders
% with extension given in extList variable in this code...
% Note: Keep each extension in extension list with length 3
% i.e. last 3 characters of the filename with extension
% if extension is 2 character length (e.g. MA for mathematica ascii file), use '.'
% (i.e. '.MA' for given example)
% Example:
% extList={'jpg','peg','bmp','tif','iff','png','gif','ppm','pgm','pbm','pmn','xcf'};
% Gives the list of all image files in DataFolder and it's subfolder
%
if nargin < 1
    DataFolder = uigetdir;
end

DirContents=dir(DataFolder);
FullFileList=[];

if ~isunix
    NameSeperator='\';
else isunix
    NameSeperator='/';
end

extList={'fdt','set','edf','raw','jpg','.sc','sph','wts'};
% Here 'peg' is written for .jpeg and 'iff' is written for .tiff
for i=1:numel(DirContents)
    if(~(strcmpi(DirContents(i).name,'.') || strcmpi(DirContents(i).name,'..')))
        if(~DirContents(i).isdir)
            extension=DirContents(i).name(end-2:end);
            if(numel(find(strcmpi(extension,extList)))~=0)
                FullFileList=cat(1,FullFileList,{[DataFolder,NameSeperator,DirContents(i).name]});
            end
        else
            getlist=ReadFileNames([DataFolder,NameSeperator,DirContents(i).name], extList);
            FullFileList=cat(1,FullFileList,getlist);
        end
    end
end

end