vcl 4.0;

import directors;

backend server_rails {
     .host = "127.0.0.1";
     .port = "8080";
}

sub vcl_init {
  new load_balancing_servers = directors.random();
  load_balancing_servers.add_backend(server_rails,10);
}

sub vcl_recv {
     if (req.method != "GET"   &&
       req.method != "HEAD"    &&
       req.method != "PUT"     &&
       req.method != "POST"    &&
       req.method != "TRACE"   &&
       req.method != "OPTIONS" &&
       req.method != "DELETE") {
         return (pipe);
     }

     if ((req.method == "POST" || req.method == "PUT") &&
       req.http.transfer-encoding ~ "chunked") {
         return(pipe);
     }

     if (req.method != "GET" && req.method != "HEAD") {
         return (pass);
     }

     if (req.http.Accept-Encoding) {
        if (req.url ~ "\.(jpg|jpeg|bmp|swf|png|gif|gz|tgz|bz2|tbz|mp3|ogg|ico|pdf|cur)$") {
            # No point in compressing these
            unset req.http.Accept-Encoding;
        } elsif (req.http.Accept-Encoding ~ "gzip") {
            set req.http.Accept-Encoding = "gzip";
        } elsif (req.http.Accept-Encoding ~ "deflate") {
            set req.http.Accept-Encoding = "deflate";
        } else {
            unset req.http.Accept-Encoding;
        }
     }

     set req.backend_hint = load_balancing_servers.backend();
     unset req.http.Cookie;

     return (hash);
}

sub vcl_pipe {
    return (pipe);
}

sub vcl_pass {
    return (fetch);
}

sub vcl_backend_response {
  #  set beresp.grace = 1h;
     set beresp.ttl = 5m;

    if (beresp.status != 200 && beresp.status != 403 && beresp.status != 404 && beresp.status != 301 && beresp.status != 302 && beresp.status != 503) {
     # set beresp.saintmode = 10s;
        return (retry);
    }
    unset beresp.http.set-cookie;
    return (deliver);
}

sub vcl_hash {
  hash_data(req.url);
    if (req.http.host) {
      hash_data(req.http.host);
    } else {
      hash_data(server.ip);
    }
    return (lookup);
}

sub vcl_deliver {
  unset resp.http.X-Varnish;
  unset resp.http.via;
  unset resp.http.Age;

  if (obj.hits > 0) {
    set resp.http.Cache = "H";
  }
  else {
    set resp.http.Cache = "M";
  }
  return (deliver);
}

sub vcl_hit {
  return (deliver);
}

sub vcl_miss {
  return (fetch);
}

sub vcl_backend_error {
     set beresp.http.Content-Type = "text/html; charset=utf-8";
     set beresp.http.Retry-After = "5";
     synthetic({"
 <?xml version="1.0" encoding="utf-8"?>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html>
   <head>
     <title>"} + beresp.status + " " + beresp.reason + {"</title>
   </head>
   <body>
     <h1>Error "} + beresp.status + " " + beresp.reason + {"</h1>
     <p>"} + beresp.reason + {"</p>
     <h3>Guru Meditation:</h3>
     <p>XID: "} + bereq.xid + {"</p>
     <hr>
     <p>Squid cache server</p>
   </body>
 </html>
 "});
     return (deliver);
}

sub vcl_synth {
     set resp.http.Content-Type = "text/html; charset=utf-8";
     set resp.http.Retry-After = "5";
     synthetic({"
 <?xml version="1.0" encoding="utf-8"?>
 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
 <html>
   <head>
     <title>"} + resp.status + " " + resp.reason + {"</title>
   </head>
   <body>
     <h1>Error "} + resp.status + " " + resp.reason + {"</h1>
     <p>"} + resp.reason + {"</p>
     <h3>Guru Meditation:</h3>
     <p>XID: "} + req.xid + {"</p>
     <hr>
     <p>Squid cache server</p>
   </body>
 </html>
 "});
  return (deliver);
}

sub vcl_fini {
  return (ok);
}
