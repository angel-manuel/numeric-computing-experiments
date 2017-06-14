function [ rimg ] = gray2color( gimg, color )
    s = size(gimg);
    rimg = zeros([s 3], 'uint8');
    rimg(:,:,color)=gimg;
end

