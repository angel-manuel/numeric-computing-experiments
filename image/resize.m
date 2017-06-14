function [ rsimg ] = resize( img, rs )
    rsimg = zeros(rs, 'uint8');
    s = size(img);
    
    ds = (s./rs);
    div = ds(1)*ds(2);
    
    for x=1:s(1)
        for y=1:s(2)
            rx = ceil(x/ds(1));
            ry = ceil(y/ds(2));
            rsimg(rx, ry) = rsimg(rx, ry) + img(x, y)/div;
        end
    end
end

