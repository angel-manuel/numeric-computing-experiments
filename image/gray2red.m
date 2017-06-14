function [ rimg ] = gray2color( gimg )
    s = size(gimg);
    rimg = zeros([s 3], 'uint8');
    rimg(:,:,1)=gimg;
end

