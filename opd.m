function [o] = opd(image,patch_size)

% OPD   =    Overlap Patches Decomposition

I = image;
[~,n] = size(I(:,:,1));

p = patch_size ;
q = p/2;

m = (n/q)-1;                                  % number of whole overlap patches

o.position = [];
o = repmat(o,[m m]);                          % Patches storage 

for i = 1:m
    for j = 1:m
        o(i,j).position = I((i-1)*q+1:(i+1)*q,(j-1)*q+1:(j+1)*q,:);
    end
end

end