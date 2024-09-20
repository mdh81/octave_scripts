function orthoMatrix = ortho(eyeMin, eyeMax, aspectRatio, inputSystem, outputSystem)
    globals;
    orthoMatrix = eye(4);
    eyeMin(2) *= aspectRatio;
    eyeMax(2) *= aspectRatio;
    orthoMatrix(1,1) = 2 / (eyeMax(1) - eyeMin(1));
    orthoMatrix(2,2) = 2 / (eyeMax(2) - eyeMin(2));
    orthoMatrix(3,3) = 2 / (eyeMax(3) - eyeMin(3));
    orthoMatrix(1,4) = -(eyeMin(1) + eyeMax(1)) / (eyeMax(1) - eyeMin(1));  
    orthoMatrix(2,4) = -(eyeMin(2) + eyeMax(2)) / (eyeMax(2) - eyeMin(2));  
    orthoMatrix(3,4) = -(eyeMin(3) + eyeMax(3)) / (eyeMax(3) - eyeMin(3));  
    if inputSystem != outputSystem 
        orthoMatrix(3,3) *= -1;
        orthoMatrix(3,4) *= -1;
    endif
endfunction
