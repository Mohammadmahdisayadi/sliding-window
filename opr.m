function [o] = opr(patches,im_size)

%   OPR    =    Overlap Patches Recunstruction

I = patches;
F = I(1,1).position;                             % First element of patch matrix
[p,~] = size(F(:,:,1));                          % Patch size
[mm,~] = size(I);                                % Size of patch matrix
q = p/2;
o = zeros(im_size);

% Main loop 

for i = 1:mm
    for j = 1:mm
        
        o((i-1)*q+1:(i+1)*q,(j-1)*q+1:(j+1)*q,:) = o((i-1)*q+1:(i+1)*q,(j-1)*q+1:(j+1)*q,:) + I(i,j).position; 
        
    end
end



o(1:q,q+1:im_size(1)-q,:) = o(1:q,q+1:im_size(1)-q,:)./2;
o(im_size(1)-q+1:im_size(1),q+1:im_size(1)-q,:) = o(im_size(1)-q+1:im_size(1),q+1:im_size(1)-q,:)./2;
o(q+1:im_size(1)-q,1:q,:) = o(q+1:im_size(1)-q,1:q,:)./2;
o(q+1:im_size(1)-q,im_size(1)-q+1:im_size(1),:) = o(q+1:im_size(1)-q,im_size(1)-q+1:im_size(1),:)./2;
o(q+1:im_size(1)-q,q+1:im_size(1)-q,:) = o(q+1:im_size(1)-q,q+1:im_size(1)-q,:)./4;

end