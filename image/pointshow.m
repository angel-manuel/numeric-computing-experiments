function [] = pointshow( img, s )
    factor = s/(max(max(img)));
    x = size(img, 1);
    y = size(img, 2);

    for i=1:x
        for j=1:y
            plot(i*s, -j*s, 'MarkerSize', floor(img(i, j)*factor));
        end
    end
end

