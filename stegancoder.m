function msg = stegandecoder_Rand(img, key, seed)
    % 1. Initialize the generator with the EXACT SAME secret seed
    rng(seed);

    img = uint8(img);
    [m, n, ~] = size(img);
    total_pixels = m * n;

    % 2. Generate the exact same random sequence used during encoding
    rand_indices = randperm(total_pixels);

    % Preallocate the bits array for faster processing
    bits = zeros(1, total_pixels);

    % 3. Extract the LSB from every pixel following the random path
    for k = 1:total_pixels
        bits(k) = bitget(img(rand_indices(k)), 1);
    end

    % 4. Group the extracted bits back into 8-bit bytes
    bits = bits(1:floor(length(bits)/8)*8);
    bits = reshape(bits, 8, [])';

    % 5. Convert binary to decimal, then to uint8
    msg = bi2de(bits, 'left-msb');
    msg = uint8(msg);

    % 6. Reverse the XOR encryption using the key
    msg = bitxor(msg, key);

    % Convert back to readable text
    msg = char(msg'); 
end