function [ simg ] = step( img, s )
    simg = 255.*(img>s);
end

