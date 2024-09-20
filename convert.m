function result = convert(point, inputSystem, outputSystem, conversionParams)
    globals;

    if inputSystem == coordinates.world 
        error('Conversion from world space is not supported yet')
    endif 

    if outputSystem != coordinates.viewport
        error('Conversion to any space other than viewport is not supported yet')
    endif
    
    % Convert to device
    deviceCoordinates = zeros(4, 1); 

    disp('Projection Transform')
    disp(conversionParams.projection);

    deviceCoordinates = conversionParams.projection * [point(1) point(2) point(3) 1]';

    disp('Device Coordinates')
    disp(deviceCoordinates)
    
    % Convert to viewport 
    viewport = ndcToViewportTransform(conversionParams.viewportWidth, conversionParams.viewportHeight); 
    disp('Viewport Transform');
    disp(viewport);

    result = viewport * deviceCoordinates; 

endfunction

function ndcToViewport = ndcToViewportTransform(viewportWidth, viewportHeight)
    ndcToViewport = eye(4);
    % Scaling range [-1 -1], [1 1] to [width height]
    ndcToViewport(1,1) = viewportWidth / 2;
    ndcToViewport(2,2) = viewportHeight / 2;
    ndcToViewport(3,3) = 0; % Discard z-coordinate   
    % Shift range [-1 -1], [1 1] to [0 0] and [width height]  
    ndcToViewport(1,4) = viewportWidth/2;
    ndcToViewport(2,4) = viewportHeight/2;
    ndcToViewport(3,4) = 0;
endfunction
