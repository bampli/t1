# Run scripts/setup.sh to launch cluster

k8s_yaml('./configMap.yaml')

k8s_yaml('./app/kubernetes.yaml')

#k8s_kind('Environment', image_json_path='{.spec.runtime.image}')

docker_build('t1-image', './app',
    live_update=[
        sync('./app', '/app'),
        run('cd /app && pip install -r requirements.txt',
            trigger='./app/requirements.txt')
])

k8s_resource('t1',
            port_forwards=[
                        9000,  # app
                        5678,  # debugger
            ])

k8s_yaml('./web/kubernetes.yaml')

docker_build('nginx-image', './web',
    live_update=[
        sync('./web/nginx.conf', '/etc/nginx/nginx.conf'),
        sync('./web/index.html', '/usr/share/nginx/html/index.html')
])

k8s_resource('nginx',
            port_forwards=[
                        80,  # app
            ])
