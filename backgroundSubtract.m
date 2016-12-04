function [background] = backgroundSubtract(framesequence, tau)
    filename = dir(strcat(framesequence, '/*.png')); 
    BG = [];
    Ipre = imread(filename(1).name);
    for i = 2: size(filename, 1)
        Ipost = imread(filename(i).name);
        tmp = Ipost;
        tmp(abs(Ipost - Ipre) > tau) = 0;
        BG = cat(3, BG, tmp);
        Ipre = Ipost;
    end
    background = mean(BG, 3);
end
