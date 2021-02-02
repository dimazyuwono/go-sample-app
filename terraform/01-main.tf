resource kubernetes_deployment deployment {
  metadata {
    name = local.service_name
    labels = {
      app = local.service_name
    }
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = local.service_name
      }
    }

    template {
      metadata {
        labels = {
          app = local.service_name
        }
      }

      spec {
        container {
          image = "${local.service_image}:${var.service_version}"
          name  = local.service_name

          port {
            container_port = local.service_port
          }

          resources {
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
          }

          liveness_probe {
            http_get {
              path = "/"
              port = local.service_port
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          }
        }
      }
    }
  }
}

resource kubernetes_service lb {
  metadata {
    name = "${local.service_name}-lb"
  }
  spec {
    selector = {
      app = kubernetes_deployment.deployment.metadata.0.labels.app
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}

