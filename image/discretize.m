function [ dimg ] = discretize( img, greys )    
    dimg = zeros(size(img));
    for grey=greys
        pos = (img>grey);
        dimg(pos) = grey;
    end
end

