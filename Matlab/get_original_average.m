
function average = get_original_average(csi_trace) 

sum = zeros(1,30);

for i = 1:length(csi_trace)
    csi_entry = csi_trace{i};
    csi_abc = get_scaled_csi(csi_entry);
    csi_c = squeeze(csi_abc(1,1,:));
    csi_db = db(abs(csi_c).');
    
    if csi_db(1) == -Inf
        csi_db(1) = 15;
    end
    
    for k = 1:30
        if csi_db(k) == -Inf
            csi_db(k) = csi_db(k-1);
        end
    end
        
    sum = sum + csi_db;
%     figure(1);plot(csi_db);
%     hold on;
end

average = sum/length(csi_trace);
%       
% xlabel('Subcarrier index');
% ylabel('SNR [dB]');
% xlim([0 30]);
% ylim([0 30]);

%{
for k = 1:30
    if average(k) == -Inf
        average(k) = (average(k-1)+average(k+1))/2
    end
end
%}