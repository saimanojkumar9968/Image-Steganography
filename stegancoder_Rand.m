function output = stegancoder_Rand(img,msg,key,seed)
rng(seed)
output = stegancoder(img,msg,key);
end
