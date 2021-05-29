export RELEASE="3.3.13"
wget https://github.com/etcd-io/etcd/releases/download/v${RELEASE}/etcd-v${RELEASE}-linux-amd64.tar.gz
tar xvf etcd-v${RELEASE}-linux-amd64.tar.gz
cd etcd-v${RELEASE}-linux-amd64
mv etcdctl /usr/local/bin
cd /etc/kubernetes/pki/etcd/
mkdir /etcd-backup


kubectl get svc
kubectl get deployment
kubectl get sts
kubectl delete sts db
kubectl delete deploy test
kubectl delete svc redis svc1
kubectl get sts


cd /var/lib
rm -rf etcd

ETCDCTL_API=3 etcdctl snapshot restore /etcd-backup/etcd-snapshot-latest.db --initial-cluster etcd-restore=https://10.128.0.34:2380 --initial-advertise-peer-urls=https://10.128.0.34:2380 --name etcd-restore --data-dir /var/lib/etcd

kubectl get services
kubectl get sts
kubectl get deploy
