PWD_WO_HOME = $(shell pwd | sed -e "s/\/home\/[a-z]*\///g")
SCENE_NAME = $(shell pwd | sed -e "s/.*\///g")

ffmpeg:
	ffmpeg -r 60 -start_number 1 -i out/${SCENE_NAME}_%03d.jpg -c:v libx264 \
	    -strict experimental -tune fastdecode -pix_fmt yuv420p -b:v 1500k out/out.mp4
render:
	mkdir -p out
	povray *.ini

update_environment:
	rsync -r -v \
	    --cvs-exclude \
	    --exclude="scenes/*/*.png" \
	    --exclude="slides/" \
	    --exclude="*.mp4" \
	    ../../  grapefruit:ivc/

render_on_server:
	rsync -r -v . grapefruit:ivc/scenes/
	ssh grapefruit "cd ivc/scenes/$(SCENE_NAME) && make render && make ffmpeg"
	rsync -r -v  grapefruit:$(PWD_WO_HOME)/*.mp4 .

test:
	povray $(SCENE_NAME).ini

foo:
	echo $(PWD_WO_HOME)
	echo $(SCENE_NAME)

clean:
	rm -rf out/*.png
