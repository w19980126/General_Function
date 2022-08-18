filepath = uigetdir();
files = dir(filepath);
files(1:2) = [];
h = waitbar(0, 'Processing...');
for ii = 1:length(files)
    tic;
    temp = dir(fullfile(filepath,files(ii).name,'*.raw'));
    if ~isempty(temp)
        my_raw2tiff(fullfile(filepath,files(ii).name));
    end
    
    str = ['Processing...', num2str(ii)];
    waitbar(ii / length(files), h, str);
    toc;
end
close(h);
