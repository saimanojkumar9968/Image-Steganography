function output = stegancoder(img,msg,key)

msg = uint8(msg);
msg = bitxor(msg,key);

img = uint8(img);
[m,n,~] = size(img);

msg_len = length(msg);
msg_bin = de2bi(msg,8,'left-msb');
msg_bin = msg_bin';
msg_bin = msg_bin(:);

k = 1;

for i = 1:m
    for j = 1:n
        if k <= length(msg_bin)
            img(i,j,1) = bitset(img(i,j,1),1,msg_bin(k));
            k = k + 1;
        end
    end
end

output = img;
end
