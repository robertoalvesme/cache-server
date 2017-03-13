backend default {
    .host = "{{ varnish_backend_ip }}";
    .port = "{{ varnish_backend_port }}";
}