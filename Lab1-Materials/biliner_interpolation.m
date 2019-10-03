% Beacuse this question just ask us to amplify image in to 2 times as size as original image.
% So I think we can simplify this question into calculate mean of 2 point.
% Of course, we must use biliner interpolation, because it is a 3 dimension model.
% In addition, I expand this function into normal situation.

%      example:
%
%      1 3     -->   1 0 3 0  --> 1 0 1 0 --> 1 1 1 0 -->  1 1 1 1
%      3 3           0 0 0 0      2 0 2 0     2 2 2 0      2 2 2 2
%                    3 0 3 0      3 0 3 0     3 3 3 0      3 3 3 3
%                    0 0 0 0      0 0 0 0     0 0 0 0      3 3 3 3

function zoom_out_image = biliner_interpolation(original_image)

    zoom_out_image = zeros(2 * size(original_image))
    [m, n] = size(zoom_out_image)

    for i = 1:2:m

        for j = 1:2:n
            zoom_out_image(i, j) = original_image((i + 1) / 2, (j + 1) / 2);
        end

    end

    for i = 2:2:m - 1
        zoom_out_image(i, :) = (zoom_out_image(i - 1, :) + zoom_out_image(i + 1, :)) ./ 2;
    end

    for j = 2:2:m - 1
        zoom_out_image(:, j) = (zoom_out_image(:, j - 1) + zoom_out_image(:, j + 1)) ./ 2;
    end

    %     padding block
    zoom_out_image(end, :) = zoom_out_image(end - 1, :);
    zoom_out_image(:, end) = zoom_out_image(:, end - 1);
    zoom_out_image(end, end) = zoom_out_image(end - 1, end - 1);
end
