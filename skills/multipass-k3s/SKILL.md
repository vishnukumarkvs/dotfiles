---
name: Multipass K3s
description: Operate, inspect, and troubleshoot the user's local Multipass k3s-vm K3s cluster, including VM access, kubeconfig, networking, workloads, and observability. Use when the user mentions Multipass, k3s-vm, K3s, this cluster, Coroot, Cilium, or the local Kubernetes setup.
metadata:
  opencode/autoinvoke: true
---

# Local Multipass + K3s environment

This is the user's primary local Kubernetes environment. Prefer these conventions when working with it, but verify live state before making changes.

## Known setup

- **VM name:** `k3s-vm`
- **Multipass image:** Ubuntu 26.04 LTS
- **Primary observed VM address:** `192.168.252.2`
- **Additional observed address:** `10.0.0.27`
- **K3s version last observed:** `v1.36.3+k3s1`
- **Kubernetes node:** `k3s-vm`, role `control-plane`
- **Host-side kubeconfig:** `$HOME/.kube/config-k3s`
- **Kubeconfig generation:** run `multipass exec k3s-vm -- sudo cat /etc/rancher/k3s/k3s.yaml` and replace the loopback server address with the VM's currently reported Multipass address before writing the config.
- **Monitoring:** the `coroot` namespace contains Coroot, ClickHouse, Prometheus, and node/cluster agents.
- **Cluster add-ons observed:** Cilium, CoreDNS, local-path-provisioner, and metrics-server in `kube-system`.

The addresses, versions, pod states, and restart counts can change. Treat the values above as context, not as current health checks; use the commands below to confirm them.

## Default access and inspection

Use the existing kubeconfig rather than changing the user's default Kubernetes context:

```sh
multipass list
KUBECONFIG="$HOME/.kube/config-k3s" k get nodes -o wide
KUBECONFIG="$HOME/.kube/config-k3s" k get pods -A
```

If the shell session is already using the dedicated config, `export KUBECONFIG=~/.kube/config-k3s` is appropriate. Do not silently overwrite or replace another kubeconfig.

Useful VM-level checks:

```sh
multipass info k3s-vm
multipass exec k3s-vm -- sudo systemctl status k3s --no-pager
multipass exec k3s-vm -- sudo journalctl -u k3s -n 100 --no-pager
```

Useful cluster checks:

```sh
KUBECONFIG="$HOME/.kube/config-k3s" k get events -A --sort-by=.lastTimestamp
KUBECONFIG="$HOME/.kube/config-k3s" k get pods -A -o wide
```

## Recovery workflow

1. Check `multipass list` and confirm `k3s-vm` is `Running` and inspect its current IPv4 address.
2. Confirm `$HOME/.kube/config-k3s` points to that current address, not necessarily the historical `192.168.252.2`.
3. Check the K3s service and node status inside the VM.
4. Inspect pod readiness, restarts, events, and logs; a high historical restart count is not by itself a failure when the pod is currently `Ready` and `Running`.
5. Investigate the specific failing workload or service before restarting anything.

## Safety rules

- Never run `multipass delete`, destroy the VM image, reinstall K3s, or regenerate/delete the kubeconfig without explicit user confirmation.
- Do not stop, restart, or reconfigure the VM merely because a health check is stale; explain the finding and ask when the action is disruptive.
- Preserve unrelated context and files, especially `$HOME/.kube/config-k3s`.
- Use `multipass exec k3s-vm -- ...` for commands inside the VM and remember that many K3s service operations require `sudo` inside the guest.
- Use the current IP from `multipass list` when troubleshooting connectivity or creating a replacement kubeconfig.

