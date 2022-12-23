Namespaces.tf 

resource "kubernetes_namespace" "kiali" { 

metadata { 

name = "kiali-operator" 

} 

 
 

lifecycle { 

prevent_destroy = true 

} 

} 

 

 
