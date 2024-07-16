docker-build:
	docker build -t kempner_institute/kempner_hpc_book -f ./Docker/Dockerfile .
	docker run --rm -v $$PWD:/usr/src/app kempner_institute/kempner_hpc_book jupyter-book build kempner_hpc_handbook

