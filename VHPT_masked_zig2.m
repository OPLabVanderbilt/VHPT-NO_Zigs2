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
    limit = 1000; % time the study slide will be presented
    countStart = 10; % trial before you want to start labeling
    % read in text file
    [CR] = textread('zig2long.txt','%u');
    files = dir('*.jpg');
    
    for i=1:length(files)
        [pathname,filename,extension] = fileparts(files(i).name);
        %create new name
        
        if i == 1 || i == 98 || i == 195 || i == 292 || i == 389 || i == 486 || i == 583 || i == 680
            newFilename = ['trial_' num2str(i+10)];
        elseif i > 1 && i < 98
            if mod(i,3) == 2 %study trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 0 %mask
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 1 %if it a response trial (odd)                
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-1)/3))];
            end
          
        elseif i > 98 && i < 195
            if mod(i,3) == 0 %study trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 1 %mask
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 2 %if it a response trial (even)
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-2)/3))];        
                end
        elseif i > 195 && i < 292
             if mod(i,3) == 1 %study trial
            newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 2
               newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 0             
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-3)/3))];      
            end
        elseif i > 292 && i < 389
             if mod(i,3) == 2 %study trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 0 %mask
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 1 %if it a response trial (odd)                
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-4)/3))];               
             end            
        elseif i > 389  && i < 486
             if mod(i,3) == 0 %study trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 1 %mask
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 2 %if it a response trial (even)
            newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-5)/3))];       
            end
        elseif i > 486  && i < 583             
             if mod(i,3) == 1 %study trial
            newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 2
               newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 0   
             newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-6)/3))];     
            end
        elseif i > 583 && i < 680
             if mod(i,3) == 2 %study trial
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 0 %mask
                newFilename = ['trial_' num2str(countStart+i) '_isi-' num2str(isi) '_limit-' num2str(limit)];  
            elseif mod(i,3) == 1 %if it a response trial (odd)                 
                newFilename =  ['trial_' num2str(countStart+i) '_sections-' num2str(sections) '_correct-' num2str(CR((i-7)/3))];
            
              end
        end
    
                
movefile([filename extension], [newFilename extension]);
    end
end
fprintf('finished naming trials!\n');