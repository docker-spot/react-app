docker build -t "react-app:1.0.0" .

docker run \
    -v "$(pwd)/workspace":/home/devansh0207/workspace \
    --name react-app \
    -p 3000:3000 \
    -d -it react-app:1.0.0

docker exec \
    -w /home/devansh0207/workspace/my-app \
    -it react-app bash
