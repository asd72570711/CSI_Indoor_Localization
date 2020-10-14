
function fingerprint = processed(csi_trace,average,position_num)

num = 0;

fingerprint = zeros(1,61);
phase = zeros(30,length(csi_trace));

for j = 1:length(csi_trace)
    csi_entry = csi_trace{j};
    csi_abc = get_scaled_csi(csi_entry);
    csi_c = squeeze(csi_abc(1,1,:));
    csi_db = db(abs(csi_c).');
%    if average-10 < csi_db & csi_db < average+10
        num = num + 1;
        for k = 1:30
            csi_phase = angle(csi_c(k));
            phase(k,j) = csi_phase;
        end
        
%         if 180*unwrap(phase(:,j))/pi < 181;
            
%         figure(2);plot(csi_db);
%         hold on;
%         
%         xlabel('Subcarrier index');
%         ylabel('SNR [dB]');
%         xlim([0 30]);
%         ylim([0 30]);
% 
%         figure(3);plot(180*unwrap(phase(:,j))/pi);
%         hold on;
%         
%         xlabel('Subcarrier index');
%         ylabel('Phase (deg)')
        
        pre_fingerprint = [csi_db phase(:,j)' position_num];
        fingerprint = [fingerprint;pre_fingerprint];
%         end
%    end
end

fingerprint(1,:) = [];