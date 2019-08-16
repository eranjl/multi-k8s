docker build -t eranjl/multi-client:latest -t eranjl/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t eranjl/multi-server:latest -t eranjl/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t eranjl/multi-worker:latest -t eranjl/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push eranjl/multi-client:latest
docker push eranjl/multi-server:latest
docker push eranjl/multi-worker:latest

docker push eranjl/multi-client:$SHA
docker push eranjl/multi-server:$SHA
docker push eranjl/multi-worker:$SHA

kubectl apply -f k8s

