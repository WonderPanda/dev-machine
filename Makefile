build:
	docker image build -t linux-commandline .

run:
	docker run --rm -it linux-commandline bash
