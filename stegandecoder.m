function msg = stegandecoder(img,key)

img = uint8(img);
[m,n,~] = size(img);

bits = [];

for i = 1:m
    for j = 1:n
        bits = [bits bitget(img(i,j,1),1)];
    end
end

bits = bits(1:floor(length(bits)/8)*8);
bits = reshape(bits,8,[])';

msg = bi2de(bits,'left-msb');
msg = uint8(msg);
msg = bitxor(msg,key);

msg = char(msg);
end
