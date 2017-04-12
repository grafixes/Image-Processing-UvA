function rotatedImage = rotateImage(image, angle, method)
    theta = deg2rad(angle);
    
    s = size(image)     
    c1 = s(2) / 2
    c2 = s(1) / 2
    
    R = [cos(theta), -sin(theta), c1;
        sin(theta), cos(theta), c2;
        0, 0, 1];
    
%     T = [1,0,;
%         0,1,0;
%         0,0,1];
%     a = round(s(2) * cos(theta) + s(1) * sin(theta))
%     b = round(s(2) * sin(theta) + s(1) * cos(theta))
    

    
    