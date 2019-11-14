function entropy_value = my_entropy(I)

% check parameters
% I = ParseInputs(varargin{:});

% convert 0-1 to 0-255
if ~islogical(I)
    I = im2uint8(I);
end

% calculate histogram counts
pixel_value = imhist(I(:));

% remove zero in p
pixel_value(pixel_value==0) = [];

% normalize p so that sum(p) is one.
p = pixel_value ./ numel(I);

entropy_value = -sum(p.*log2(p));

%     % check parameters
%     function I = ParseInputs(varargin)
%         
%         narginchk(1,1);
%         
%         validateattributes(varargin{1},{'uint8','uint16', 'double', 'logical'},...
%             {'real', 'nonempty', 'nonsparse'},mfilename, 'I',1);
%         
%         I = varargin{1};
%         
%     end
end