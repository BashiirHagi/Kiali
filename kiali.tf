resource "helm_release" "kiali" { 

name = "kiali-operator" 

repository = "https://kiali.org/helm-charts/" 

chart = "kiali-operator" 

namespace = kubernetes.namespace.kiali.metadata[0].name 

version = "1.55.1" 

 
 

set { 

name = "cr.create" 

value = "true" 

} 

set { 

name = "image.tag" 

value = "v1.55.1" 

} 

set { 

name = "cr.spec.deployment.ingress.class_name" 

value = "internal-tooling" 

} 

set { 

name = "cr.server.web_root" 

value = "/kiali" 

} 

depends_on = [ 

helm_release.istiod, 

] 

} 
