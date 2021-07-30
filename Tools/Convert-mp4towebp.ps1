ffmpeg -i .\"Fortiwizard New-P2PTunnel.mp4"  -vcodec libwebp -filter:v fps=20 -lossless 0  -compression_level 1 -loop 0 -s 1440:810 .\"Fortiwizard New-P2PTunnel.webp"

#removed
#-q:v 50
#-s 960:540

#notes
#vcodec Specifies output should be a webp file
#filter:v fps=20 sets the frames per second
#lossless 0 specifies lossy and 1 lossless
#compression_level the lower the number the more compressed
#loop 0 for infinity other numbers specify the loop count.
#q:v for picture quality. The lower the less quality
#s specifies the pixels width and height. Be sure to maintain the aspect ratio