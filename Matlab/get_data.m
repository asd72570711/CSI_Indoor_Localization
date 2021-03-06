%%
clc;
clear;

%%
for i = 1:40
    filename = ['1006\no',num2str(i),'.dat'];
    position_num = i;
    csi_trace = read_bf_file(filename);
    average = get_original_average(csi_trace);
    fingerprint = processed(csi_trace,average,position_num);
    save_fingerprint = ['no.',num2str(position_num),'_fingerprint.txt'];
    fid = fopen(save_fingerprint,'wt');
    [m,n] = size(fingerprint);
    %fprintf(fid,'%c,',fingerprint(1,:));
    for j = 1:m
        for k = 1:n
            fprintf(fid,'%f,',fingerprint(j,k));
        end
        fprintf(fid,'\r');
    end
    fclose(fid);
end
