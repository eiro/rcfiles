# more explore: http://forums.fedoraforum.org/showthread.php?t=209227
# mb_video () {
# 	FFMPEG_PATH=$(which ffmpeg) || return 
# 	if ! [[ -n "$2" ]] {
# 		print -u2 '
# 		usage: mb_video input output 
# 		'
# 		return
# 	} 
# 	INPUT="$1"
# 	OUTPUT="$2"
# 	VIDEO_CODEC="mpeg2video"
# 	VIDEO_BITRATE="4096k"
# 	VIDEO_FRAMERATE="25"
# 	AUDIO_CODEC="mp2"
# 	AUDIO_BITRATE="192k"
# 	AUDIO_SAMPLERATE="44100"
# 	AUDIO_CHANNELS="2"
# 	FORMAT="dvd"
# 
# 	exec "${FFMPEG_PATH}" -i "${INPUT}" -vcodec ${VIDEO_CODEC} -b ${VIDEO_BITRATE} \
# 	-r ${VIDEO_FRAMERATE} -acodec ${AUDIO_CODEC} -ab ${AUDIO_BITRATE} -ar ${AUDIO_SAMPLERATE} \
# 	-ac ${AUDIO_CHANNELS} -f ${FORMAT} - > "${OUTPUT}"
# }
# 
# # transcoded file is PS3 ready (share it with mediatomb or maybe ushare)
# # script ripped from mediatomb default config.
# mediatomb_vlcmpeg () {
#     local src=$1 dest=$2 
#     shift 2 
#     vlc -I dummy $@ --sout \
#     '#transcode{overlay,venc=ffmpeg,vcodec=mp2v,vb=4096,fps=25,aenc=ffmpeg,acodec=mpga,ab=192,samplerate=44100,channels=2}:standard{access=file,mux=ps,dst='$dest'}' $src \
#     vlc:quit
# } 
# 
# # for i in *.avi; do
# # ffmpeg -i $i -vcodec png -vframes 1 -an -f rawvideo -s 320×240 $i.png
# # echo “<a href=”$i”><img src=”$i.png” /></a>” >> index.html
# # done
# 
# avi_share () { mediatomb_vlcmpeg $1 ~/multimedia/share/${2:-$1} }
# 
# # VLC transcoding functions {{{
# # Usage:
# # vlc_sout_part '#transcode'    \
# #     vcodec=mp4v vb=168 fps=15  \
# #     scale=0.909090 deinterlace  \
# #     acodec=mp4a ab=32 channels=2 \
# #     samplerate=22100
# # sout=:sout=$vlc_sout_part
# # 
# # vlc_sout_part :std access=file mux=mp4 dst=carioca.avi
# # sout+=$vlc_sout_part
# # vlc_batch -vvv 00_la_carioca.flv -Idummy $sout
# 
# vlc_batch () { vlc -Idummy "$@" vlc://quit }
# vlc_sout_part () {
#     local name=$1 k v 
#     shift
#     vlc_sout_part="$name{${(j:,:)@}}"
# }
# flv2mp3 () {
# 	vlc_batch $1 --sout "#transcode{acodec=mp3}:standard{access=file,dst='$1.mp3',mux=ogg}" # ,select='novideo'"
# }
# avi2ps3 () {
#     # vlc $1 --sout "#transcode{vcodec=mp4v,acodec=mp4a}:standard{access=file,dst='${1%.???}mp4',mux=ts}"
#     # vlc $1 --sout='#transcode{vcodec=h264,vb=1024,acodec=mp4a,ab=192,channels=2,deinterlace}:standard{access=file,mux=ts,dst='"$1"'.mpg}' 
#     vlc $1 --sout='#transcode{vcodec=h264,acodec=mp4a}:standard{access=file,mux=ts,dst='"$1"'.mpg}' 
# }
# 
# # }}}
# thumbnail_vlc () {
# 	# from http://wiki.videolan.org/How_to_create_thumbnails
# 	# http://wiki.videolan.org/Documentation:Play_HowTo/Advanced_Use_of_VLC
# 	# vlc --help && vlc --longhelp  && vlc --advanced 
# 	# TODO: create a movie border (gimp-fu?)
# 	local tmp=/tmp/thumbnail.$( date +%s ).$$
# 	vlc --noaudio -Idummy \
# 		-V image --image-out-format jpg --image-out-ratio ${vlc_ratio:-24} \
# 		--start-time 0 --stop-time 1 \
# 		--image-out-{replace,prefix} $tmp  $1  \
# 		vlc://quit &&
# 			convert -sample '%30%' $tmp.jpg $2 &&
# 			rm $tmp.jpg
# }
# 
# thumbnail_magick () {
# 	local default='10%'
# 	convert -sample ${geometry:-$default} $1 $2
# }
# 
# thumbnail_gnome () {
# 	local default='10%'
# 	convert -sample ${geometry:-$default} $1 $2
# }
#  
# thumbnail_auto () {
# 	local input=$1
# 	local ext=${input##*.} cmd
# 	
# 	# zsh doc!
# 	# local thumb=${2:-${input%/*}/thumb/${input##*/}}
# 	# buggé parceque si input=a.jpg, le ${input%/*} est toujours a.jpg
# 	# use $input:h 
# 	#
# 	# exemple d'utilisation
# 	# for f (*(.) ) {
# 	#    thumb=$(thumbnail_auto $f) &&
# 	#       print '<a href="'$f'"><img src="'$thumb'"/>('$(ls -sh $f)')</a><br/>'
# 	# } > foo'
# 	
# 	local thumb=${2:-$input:h/thumb/$input:t} 
# 	case "$ext" {
# 		((#i)(avi|mpg|mpeg|mov))
# 			thumb=$thumb.jpg
# 			if {which gnome-video-thumbnailer} {
# 				cmd=gnome
# 			} else  {
# 				cmd=vlc
# 			}
# 		;;
# 		((#i)(jpeg|jpg|png))
# 			cmd=magick
# 		;;
# 		(*)
# 			print -u2 "no thumbnail command found for $input"
# 			return 1
# 		;;
# 	}
# 	[[ -e $thumb ]] || thumbnail_$cmd $input $thumb
# 	print $thumb &&
# 	return 0
# }
