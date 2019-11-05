%%%%%%%%%%%%%%%%%%%%
% VCMTnaming.m
% crops and renames files to the qa.vet-amt.com format
% 08/2015 mackenzie sunday
%%%%%%%%%%%%%%%%%%%%

close all;
clear all;

D = dir('./*.jpg');

fprintf('cropping!\n');
fnames = {D.name};
for i=1:length(fnames)
    img = imread(fnames{i}); 
    imname = fnames{i};
    img2 = imcrop(img,[0 0 720 540]); % [xmin, ymin, width, height]
    imwrite(img2,[fnames{i}]);
end
fprintf('finished cropping!\n');

for c=1
    sections = 3; % number of sections
    isi = 1000; % inter-stimulus interval
    limit = 2000; % time the study slide will be presented
    countStart = 10; % trial before you want to start labeling
    % read in text file
    [CR] = textread('zig2long.txt','%u');
    files = dir('*.jpg');
    
    for i=1:length(files)
        [pathname,filename,extension] = fileparts(files(i).name);
        %create new name
        
        if i == 1 || i == 66 || i == 131 || i == 196 || i == 261 || i == 326 || i == 391 || i == 456
            newFilename = ['trial_' num2str(i+10)];
        elseif i > 1 && i < 66
            if mod(i,2) == 1 %if it a response trial (odd)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-1)/2))];
             else % if it's a study (even) trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            end
        elseif i > 66 && i < 131
            if mod(i,2) == 0 %if it a response trial (even)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-2)/2))];
            else % if it's a study (odd) trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];
                end
        elseif i > 131 && i < 196
             if mod(i,2) == 1 %if it a response trial (odd)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-3)/2))];
             else % if it's a study (even) trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
             end
        elseif i > 196 && i < 261
             if mod(i,2) == 0 %if it a response trial (even)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-4)/2))];
             else % if it's a study (odd) trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];
             end
        elseif i > 261  && i < 326
              if mod(i,2) == 1 %if it a response trial (odd)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-5)/2))];
             else % if it's a study (even) trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
              end
        elseif i > 326  && i < 391 
              if mod(i,2) == 0 %if it a response trial (even)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-6)/2))];
              else % if it's a study (odd) trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];
              end
        elseif i > 391 && i < 456
             if mod(i,2) == 1 %if it a response trial (odd)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-7)/2))];
             else % if it's a study (even) trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
              end
        end
    
                
movefile([filename extension], [newFilename extension]);
    end
end
fprintf('finished naming trials!\n');