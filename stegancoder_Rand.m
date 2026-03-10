function output = stegancoder_Rand(img, msg, key, seed)
    % 1. Initialize the random number generator with the secret seed
    rng(seed);

    % 2. Convert message to uint8 and apply XOR encryption
    msg = uint8(msg);
    msg = bitxor(msg, key);
    
    img = uint8(img);
    [m, n, ~] = size(img);
    total_pixels = m * n;

    % 3. Convert the encrypted message to a flat binary array
    msg_bin = de2bi(msg, 8, 'left-msb')';
    msg_bin = msg_bin(:);
    msg_len = length(msg_bin);

    % Ensure the message actually fits inside the image
    if msg_len > total_pixels
        error('Message is too large to hide in this image resolution.');
    end

    % 4. Generate a random, unique sequence of pixel locations
    rand_indices = randperm(total_pixels);

    output = img;

    % 5. Embed the message bits exclusively at the randomly selected locations
    for k = 1:msg_len
        % We use linear indexing to target the first color channel
        output(rand_indices(k)) = bitset(output(rand_indices(k)), 1, msg_bin(k));
    end
end