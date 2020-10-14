% fid1 = fopen('no.1_fingerprint.txt','r');
% fid2 = fopen('no.2_fingerprint.txt','r');
% txt1 = fread(fid1);
% txt2 = fread(fid2);
% 
% fid3 = fopen('fingerprints.txt','w');
% fwrite(fid3,txt1);
% fwrite(fid3,txt2);
% 
% fclose(fid1);
% fclose(fid2);
% fclose(fid3);

clc;clear;

fid_final = fopen('fingerprints.txt','w');

for i = 1:40
    fid = fopen(['no.',num2str(i),'_fingerprint.txt'],'r');
    if fid ~= -1
        txt = fread(fid);
        fwrite(fid_final,txt);
        fclose(fid);
    end
end

fclose(fid_final);