function uncertainty = estimate_noise(data,noise)
z=length(data(1,:));
for i=1:length(data(:,1))
    for i1 = 1:(length(data(1,:))-1);
    uncertainty(i,i1) = sqrt((noise(1, i1)/data(i, i1))^2 + (noise(1,z)/data(i,z))^2);
   
    end
end
