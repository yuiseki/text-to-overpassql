
TARGETS = \
	tmp/raphael-sch/OverpassNL/dataset/dataset.train.query \
	tmp/raphael-sch/OverpassNL/comments.jsonl \
	tmp/yuiseki/TRIDENT/tridentDeepExampleList.jsonnl \
	tmp/yuiseki/TRIDENT/tridentInnerExampleList.jsonnl

all: $(TARGETS)

tmp/raphael-sch/OverpassNL/OverpassNL_v1.zip:
	mkdir -p $(dir $@)
	curl -o $@ https://raw.githubusercontent.com/raphael-sch/OverpassNL/main/dataset/OverpassNL_v1.zip

tmp/raphael-sch/OverpassNL/dataset/dataset.train.query: tmp/raphael-sch/OverpassNL/OverpassNL_v1.zip
	mkdir -p $(dir $@)
	unzip tmp/raphael-sch/OverpassNL/OverpassNL_v1.zip -d tmp/raphael-sch/OverpassNL/

tmp/raphael-sch/OverpassNL/comments.zip:
	mkdir -p $(dir $@)
	curl -o $@ https://raw.githubusercontent.com/raphael-sch/OverpassNL/main/dataset/comments.zip

tmp/raphael-sch/OverpassNL/comments.jsonl: tmp/raphael-sch/OverpassNL/comments.zip
	mkdir -p $(dir $@)
	unzip tmp/raphael-sch/OverpassNL/comments.zip -d tmp/raphael-sch/OverpassNL/

tmp/yuiseki/TRIDENT/tridentDeepExampleList.jsonnl:
	mkdir -p $(dir $@)
	curl -o $@ https://raw.githubusercontent.com/yuiseki/TRIDENT/main/public/data/tridentDeepExampleList.jsonnl

tmp/yuiseki/TRIDENT/tridentInnerExampleList.jsonnl:
	mkdir -p $(dir $@)
	curl -o $@ https://raw.githubusercontent.com/yuiseki/TRIDENT/main/public/data/tridentInnerExampleList.jsonnl
