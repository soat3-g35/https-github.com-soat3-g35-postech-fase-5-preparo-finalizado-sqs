output "cluster_connection_string" {
  value = split("//", mongodbatlas_cluster.main.connection_strings.0.standard_srv)[1]
}
