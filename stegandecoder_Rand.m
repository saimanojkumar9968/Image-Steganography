function output = stegandecoder_Rand(img,key,seed)
rng(seed)
output = stegandecoder(img,key);
end
