function gcloud_get_cluster_creds {
	gcloud container clusters list | grep -v NAME | awk '{print " echo Y | gcloud container clusters get-credentials --region "$2 " " $1 "  "}'  > /tmp/c1.sh; bash /tmp/c1.sh
}

function gcloud_clusters_all_scale_up {
	gcloud container clusters list |grep -v NAME | awk '{print " echo Y | gcloud container clusters resize --num-nodes 1 --region "$2 " " $1 " & "}'  >  /tmp/c1scale.sh; bash /tmp/c1scale.sh

}

function gcloud_clusters_all_scale_down {
	gcloud container clusters list |grep -v NAME | awk '{print " echo Y | gcloud container clusters resize --num-nodes 0 --region "$2 " " $1 " & "}'  >  /tmp/c1scale.sh; bash /tmp/c1scale.sh

}
