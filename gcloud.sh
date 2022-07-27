function gcloud_get_cluster_creds {
	gcloud container clusters list | grep -v NAME | awk '{print " echo Y | gcloud container clusters get-credentials --region "$2 " " $1 "  "}'  > /tmp/c1.sh; bash /tmp/c1.sh
}
