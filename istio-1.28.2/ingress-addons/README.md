# Ingress Addons - Istio Gateway e VirtualServices

Este diretório contém os recursos Istio (Gateway e VirtualServices) para expor externamente os addons de monitoramento do Istio.

## Recursos Criados

### Gateway (`gateway.yaml`)
Define um Gateway que aceita tráfego HTTP na porta 80 para os seguintes hosts:
- `prometheus.*`
- `grafana.*`
- `jaeger.*`
- `kiali.*`

### VirtualServices

Cada addon possui seu próprio VirtualService que roteia o tráfego para o serviço correspondente:

1. **Prometheus** (`prometheus-virtualservice.yaml`)
   - Host: `prometheus.*`
   - Porta destino: 9090

2. **Grafana** (`grafana-virtualservice.yaml`)
   - Host: `grafana.*`
   - Porta destino: 80

3. **Jaeger** (`jaeger-virtualservice.yaml`)
   - Host: `jaeger.*`
   - Porta destino: 16686

4. **Kiali** (`kiali-virtualservice.yaml`)
   - Host: `kiali.*`
   - Porta destino: 20000

## Como Usar

1. Certifique-se de que você tem o Istio instalado com o IngressGateway habilitado
2. Aplique os recursos no seu cluster:

```bash
kubectl apply -f ingress-addons/gateway.yaml
kubectl apply -f ingress-addons/prometheus-virtualservice.yaml
kubectl apply -f ingress-addons/grafana-virtualservice.yaml
kubectl apply -f ingress-addons/jaeger-virtualservice.yaml
kubectl apply -f ingress-addons/kiali-virtualservice.yaml
```

Ou aplique todos de uma vez:

```bash
kubectl apply -f ingress-addons/
```

## Acessando os Addons

Após aplicar os recursos, você pode acessar os addons através do IP/DNS do IngressGateway:

- **Prometheus**: http://prometheus.seu-dominio.com
- **Grafana**: http://grafana.seu-dominio.com
- **Jaeger**: http://jaeger.seu-dominio.com
- **Kiali**: http://kiali.seu-dominio.com

Se estiver usando localmente, você pode fazer port-forward:

```bash
# Obter o IP externo do IngressGateway
kubectl get svc istio-ingressgateway -n istio-system

# Port-forward (exemplo para Grafana)
kubectl port-forward -n istio-system svc/istio-ingressgateway 8080:80
# Acesse: http://localhost:8080
```

Com curl, você pode acessar os serviços especificando o host:

```bash
curl -H "Host: grafana.local" http://localhost:8080
curl -H "Host: prometheus.local" http://localhost:8080
curl -H "Host: jaeger.local" http://localhost:8080
curl -H "Host: kiali.local" http://localhost:8080
```

## Pré-requisitos

- Istio 1.28.2 instalado
- IngressGateway do Istio habilitado (`istio-ingressgateway`)
- Addons do Istio instalados (prometheus, grafana, jaeger, kiali)

Você pode instalar os addons com:

```bash
kubectl apply -f istio-1.28.2/samples/addons/prometheus.yaml
kubectl apply -f istio-1.28.2/samples/addons/grafana.yaml
kubectl apply -f istio-1.28.2/samples/addons/jaeger.yaml
kubectl apply -f istio-1.28.2/samples/addons/kiali.yaml
```
