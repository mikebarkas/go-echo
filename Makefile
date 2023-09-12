#
start-roach:
	docker run -d --name roach --hostname db --network roachnet -p 26257:26257 -p 8080:8080 \
	-v roach:/cockroach/cockroach-data \
	cockroachdb/cockroach:latest-v23.1 start-single-node \
	--insecure

#
# Create a database and user after db container startup.
#
# docker exec -it roach ./cockroach sql --insecure
# create database mydb;
# create user totoro;
# grant all on database mydb to totoro;

run-server:
	docker run -it --rm -d --network roachnet --name echo-server -p 80:8080 \
	-e PGUSER=totoro \
	-e PGPASSWORD=pass \
	-e PGHOST=db \
	-e PGPORT=26257 \
	-e PGDATABASE=mydb \
	go-echo-echo-roach