function clipCoordinates = clipSpaceLine(lineWidth, endPointA, endPointB, ...
        worldBounds, modelMatrix, viewMatrix, windowWidth, windowHeight)
    
    globals;
    points = [endPointA; endPointA; endPointB; endPointB]';
    dirs = [endPointB - endPointA; endPointA - endPointB; endPointB - endPointA; endPointA - endPointB]';
    for i = 1 : 4
        dirs(:,i) /= norm(dirs(:,i));
    end

    % Get aspect corrected view bounds
    [eyeMin, eyeMax] = getBoundsInCameraSpace(worldBounds(1,:), worldBounds(2,:), viewMatrix, windowWidth, windowHeight);
    
    % Compute projection matrix
    projectionMatrix = ortho(eyeMin, eyeMax, windowWidth/windowHeight, csys.right, csys.left); 
    
    % Convert inputs to to clip space
    clipPoints = zeros(4, 4);
    clipDirs = zeros(4, 4);

    for i = 1 : 4
        clipPoints(:,i) =  projectionMatrix * viewMatrix * modelMatrix * [points(:,i); 1];
        clipDirs(:,i) =  projectionMatrix * viewMatrix * modelMatrix * [dirs(:,i); 0];
    end
    
    clipCoordinates = zeros(4, 4);
    for i = 1 : 4
        clipCoordinates(:,i) = clipPoints(:,i) + ...
            getWidthInClipSpace(windowWidth, windowHeight, lineWidth) * ...
            getNormal(clipDirs(:,i));
    end

endfunction

function normal = getNormal(direction)
    if abs(dot(direction, [0 0 1 0]') - 1) < 1e-6
        normal = [1 0 0 0]';
    else
        normal = [-direction(2) direction(1) 0 0]';
    endif
endfunction

function width = getWidthInClipSpace(windowWidth, windowHeight, lineWidthPixels)
    width = lineWidthPixels * (2 / windowWidth);
endfunction

function [eyeMin, eyeMax] = getBoundsInCameraSpace(worldMin, worldMax, viewMatrix, windowWidth, windowHeight)
    eyeMin = viewMatrix * [worldMin, 1]';
    eyeMax = viewMatrix * [worldMax, 1]';
    eyeMin(2) *= windowWidth / windowHeight;
    eyeMax(2) *= windowWidth / windowHeight;
endfunction
