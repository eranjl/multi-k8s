echo "building client"
docker build -t eranjl/multi-client:latest -t eranjl/multi-client:$SHA -f ./client/Dockerfile ./client
echo "building server"
docker build -t eranjl/multi-server:latest -t eranjl/multi-server:$SHA -f ./server/Dockerfile ./server
echo "building worker"
docker build -t eranjl/multi-worker:latest -t eranjl/multi-worker:$SHA -f ./worker/Dockerfile ./worker

echo "push client ver:latest"
docker push eranjl/multi-client:latest
echo "push server ver:latest"
docker push eranjl/multi-server:latest
echo "push worker ver:latest"
docker push eranjl/multi-worker:latest

echo "push client ver:$SHA"
docker push eranjl/multi-client:$SHA
echo "push server ver:$SHA"
docker push eranjl/multi-server:$SHA
echo "push server ver:$SHA"
docker push eranjl/multi-worker:$SHA

echo "apply k8s config"
#kubectl apply -f k8s

echo "apply client latest image"
#kubectl set image deployments/client-deployment client=eranjl/multi-client:$SHA
echo "apply server latest image"
#kubectl set image deployments/server-deployment server=eranjl/multi-server:$SHA
echo "apply worker latest image"
#kubectl set image deployments/worker-deployment worker=eranjl/multi-worker:$SHA
