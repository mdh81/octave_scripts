function convert(point, inputSystem, outputSystem, conversionParams)
    globals;

    if inputSystem != coordinates.device || outputSystem != coordinates.viewport
        error('convert is currently only capable of converting from device to viewport coordinates')
    endif
    checkConversionParams(conversionParams);

    % TODO: Expand conversionParams to include projection matrix

    % compute orthographic projection matrix
    aspectRatio = conversionParams.windowWidth / conversionParams.windowHeight;
    eyeMin = [ conversionParams.eyeMin(1) conversionParams.eyeMin(2) * aspectRatio conversionParams.eyeMin(3) ];
    eyeMax = [ conversionParams.eyeMax(1) conversionParams.eyeMax(2) * aspectRatio conversionParams.eyeMax(3) ];
    projectionMatrix = ortho(eyeMin, eyeMax, csys.right, csys.left);
    disp(projectionMatrix);
    
    % ndc to viewport transformation


endfunction

function ndcToViewportTransform(viewportWidth, viewportHeight)
    ndcToViewport = eye(4)
    ndcToViewport(1,1) =  

endfunction
